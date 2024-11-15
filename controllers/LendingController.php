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
        //$user = new \app\models\User();
        $unitmodel = new \app\models\ItemUnit();
        $avalunit = $unitmodel->getAvailableUnit($id_item);
        $uploadModel = new UploadPicture();

        $model->type = 1;
        
        $emplist = \yii\helpers\ArrayHelper::map($employee, 'id_employee', 'emp_name');

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $uploadModel->load(Yii::$app->request->post()) && $uploadModel->validate()) {
            $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');
            Yii::debug($uploadModel->imageFile, __METHOD__); // Check if pic_loan is received correctly

            if ($uploadModel->imageFile) {
                $imageFileName = $uploadModel->uploadLoan();
                if ($imageFileName) {
                    $model->pic_loan = $imageFileName;
                }
            } else {
                Yii::$app->session->setFlash('error', 'Please upload a picture.');
                return $this->refresh(); // Reload the form to show the error
            }

            if ($this->request->isPost) {
                $model->date = date('Y-m-d');
                $user = Yii::$app->user->identity;
                $model->user_id = $user->id;
        
                // Update the item_unit status where id_unit matches the one in the Lending model
                $itemUnit = ItemUnit::findOne($model->id_unit);
                if ($itemUnit !== null) {
                    $itemUnit->updated_by =  Yii::$app->user->identity->id;
                    $itemUnit->status = 2; // Update the status
                    $itemUnit->save();
                }
        
                if ($model->save()) {
                    $logController = new LogController('log', Yii::$app);
                    $logController->actionLendingLog($model->id_unit, $model->id_employee);
                    Yii::$app->session->setFlash('success', 'Unit '. $itemUnit->serial_number .' loaned.');
                    return $this->redirect(['index']);
                } else {
                    Yii::error($model->errors); // Log errors if save fails
                    Yii::error($model->errors, __METHOD__);
                    Yii::$app->session->setFlash('error', 'Failed to save the loan unit.');
                }
            }
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
    
        if ($this->request->isPost) {
            $model->date = date('Y-m-d');
            $user = Yii::$app->user->identity;
            $model->user_id = $user->id;
            if ($model->load($this->request->post())) {
                // Update the item_unit status where id_unit matches the one in the Lending model
                $itemUnit = ItemUnit::findOne($model->id_unit); // Assuming you have id_unit in the Lending model
                if ($itemUnit !== null) {
                    $user = Yii::$app->user->identity;
                    $itemUnit->updated_by = $user->id;
                    $itemUnit->status = 2; // Update the status
                    $itemUnit->save(); // Save the changes
                }
                // Save the uploaded image
                if ($uploadModel->pic_loan && $uploadModel->validate()) {
                    $imageFileName = $uploadModel->uploadLoan();
                    if ($imageFileName) {
                        $model->pic_loan = $imageFileName; // assuming `image` is a field in Item table
                    }
                }
                $model->save();
                $logController = new LogController('log', Yii::$app); // Pass the required parameters to the controller
                $logController->actionLendingLog($model->id_unit, $model->id_employee); // Call with correct parameters
                Yii::$app->session->setFlash('success', 'Unit'. $itemUnit->serial_number .'loaned.');
                return $this->redirect(['index']);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('loan-unit', [
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
