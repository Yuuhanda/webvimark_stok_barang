<?php
namespace app\components;

use Yii;
use yii\httpclient\Exception;


class MyMemoryService
{
    //YOU WILL NEED AN ACCOUNT OF MYMEMORY TRANSLATION API. if you dont have it you can try make one
    //An account is required to use the API.
    //For the API key, you can use your mymemory translation account to make one
    //to use it you can open config/params.php and put your API key there
    public static function translate($text, $sourceLang, $targetLang, $email = 'yuhandafikri@outlook.com')
    {
        $cacheKey = "translation_{$sourceLang}_{$targetLang}_" . md5($text);

        // Check if translation is already cached
        $cachedTranslation = Yii::$app->cache->get($cacheKey);
        if ($cachedTranslation !== false) {
            return $cachedTranslation;
        }

        // If not cached, fetch from API
        try {
            $client = Yii::$app->myMemoryClient;

            $params = [
                'q' => $text,
                'langpair' => $sourceLang . '|' . $targetLang,
                'key' => Yii::$app->params['mymemoryApiKey'],
            ];

            if ($email) {
                $params['de'] = $email;
            }

            $response = $client->createRequest()
                ->setMethod('GET')
                ->setUrl('/get')
                ->setData($params)
                ->send();

            if ($response->isOk) {
                $translatedText = $response->data['responseData']['translatedText'];

                // Save to cache for 30 days (60 * 60 * 24 * 30 seconds)
                Yii::$app->cache->set($cacheKey, $translatedText, 60 * 60 * 24 * 30 * 365);
                //i want to increase the size of the cache stored
                return $translatedText;
            }
        } catch (Exception $e) {
            Yii::error('MyMemory Error: ' . $e->getMessage(), __METHOD__);
        }

        return null;
    }
}



