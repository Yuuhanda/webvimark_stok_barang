<?php

namespace app\controllers;

use app\models\Item;
use app\models\ItemSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use Yii;
use app\models\UnitSearch;
use app\models\WarehouseSearch;
use yii\web\UploadedFile;
use app\models\UploadPicture;
use app\models\User;
use webvimark\modules\UserManagement\models\User as WebvimarkUser;
use app\models\Employee;
use app\models\Warehouse;
use app\models\ConditionLookup;
use app\models\ItemCategory;
use app\models\StatusLookup;/**
 * Imports the StatusLookup model, which is likely used to retrieve status information for items.
 */

use app\helpers\TranslationHelper;

/**
 * ItemController implements the CRUD actions for Item model.
 */
class ItemController extends Controller
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
     * Lists all Item models.
     *
     * @return string
     */
    public function actionIndex()
    {
        // Create the search model and load the request data
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        if(Yii::$app->user->identity->id_wh==null && (WebvimarkUser::hasRole('Admin') && !WebvimarkUser::hasRole('superadmin'))){
            Yii::$app->session->setFlash('error', TranslationHelper::translate('Warehouse Admin, your account has no warehouse assigned. Contact App Admins to assign you to a warehouse'));
        }
        // Render the view with the search model and data provider
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionViewImage($id)
    {
        $model = $this->findModel($id);

        if ($model->imagefile) {
            return $this->renderAjax('view-image', ['model' => $model]);
        } else {
            return "Image not available.";
        }
    }

    public function actionDetails($id_item)
    {
        $searchModel = new UnitSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $id_item);
        $data = [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'updatedByList' => User::getUpdatedByList(),
            'warehouseList' => Warehouse::getWarehouseList(),
            'employeeList' => Employee::getEmployeeList(),
            'statusList' => StatusLookup::getStatusList(),
            'conditionList' => ConditionLookup::getConditionList(),
        ];
    
        return $this->render('detail', $data);
    }

    public function actionWarehouse($id_item)
    {
        $searchModel = new WarehouseSearch();
    
        // Full distribution data
        $dataProvider = $searchModel->searchWhDist(Yii::$app->request->queryParams, $id_item);
    
        // Data for "In-Repair" units only
        $inRepairProvider = $searchModel->searchInRepair(Yii::$app->request->queryParams, $id_item);
    
        return $this->render('whdist', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'inRepairProvider' => $inRepairProvider,
        ]);
    }
    
    
    /**
     * Displays a single Item model.
     * @param int $id_item Id Item
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_item)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_item),
        ]);
    }

    /**
     * Creates a new Item model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Item();
        $uploadModel = new UploadPicture();
        $category = ItemCategory::getCategoryList(); // Should return `id_category`, `category_name`, and `cat_code`
    
        if (Yii::$app->request->isPost) {
            $model->load(Yii::$app->request->post());
            $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');

            Yii::debug($uploadModel->imageFile, 'Uploaded File Details');
            
            // Generate SKU if empty
            if (empty($model->SKU)) {
                $id_cat = $model->id_category;
                $cat_code = ItemCategory::find()
                    ->select(['cat_code'])
                    ->where(['id_category' => $id_cat])
                    ->scalar(); // scalar() will directly return the 'cat_code' value
                $model->SKU = $this->generateSKU($cat_code);
            }
    
            if ($uploadModel->imageFile) {
                $model->imagefile = $this->handleFileUpload($uploadModel);
            }

            if ($model->save()) {
                Yii::$app->session->setFlash('success', TranslationHelper::translate('Item added successfully.'));
                return $this->redirect(['index']);
            }
        }
    
        return $this->render('create', [
            'model' => $model,
            'uploadModel' => $uploadModel,
            'category' => $category,
        ]);
    }
    

    protected function generateSKU($cat_code) {
        // Get the last two digits of the current year
        $currentYear = (int) date('Y');
        $letter = substr($currentYear, -2); // e.g., '24' for 2024
    
        // Get the last generated SKU for the category and increment it for a new serialized number
        $lastSKU = Item::find()->where(['LIKE', 'SKU', $cat_code . $letter])->orderBy(['SKU' => SORT_DESC])->one();
        $lastSerial = 1; // Default if no prior SKU exists for this category/year
    
        if ($lastSKU !== null) {
            $lastSerial = (int) substr($lastSKU->SKU, -4) + 1;
        }
    
        // Ensure 4-digit format with leading zeros
        $serialStr = str_pad($lastSerial, 4, '0', STR_PAD_LEFT);
    
        // Combine parts to create the SKU
        $autosku = $cat_code . $letter . '-' . $serialStr;
    
        return $autosku;
    }
    
    
    

    /**
     * Updates an existing Item model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_item Id Item
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_item)
    {
        $model = $this->findModel($id_item);
        $uploadModel = new UploadPicture();
        $category = ItemCategory::getCategoryList(); // Should return `id_category`, `category_name`, and `cat_code`

        if ($this->request->isPost && $model->load($this->request->post())) {
            //check if imageFile in the db is not null. if not null, then delete the image file in the server in the @web/uploads folder
            if ($model->imagefile) {
                $imagePath = Yii::getAlias('@webroot') . '/uploads/' . $model->imagefile;
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                }
            } //this is not working. i want it to delete the image file in the server in the @web/uploads folder

 
            $uploadModel->imageFile = UploadedFile::getInstance($uploadModel, 'imageFile');
            
            // Generate SKU if empty
            if (empty($model->SKU)) {
                $id_cat = $model->id_category;
                $cat_code = ItemCategory::find()
                    ->select(['cat_code'])
                    ->where(['id_category' => $id_cat])
                    ->scalar(); // scalar() will directly return the 'cat_code' value
                $model->SKU = $this->generateSKU($cat_code);
            }

            if ($uploadModel->imageFile) {
                $model->imagefile = $this->handleFileUpload($uploadModel);
            }
            
            if ($model->save()) {
                Yii::$app->session->setFlash('success', TranslationHelper::translate('Item Updated successfully.'));
                return $this->redirect(['index']);
            }
            if (!$model->save()) {
                Yii::$app->session->setFlash('error', TranslationHelper::translate('Failed to save item: ') . implode(', ', $model->getFirstErrors()));
                return $this->render('create', [
                    'model' => $model,
                    'uploadModel' => $uploadModel,
                    'category' => $category,
                ]);
            }
            
        }

        return $this->render('update', [
            'model' => $model,
            'uploadModel' => $uploadModel,
            'category' => $category,
        ]);
    }

    /**
     * Deletes an existing Item model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_item Id Item
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_item)
    {
        $this->findModel($id_item)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Item model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_item Id Item
     * @return Item the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_item)
    {
        if (($model = Item::findOne(['id_item' => $id_item])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionDashboardData()
    {
        $model = new Item();
        $data = $model->getDashboard();

        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    public function actionItemName()
    {
        $model = new Item();
        $data = $model->get();
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }

    private function handleFileUpload($uploadModel) {
        try {
            if ($uploadModel->imageFile && $uploadModel->validate()) {
                if ($uploadModel->imageFile) {
                    $imageFileName = $uploadModel->upload();
                    if ($imageFileName) {
                        return $imageFileName;
                    }
                }
            }
        } catch (\Exception $e) {
            Yii::error("File upload failed: " . $e->getMessage());
            throw new \yii\web\HttpException(500, 'Error processing file upload');
        }
        return null;
    }
    

}

