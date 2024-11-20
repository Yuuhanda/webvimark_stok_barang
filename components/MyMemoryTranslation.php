<?php
// components/MyMemoryTranslation.php
namespace app\components;

use GuzzleHttp\Client;
use Yii;

class MyMemoryTranslation
{
    private $client;
    private $apiUrl = 'https://api.mymemory.translated.net/get';

    public function __construct()
    {
        $this->client = new Client();
    }

    /**
     * Translates a text using the MyMemory API
     * @param string $text The text to translate
     * @param string $sourceLang The source language code (e.g., 'en')
     * @param string $targetLang The target language code (e.g., 'id')
     * @return string The translated text
     */
    public function translate($text, $sourceLang = 'en', $targetLang = 'id')
    {
        try {
            $response = $this->client->request('GET', $this->apiUrl, [
                'query' => [
                    'q' => $text,
                    'langpair' => $sourceLang . '|' . $targetLang,
                ],
            ]);

            $data = json_decode($response->getBody()->getContents(), true);
            return $data['responseData']['translatedText'] ?? $text;
        } catch (\Exception $e) {
            Yii::error('Translation failed: ' . $e->getMessage(), __METHOD__);
            return $text;  // return the original text if translation fails
        }
    }
}

