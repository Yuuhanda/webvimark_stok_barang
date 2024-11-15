<?php

namespace app\controllers;

use app\models\ItemSearch;
use app\models\ItemUnit;
use app\models\Employee;
use app\models\User;
use app\models\Lending;
use app\models\LendingSearch;
use app\models\UnitSearch;
use app\models\UploadPicture;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ArrayDataProvider;
use Yii;
use app\models\Warehouse;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

/**
 * LendingController implements the CRUD actions for Lending model.
 */
class LendingController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
    	return [
    		'ghost-access'=> [
    			'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
    		],
    	];
    }

    /**
     * Lists all Lending models.
     *
     * @return string
     */
    public function actionIndex()
    {
        // Create the search model and load the request data
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // Render the view with the search model and data provider
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    
    public function actionLoanUnit($id_item)
    {
        $model = new \app\models\Lending();
        $employee = \app\models\Employee::find()->all();
        $unitmodel = new \app\models\ItemUnit();
        $avalunit = $unitmodel->getAvailableUnit($id_item);
        $uploadModel = new UploadPicture();
    
        $model->type = 1;
    
        $emplist = \yii\helpers\ArrayHelper::map($employee, 'id_employee', 'emp_name');
        // Set other attributes and save the model
        $model->date = date('Y-m-d');
        $model->user_id = Yii::$app->user->identity->id;
    

        if (Yii::$app->request->isPost ){
            if($model->load(Yii::$app->request->post()) &&  $model->validate()){
                $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');

                Yii::debug($uploadModel->imageFile, 'Uploaded File Details');
            
                if ($uploadModel->imageFile && $uploadModel->validate()) {
                    if ($uploadModel->imageFile) {
                        $imageFileName = $uploadModel->upload();
                        if ($imageFileName) {
                            $model->pic_loan = $imageFileName;
                        }
                        Yii::debug('Uploaded file name: ' . $uploadModel->imageFile->name, __METHOD__);
                    } else {
                        Yii::error('No file uploaded.', __METHOD__);
                        Yii::$app->session->setFlash('error', 'Please upload a picture.');
                        return $this->redirect(['loan-unit', 'id_item' => $id_item]); // Redirect back
                    }
                    
                } else {
                    Yii::error("Upload model validation failed", __METHOD__);
                    if (!$uploadModel->validate()) {
                        Yii::error('Upload model validation failed: ' . json_encode($uploadModel->errors), __METHOD__);
                        var_dump($uploadModel->errors); // This will show validation error details on-screen
                        die();
                    }// Dump errors to check on screen
                    Yii::$app->session->setFlash('error', 'Picture validation failed.');
                    return $this->redirect(['index']);
                }
            

            
                // Update `item_unit` status if found
                $itemUnit = ItemUnit::findOne($model->id_unit);
                if ($itemUnit !== null) {
                    $itemUnit->updated_by = $model->user_id;
                    $itemUnit->status = 2;
                    $itemUnit->save();
                }
                //if (!$model->save()) {
                //    var_dump($model->errors); // Dump errors to check on screen
                //    die();
                //}



                if ($model->save()) {
                    $logController = new LogController('log', Yii::$app);
                    $logController->actionLendingLog($model->id_unit, $model->id_employee);
                    Yii::$app->session->setFlash('success', 'Unit ' . $itemUnit->serial_number . ' loaned.');
                    return $this->redirect(['index']);
                } else {
                    Yii::error($model->errors, __METHOD__);
                    Yii::$app->session->setFlash('error', 'Failed to save the loan unit.');
                    return $this->redirect(['index']);
                    
                }
            } else {Yii::$app->session->setFlash('error', 'File validation failed.');
                var_dump($model->errors); // Dump errors to check on screen
            die();}
        } 
    
        return $this->render('loan-unit', [
            'model' => $model,
            'avalunit' => $avalunit,
            'emplist' => $emplist,
            'uploadModel' => $uploadModel,
        ]);
    }
    
    

    public function actionList()
    {
        // Create the search model and load the request data
        $searchModel = new LendingSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // Render the view with the search model and data provider
        return $this->render('lending-list', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
        
    }
    /**
     * Displays a single Lending model.
     * @param int $id_lending Id Lending
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_lending)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_lending),
        ]);
    }


    /**
     * Creates a new Lending model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Lending();
        $uploadModel = new UploadPicture();
    
        if ($this->request->isPost){
            if ($model->load(Yii::$app->request->post()) && $model->validate()) {
                $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');
                Yii::debug($uploadModel->imageFile, 'Uploaded File Details');
                
                if ($uploadModel->imageFile && $uploadModel->validate()) {
                    $fileName = $uploadModel->uploadLoan(); // Upload the file and get the filename
                    if ($fileName) {
                        $model->pic_loan = $fileName; // Assign the filename to `pic_loan`
                        Yii::debug("File uploaded successfully: $fileName", __METHOD__);
                    } else {
                        Yii::error("File upload failed", __METHOD__);
                        Yii::$app->session->setFlash('error', 'Failed to upload file.');
                        return $this->redirect(['index']);
                    }
                } else {
                    Yii::error("Upload model validation failed", __METHOD__);
                    Yii::$app->session->setFlash('error', 'File validation failed.');
                }
            
                // Set other attributes and save the model
                $model->date = date('Y-m-d');
                $model->user_id = Yii::$app->user->identity->id;
            
                // Update `item_unit` status if found
                $itemUnit = ItemUnit::findOne($model->id_unit);
                if ($itemUnit !== null) {
                    $itemUnit->updated_by = $model->user_id;
                    $itemUnit->status = 2;
                    $itemUnit->save();
                }
            
                if ($model->save()) {
                    $logController = new LogController('log', Yii::$app);
                    $logController->actionLendingLog($model->id_unit, $model->id_employee);
                    Yii::$app->session->setFlash('success', 'Unit ' . $itemUnit->serial_number . ' loaned.');
                    return $this->redirect(['index']);
                } else {
                    Yii::error($model->errors, __METHOD__);
                    Yii::$app->session->setFlash('error', 'Failed to save the loan unit.');
                }
            } else {
                $model->loadDefaultValues();
            }
        }
        return $this->render('', [
            'model' => $model,
            'uploadModel' => $uploadModel, 
        ]);
    }
    
    /**
     * Updates an existing Lending model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_lending Id Lending
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_lending)
    {
        $model = $this->findModel($id_lending);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_lending' => $model->id_lending]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Lending model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_lending Id Lending
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_lending)
    {
        $this->findModel($id_lending)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Lending model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_lending Id Lending
     * @return Lending the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_lending)
    {
        if (($model = Lending::findOne(['id_lending' => $id_lending])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionLendingList(){
        $model = new Lending();
        $data = $model->getLendingList();
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionItemReportActive(){
        //$lending_type = 1;
        // Create the search model and load the request data
        $searchModel = new LendingSearch();
        $dataProvider = $searchModel->searchItemReport(Yii::$app->request->queryParams);

        // Render the view with the search model and data provider
        return $this->render('item-active', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionUnitReportActive(){
        //$lending_type = 1;
        // Create the search model and load the request data
        $searchModel = new LendingSearch();
        $dataProvider = $searchModel->searchUnitReport(Yii::$app->request->queryParams);

        // Render the view with the search model and data provider
        return $this->render('unit-report', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionLendingHistory()
    {
        // Create the search model and load the request data

        $searchModel = new LendingSearch();
        $dataProvider = $searchModel->searchLendingHistory(Yii::$app->request->queryParams);
        $statusList = [
            'in_use' => 'In Use',
            'returned' => 'Returned',
        ];

        // Render the view with the search model and data provider
        return $this->render('lending-history', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'statusList' => $statusList,
        ]);
    }

    public function actionHistoryDetail($id_item)
    {
        // Create the search model and load the request data
        $searchModel = new LendingSearch();
    
        // Add id_item to the request parameters for filtering in search
        $params = Yii::$app->request->queryParams;
        $params['LendingSearch']['id_item'] = $id_item;
        $params['LendingSearch']['status']= 'in_use';
        $dataProvider = $searchModel->searchLendingHistory($params);
        //$dataProvider = $searchModel->searchHistoryDetail(Yii::$app->request->queryParams, $id_item);
        
        $statusList = [
            'in_use' => 'In Use',
            'returned' => 'Returned',
        ];
    
        // Render the view with the search model and data provider
        return $this->render('lending-history', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'statusList' => $statusList,
        ]);
    }
    
}
