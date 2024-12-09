<?php

namespace app\controllers;

use app\models\ItemUnit;
use app\models\RepairLog;
use app\models\RepairLogSearch;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use app\helpers\TranslationHelper;
use app\models\RepTypeLookup;
use yii\web\BadRequestHttpException;

/**
 * RepairLogController implements the CRUD actions for RepairLog model.
 */
class RepairLogController extends Controller
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
     * Lists all RepairLog models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new RepairLogSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single RepairLog model.
     * @param int $id_repair Id Repair
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_repair)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_repair),
        ]);
    }

    /**
     * Creates a new RepairLog model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate($id_unit, $comment, $type)
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            // Add input validation
            if (!is_numeric($id_unit) || empty($comment) || empty($type)) {
                throw new BadRequestHttpException('Invalid input parameters');
            }
            $model = new RepairLog();
            $unit = ItemUnit::findOne($id_unit);
            if (!$unit) {
                throw new NotFoundHttpException(TranslationHelper::translate("Unit not found."));
            }
            $sn = $unit->serial_number;
            $model->id_unit = $id_unit;
            $model->comment = $sn. '. '. $comment;
            $model->rep_type = $type;
            $model->datetime = new \yii\db\Expression('NOW()'); // Correct this field if necessary. bug found, time is one hour advanced
            // Try saving and check for errors
            if ($model->save()) {
                $transaction->commit();
                return true; // Save was successful
            }
            $transaction->rollBack();
            // Save failed, output validation errors
            Yii::error($model->getErrors(), __METHOD__);
            throw new \yii\web\ServerErrorHttpException("Failed to save log: " . json_encode($model->getErrors()));
        } catch(\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
    }
    /**
     * Updates an existing RepairLog model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_repair Id Repair
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_repair)
    {
        $model = $this->findModel($id_repair);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_repair' => $model->id_repair]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing RepairLog model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_repair Id Repair
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_repair)
    {
        $this->findModel($id_repair)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the RepairLog model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_repair Id Repair
     * @return RepairLog the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_repair)
    {
        if (($model = RepairLog::findOne(['id_repair' => $id_repair])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(TranslationHelper::translate('The requested page does not exist.'));
    }

    public function actionDetail()
    {
        $searchModel = new RepairLogSearch();
        $dataProvider = $searchModel->searchDetail(Yii::$app->request->queryParams);
        $typeList = RepTypeLookup::getTypeList();
    
        return $this->render('detail', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'typeList' => $typeList,
        ]);
    }

    public function actionDetailSingle($month, $year)
    {
        $searchModel = new RepairLogSearch();
        
        $searchModel->month = $month; // Set month
        $searchModel->year = $year;   // Set year
        $searchModel->id_rep_t = 1; // repair opened type

        //repair open
        $params = Yii::$app->request->queryParams;
        $dataProvider = $searchModel->searchDetail($params);

        //repair closed
        $searchModel->id_rep_t = 2; // repair closed type
        $params = Yii::$app->request->queryParams;
        $closedRepair = $searchModel->searchDetail($params);

        return $this->render('detail-single', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'closedRepair' => $closedRepair,
            'month' => $month,
            'year' => $year,
        ]);
    }

    public function actionTimezoneCheck()
    {
        $timezone = date_default_timezone_get();
        $timezone = new \DateTimeZone($timezone);
        $now = new \DateTime('now', $timezone);
        $time = $now->format('H:i:s');
        echo $time;
        // select now() from db use for $datetime
        $datetime = new \DateTime('now', $timezone);
        $datetime = $datetime->format('Y-m-d H:i:s');
        echo $datetime;
    }
}
