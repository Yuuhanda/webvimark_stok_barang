<?php 
namespace app\helpers;

use app\components\MyMemoryService;
use app\models\User;
use Yii;

class TranslationHelper
{
    public static function translate($text, $sourceLang = 'en', $targetLang = 'id')
    {
        $user_lang = User::findOne(Yii::$app->user->id);
        $targetLang = $user_lang->user_lang ?? 'id'; //it defaults to indonesian
        if ($sourceLang === $targetLang) {
            return $text; // Skip translation for the same language
        }

        return MyMemoryService::translate($text, $sourceLang, $targetLang);
    }
}
