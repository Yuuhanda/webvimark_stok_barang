<?php

namespace app\controllers;

use app\models\Warehouse;
use app\models\WarehouseSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\models\ItemUnit;
use Yii;
use app\models\ItemSearch;
use app\models\User;
use app\components\MyMemoryService;
use app\models\UserSearch;

/**
 * WarehouseController implements the CRUD actions for Warehouse model.
 */
class WarehouseController extends Controller
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
     * Lists all Warehouse models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new WarehouseSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Warehouse model.
     * @param int $id_wh Id Wh
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_wh)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_wh),
        ]);
    }

    /**
     * Creates a new Warehouse model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Warehouse();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                Yii::$app->session->setFlash('success', 'Warehouse added.');
                return $this->redirect(['index']);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Warehouse model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_wh Id Wh
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_wh)
    {
        $model = $this->findModel($id_wh);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Warehouse updated.');
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Warehouse model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_wh Id Wh
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_wh)
    {
        // Find any item units associated with the warehouse
        $unitsExist = $this->findUnit($id_wh);
        
        // Check if there are any units associated with the warehouse
        if (!$unitsExist) {
            // If no units exist, delete the warehouse
            $this->findModel($id_wh)->delete();
            
            // Set a success notification
            Yii::$app->session->setFlash('success', 'Warehouse data deleted successfully.');
        } else {
            // Set an error notification if there are still item units in the warehouse
            Yii::$app->session->setFlash('error', 'Warehouse still has units of item inside.');
        }
        
        // Redirect to the index page
        return $this->redirect(['index']);
    }
    
    

    /**
     * Finds the Warehouse model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_wh Id Wh
     * @return Warehouse the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_wh)
    {
        if (($model = Warehouse::findOne(['id_wh' => $id_wh])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    protected function findUnit($id_wh)
    {
        // Check if there are any ItemUnit records with the given warehouse ID (id_wh)
        return ItemUnit::find()->where(['id_wh' => $id_wh])->exists();
    }
    
    public function actionItem($id_wh){
        // Create the search model and load the request data
        $searchModel = new ItemSearch();
        $dataProvider = $searchModel->searchWarehouse(Yii::$app->request->queryParams, $id_wh);
        $model = $this->findModel($id_wh);
        $wh_name = $model->wh_name;
        // Render the view with the search model and data provider
        return $this->render('item', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'warehouse_name' => $wh_name,
        ]);
    }

    public function actionAssign(){
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->searchAdmins(Yii::$app->request->queryParams);

    
        return $this->render('assign', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionAssignAdmins($id)
    {
        $userdata = User::findOne($id);
    
        if (!$userdata) {
            throw new \yii\web\NotFoundHttpException('User not found.');
        }
    
        // Prepare warehouse data as [id_wh => wh_name] for the dropdown
        $warehouses = Warehouse::find()->all();
        $whList = \yii\helpers\ArrayHelper::map($warehouses, 'id_wh', 'wh_name');
    
        if (Yii::$app->request->isPost) {
            $postData = Yii::$app->request->post('User');
            Yii::info(Yii::$app->request->post(), 'debug');

            if ($postData && isset($postData['id_wh'])) {
                $selectedWhId = $postData['id_wh'];
                $userdata->id_wh = $selectedWhId;
        
                if ($userdata->save()) {
                    Yii::$app->session->setFlash('success', 'Warehouse assigned successfully.');
                    return $this->redirect(['assign']);
                }
            }
            Yii::info(Yii::$app->request->post(), 'debug');

            Yii::$app->session->setFlash('error', 'Failed to assign the warehouse.');
        }
        
    
        return $this->render('assign-admins', [
            'username' => $userdata->username,
            'whList' => $whList,
            'userdata' => $userdata,
        ]);
    }
    
    

}
