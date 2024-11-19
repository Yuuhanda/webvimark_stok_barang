<?php

namespace app\commands;

use Yii;
use yii\console\Controller;
use yii\helpers\FileHelper;
use app\models\DocUploaded; // Adjust namespace if needed

class DeleteOldDocsController extends Controller
{
    public function actionIndex()
    {
        // Define the directory and age limit (in seconds)
        $directory = Yii::getAlias('@webroot/document');
        $ageLimit =  24 * 60 * 60; // Example: files older than 1 day
        $now = time();

        if (!is_dir($directory)) {
            $this->stdout("Directory does not exist: $directory\n");
            return;
        }

        // Get all files in the directory
        $files = FileHelper::findFiles($directory);
        foreach ($files as $file) {
            // Check file age
            if ($now - filemtime($file) > $ageLimit) {
                // Get file name
                $fileName = basename($file);

                // Delete the file
                if (unlink($file)) {
                    $this->stdout("Deleted file: $file\n");

                    // Delete corresponding database row
                    $deletedRows = DocUploaded::deleteAll(['file_name' => $fileName]);
                    if ($deletedRows) {
                        $this->stdout("Deleted $deletedRows row(s) for file: $fileName\n");
                    } else {
                        $this->stdout("No database entry found for file: $fileName\n");
                    }
                } else {
                    $this->stdout("Failed to delete file: $file\n");
                }
            }
        }

        $this->stdout("Old file cleanup completed.\n");
    }
}

