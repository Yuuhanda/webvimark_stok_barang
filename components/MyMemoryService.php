<?php
namespace app\components;

use Yii;
use yii\httpclient\Exception;


class MyMemoryService
{
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

                // Cache the translation for 24 hours
                Yii::$app->cache->set($cacheKey, $translatedText, 86400);

                return $translatedText;
            }
        } catch (Exception $e) {
            Yii::error('MyMemory Error: ' . $e->getMessage(), __METHOD__);
        }

        return null;
    }
}



