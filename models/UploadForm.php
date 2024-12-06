<?php
namespace app\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;
use yii\helpers\Url;


class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $file;
    
    public function rules()
    {
        return [
            [['file'], 'file', 
              'skipOnEmpty' => false, 
              'extensions' => 'xlsx',
              'maxSize' => 1024 * 1024 * 5 // 5MB limit
            ],
        ];
    }
    public function upload()
    {
        if ($this->validate()) {
            try {
                $fileName = 'bulk_unit' . random_int(100, 999) . '_' . time() . '.' . $this->file->extension;
                $filePath = $this->uploadPath() . '/' . $fileName;
                
                if ($this->file->saveAs($filePath)) {
                    return [
                        'fileName' => $fileName,
                        'filePath' => $filePath
                    ];
                }
                throw new \Exception('Failed to save file');
            } catch (\Exception $e) {
                Yii::error('File upload failed: ' . $e->getMessage());
                return null;
            }
        }
        return null;
    }
    
    protected function uploadPath()
    {
        $path = Yii::getAlias('@webroot/document');
        if (!file_exists($path)) {
            mkdir($path, 0755, true);
        }
        return $path;
    }
}

