<?php

namespace app\controllers;

use app\models\Employee;
use app\models\UnitLog;
use app\models\LogSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use app\models\ItemUnit;
use app\models\UnitSearch;
use app\models\User;
use Yii;
use app\helpers\TranslationHelper;
use InvalidArgumentException;
use yii\db\Expression;
use yii\web\ServerErrorHttpException;
/**
 * LogController implements the CRUD actions for UnitLog model.
 */
class LogController extends Controller
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
            'rateLimiter' => [
                'class' => \yii\filters\RateLimiter::class,
                'enableRateLimitHeaders' => true,
            ],
        ];
    }

    /**
     * Lists all UnitLog models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new LogSearch();
        // Load parameters
        $params = Yii::$app->request->queryParams;
        $dataProvider = $searchModel->search($params);
        
        // Store search parameters in session
        Yii::$app->session->set('logSearchParams', $params);

        // Render the view with the search model and data provider
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSearchResult($serial_number){
        $searchModel = new LogSearch();
        $params = Yii::$app->request->queryParams;
        $params['LogSearch']['serial_number'] = $serial_number;
        // Wrap the array in an ArrayDataProvider
        $dataProvider = $dataProvider = $searchModel->search($params);

        return $this->render('log-single', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /**
     * Displays a single UnitLog model.
     * @param int $id_log Id Log
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_log)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_log),
        ]);
    }

    /**
     * Creates a new UnitLog model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new UnitLog();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_log' => $model->id_log]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }
    public function actionLendingLog($id_unit, $id_employee)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new UnitLog();
            
            // Get the serial number from the ItemUnit
            $unit = ItemUnit::findOne($id_unit);
            if (!$unit) {
                throw new NotFoundHttpException("Unit not found.");
            }
            $sn = $unit->serial_number;
        
            // Get the employee name
            $emp = Employee::findOne($id_employee);
            if (!$emp) {
                throw new NotFoundHttpException("Employee not found.");
            }
            $emp_name = $emp->emp_name;
            $user = Yii::$app->user->identity;
            // Set log fields
            $model->id_unit = $id_unit;
            $model->content = "Unit $sn lent to $emp_name by $user->username";
            $model->update_at = new Expression('NOW()'); // Correct this field if necessary
        
            // Try saving and check for errors
            if ($model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }
    /**
     * Updates an existing UnitLog model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_log Id Log
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_log)
    {
        $model = $this->findModel($id_log);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_log' => $model->id_log]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing UnitLog model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_log Id Log
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_log)
    {
        $this->findModel($id_log)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the UnitLog model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_log Id Log
     * @return UnitLog the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_log)
    {
        if (($model = UnitLog::findOne(['id_log' => $id_log])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionViewLog($id_unit){
        $model = new UnitLog();
        $data = $model->getLogUnit($id_unit);
    
        // Return the data as JSON for DataTables
        return $this->asJson([
            'data' => $data,
        ]);
    }
    public function actionReturnLog(int $id_unit, int $id_employee)
    {
        if (!is_int($id_unit) || !is_int($id_employee)) {
            throw new InvalidArgumentException('Invalid input parameters');
        }
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new UnitLog();
        
            $unit = $this->validateUnit($id_unit);
            $sn = $unit->serial_number;
            // Get the employee name
            $emp = Employee::findOne($id_employee);
            if (!$emp) {
                throw new NotFoundHttpException("Employee not found.");
            }
            $emp_name = $emp->emp_name;
            $user = Yii::$app->user->identity;
            // Set log fields
            $model->id_unit = $id_unit;
            $model->content = $this->generateLogContent(
                'returned',
                $sn,
                $emp_name,
                "received by {$user->username}"
            );
            $model->update_at = new Expression('NOW()'); // Correct this field if necessary

            // Try saving and check for errors
            if ($model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }
    public function actionRepairLog(int $id_unit): bool
    {
        if (!is_int($id_unit)) {
            throw new InvalidArgumentException('Invalid unit ID');
        }
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new UnitLog();
        
            // Get the serial number from the ItemUnit
            $unit = ItemUnit::findOne($id_unit);
            if (!$unit) {
                throw new NotFoundHttpException("Unit not found.");
            }
            $sn = $unit->serial_number;
            // Get data of the current logged-in user
            $user = Yii::$app->user->identity;

            // Set log fields
            $model->id_unit = $id_unit;
            $model->content = $this->generateLogContent(
                'sent to repair',
                $sn,
                $user->username
            );
            $model->update_at = new Expression('NOW()'); // Correct this field if necessary

            // Try saving and check for errors
            if ($model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }    
    
    
    public function actionDoneRepairLog(int $id_unit)
    {
        if (!is_int($id_unit)) {
            throw new InvalidArgumentException('Invalid unit ID');
        }
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new UnitLog();
            
            // Get the serial number from the ItemUnit
            $unit = ItemUnit::findOne($id_unit);
            if (!$unit) {
                throw new NotFoundHttpException("Unit not found.");
            }
            $sn = $unit->serial_number;
        
            // Get the employee name
            $user = Yii::$app->user->identity;
        
            // Set log fields
            $model->id_unit = $id_unit;
            $model->content = $this->generateLogContent('repaired and taken to warehouse', $sn, $user->username);
            $model->update_at = new Expression('NOW()'); // Correct this field if necessary
        
            // Try saving and check for errors
            if ($model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }
    public function actionEditLog(string $serial_number, UnitLog $model = null): bool
    {
        if (empty($serial_number)) {
            throw new InvalidArgumentException('Invalid serial number provided');
        }
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = $model ?? new UnitLog();
            
            // Find the unit by serial number
            $unit = ItemUnit::find()->where(['serial_number' => $serial_number])->one();
            
            if ($unit === null) {
                throw new NotFoundHttpException("Unit with serial number $serial_number not found.");
            }
        
            // Assign the unit ID to the log model
            $model->id_unit = $unit->id_unit;
        
            // Get data of the current logged-in user
            $user = Yii::$app->user->identity;
            
            // Create log content with the user's info
            $model->content = $this->generateLogContent('updated', $serial_number, $user->username);
        
            // Set other necessary fields such as timestamp (if needed)
            $model->update_at = new Expression('NOW()');
        
            // Validate and save the log model
            if ($model->validate() && $model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Log save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }
    public function actionSearchLog()
    {
        $model = new ItemUnit();
    
        if ($model->load(Yii::$app->request->post())) {
            if ($model->serial_number !== null) {
                return $this->redirect(['search-result', 'serial_number' => $model->serial_number]);
            } else{
                Yii::$app->session->setFlash('error', TranslationHelper::translate('Serial number cannot be null.'));
            }
        }
    
        return $this->render('search-log', [
            'model' => $model,
        ]);
    }

    public function actionNewUnit($serial_n, $id_unit){
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new UnitLog();

            // Get data of the current logged-in user
            $user = Yii::$app->user->identity;

            // Assign the unit ID to the log model
            $model->id_unit = $id_unit;

            //getting the username that added the new unit
            $model->content = "New unit $serial_n added by " . $user->username;

            //date time
            $model->update_at = new Expression('NOW()');

            // Validate and save the log model
            if ($model->validate() && $model->save()) {
                $transaction->commit();
                return true; // Save was successful
            } else {
                // Log save failed, output validation errors
                Yii::error($model->getErrors(), __METHOD__);
                throw new ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
            }
        } catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }



    // Create a protected method to generate standardized log messages
    protected function generateLogContent($action, $serialNumber, $actor, $additionalInfo = '') {
        $baseMessage = "Unit $serialNumber $action by $actor";
        return $additionalInfo ? "$baseMessage - $additionalInfo" : $baseMessage;
    }

    protected function validateUnit($id_unit) {
        $unit = ItemUnit::find()->where(['id_unit' => $id_unit])->one();
        if (!$unit) {
            throw new NotFoundHttpException("Unit with serial number $id_unit not found");
        }
        return $unit;
    }
}




