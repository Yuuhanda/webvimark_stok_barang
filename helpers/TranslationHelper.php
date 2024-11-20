<?php 
namespace app\helpers;

use app\components\MyMemoryService;

class TranslationHelper
{
    public static function translate($text, $sourceLang = 'en', $targetLang = 'id')
    {
        $targetLang = $targetLang ?: \Yii::$app->language; // Default to the application's current language
        if ($sourceLang === $targetLang) {
            return $text; // Skip translation for the same language
        }

        return MyMemoryService::translate($text, $sourceLang, $targetLang);
    }
}
