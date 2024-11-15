<?php

namespace app\commands;

use Yii;
use yii\console\Controller;
use yii\helpers\FileHelper;

class DeleteOldDocsController extends Controller
{
    public function actionIndex()
    {
        $docPath = Yii::getAlias('@web/document');
        $files = FileHelper::findFiles($docPath);

        foreach ($files as $file) {
            if (filemtime($file) < strtotime('-1 day')) {
                unlink($file);
                echo "Deleted: " . basename($file) . "\n";
            }
        }
    }
}
