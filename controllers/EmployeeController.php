<?php

namespace app\controllers;

use app\helpers\TranslationHelper;
use app\models\Employee;
use app\models\EmployeeSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use Yii;
use app\models\Lending;

/**
 * EmployeeController implements the CRUD actions for Employee model.
 */
class EmployeeController extends Controller
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
     * Lists all Employee models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new EmployeeSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Employee model.
     * @param int $id_employee Id Employee
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_employee)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_employee),
        ]);
    }

    /**
     * Creates a new Employee model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Employee();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) 
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Employee added successfully.'));{
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
     * Updates an existing Employee model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_employee Id Employee
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_employee)
    {
        $model = $this->findModel($id_employee);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Employee updated successfully.'));
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Employee model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_employee Id Employee
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_employee)
    {
        // Check if there are any lending records for the employee with type = 1
        $lendingExist = $this->findLending($id_employee);
        
        if (!$lendingExist) {
            // If no lending records exist, delete the employee
            $this->findModel($id_employee)->delete();
            
            // Set a success notification
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Employee data deleted successfully.'));
        } else {
            // Set an error notification if the employee has lending records
            Yii::$app->session->setFlash('error', TranslationHelper::translate('Employee cannot be deleted. There is an item still being lent to this employee'));
        }
        
        // Redirect to the index page
        return $this->redirect(['index']);
    }
    

    protected function findLending($id_employee)
    {
        // Check if there are any Lending records with the given employee ID and type = 1
        return Lending::find()->where(['id_employee' => $id_employee, 'type' => 1])->exists();
    }
    

    /**
     * Finds the Employee model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_employee Id Employee
     * @return Employee the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_employee)
    {
        if (($model = Employee::findOne(['id_employee' => $id_employee])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
