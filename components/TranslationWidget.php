<?php
namespace app\components;

use yii\base\Widget;

class TranslationWidget extends Widget
{
    public $text;
    public $sourceLang = 'en';
    public $targetLang = 'id';

    public function run()
    {
        $translatedText = \app\components\MyMemoryService::translate($this->text, $this->sourceLang, $this->targetLang);

        return $this->render('translation-widget', [
            'originalText' => $this->text,
            'translatedText' => $translatedText,
            'sourceLang' => $this->sourceLang,
            'targetLang' => $this->targetLang,
        ]);
    }
}
