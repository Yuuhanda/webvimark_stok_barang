<?php

namespace app\controllers;

use app\models\DocUploaded;
use app\models\DocSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yii;
use yii\helpers\FileHelper;
use app\helpers\TranslationHelper;

/**
 * DocsController implements the CRUD actions for DocUploaded model.
 */
class DocsController extends Controller
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
     * Lists all DocUploaded models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new DocSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DocUploaded model.
     * @param int $id_doc Id Doc
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id_doc)
    {
        return $this->render('view', [
            'model' => $this->findModel($id_doc),
        ]);
    }

    /**
     * Creates a new DocUploaded model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new DocUploaded();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id_doc' => $model->id_doc]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing DocUploaded model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id_doc Id Doc
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id_doc)
    {
        $model = $this->findModel($id_doc);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id_doc' => $model->id_doc]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing DocUploaded model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id_doc Id Doc
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id_doc)
    {
        $this->findModel($id_doc)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the DocUploaded model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id_doc Id Doc
     * @return DocUploaded the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id_doc)
    {
        if (($model = DocUploaded::findOne(['id_doc' => $id_doc])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionViewDocs($file_name)
    {
        $filePath = Yii::getAlias('@webroot/document/' . $file_name);
    
        if (!file_exists($filePath)) {
            throw new NotFoundHttpException('The requested file does not exist.');
        }
    
        try {
            $spreadsheet = IOFactory::load($filePath);
            $sheet = $spreadsheet->getActiveSheet();
            $sheetData = $sheet->toArray(null, true, true, true); // Load data as an array
    
        } catch (\Exception $e) {
            Yii::$app->session->setFlash('error', TranslationHelper::translate('Error loading file: ') . $e->getMessage());
            return $this->redirect(['index']);
        }
    
        return $this->render('view-docs', [
            'sheetData' => $sheetData,
            'fileName' => $file_name,
        ]);
    }

    public function actionDeleteOldDocs($length)
    {
        $documentPath = Yii::getAlias('../web/document');
        $thresholdTime = strtotime("-$length day"); // Change as needed

        // Ensure the directory exists
        if (!is_dir($documentPath)) {
            Yii::$app->session->setFlash('error', TranslationHelper::translate('Document directory does not exist.'));
            return $this->redirect(['index']);
        }

        // Scan for files in the directory
        $files = FileHelper::findFiles($documentPath);

        $deletedFiles = [];
        foreach ($files as $file) {
            if (filemtime($file) < $thresholdTime) {
                $fileName = basename($file);

                // Attempt to delete the file
                if (@unlink($file)) {
                    $deletedFiles[] = $fileName;

                    // Delete corresponding record in `doc_uploaded` table
                    DocUploaded::deleteAll(['file_name' => $fileName]);
                }
            }
        }

        if ($deletedFiles) {
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Deleted files: ') . implode(', ', $deletedFiles));
        } else {
            Yii::$app->session->setFlash('info', TranslationHelper::translate('No files older than the threshold were found.'));
        }

        return $this->redirect(['index']);
    }

}
