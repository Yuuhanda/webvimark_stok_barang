<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=yii2_stok_barang',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8',
    'enableLogging' => true,
    'enableProfiling' => true,
    'on afterOpen' => function($event) {
        $event->sender->createCommand("SET time_zone='+06:00';")->execute(); // Adjust to your timezone offset
    },

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
