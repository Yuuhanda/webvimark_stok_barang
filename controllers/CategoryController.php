<?php

namespace app\controllers;

use app\models\ItemCategory;
use app\models\CategorySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CategoryController implements the CRUD actions for ItemCategory model.
 */
class CategoryController extends Controller
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
     * Lists all ItemCategory models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new CategorySearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ItemCategory model.
     * @param int $id_category Id Category
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_category)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_category),
        ]);
    }

    /**
     * Creates a new ItemCategory model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new ItemCategory();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
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
     * Updates an existing ItemCategory model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_category Id Category
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_category)
    {
        $model = $this->findModel($id_category);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_category' => $model->id_category]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ItemCategory model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_category Id Category
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_category)
    {
        $this->findModel($id_category)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ItemCategory model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_category Id Category
     * @return ItemCategory the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_category)
    {
        if (($model = ItemCategory::findOne(['id_category' => $id_category])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
