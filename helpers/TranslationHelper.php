<?php 
namespace app\helpers;

use app\components\MyMemoryService;
use app\models\User;
use Yii;
//this is a helper class to translate the text to the target language
//it uses the MyMemoryService class to translate the text
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
