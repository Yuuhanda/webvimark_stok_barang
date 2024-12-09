<?php
namespace app\components;

use Yii;
use yii\httpclient\Client;
use yii\httpclient\Exception;

//YOU NEED AN ACCOUNT TO USE MYMEMORY TRANSLATION API
//You can make an account, the api is free to use to a degree if it matter
class MyMemoryService
{
    private $client;
    
    public function __construct()
    {
        $this->client = Yii::$app->get('myMemoryClient');
    }

    public static function translate($text, $sourceLang, $targetLang, $email = 'yuhandafikri@outlook.com')
    {
        $service = new self();
        $cacheKey = "translation_{$sourceLang}_{$targetLang}_" . md5($text);

        // Check if translation is already cached
        $cachedTranslation = Yii::$app->cache->get($cacheKey);
        if ($cachedTranslation !== false) {
            return $cachedTranslation;
        }

        // If not cached, fetch from API
        try {
            $client = $service->client;

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


