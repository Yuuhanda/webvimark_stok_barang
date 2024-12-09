<?php
namespace app\components;

use yii\httpclient\Client;

class MyMemoryClient extends Client 
{
    public function __construct($config = [])
    {
        $config['baseUrl'] = 'https://api.mymemory.translated.net';
        parent::__construct($config);
    }
}
