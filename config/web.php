<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],

    //timezone uses db serverr timezone
    
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '2eXxFfmVxxAAA4syZwMVGOW6xM6Sqbfj',
            'enableCsrfValidation' => true,
            'on beforeRequest' => function ($event) {
                if (Yii::$app->user->isGuest) {
                    Yii::$app->defaultRoute = 'site/login'; // If not logged in
                } else {
                    Yii::$app->defaultRoute = 'item/index'; // If logged in
                }
            },
        ],
        //'cache' => [
        //    'class' => 'yii\caching\FileCache',
        //],
        'cache' => [
            'class' => 'yii\caching\DbCache',
            'cacheTable' => 'cache', // The table where cache data will be stored
        ],
        'user' => [
            'class' => 'webvimark\modules\UserManagement\components\UserConfig',
    
            // Comment this if you don't want to record user logins
            'on afterLogin' => function($event) {
                    \webvimark\modules\UserManagement\models\UserVisitLog::newVisitor($event->identity->id);
                }
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager', // or 'yii\rbac\PhpManager'
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => \yii\symfonymailer\Mailer::class,
            'viewPath' => '@app/mail',
            // send all mails to a file by default.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                    'logFile' => '@runtime/logs/app.log',
                ],
            ],
        ],
        'db' => $db,
        
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
               
            ],
        ],
        'as beforeRequest' => [
            'class' => yii\filters\AccessControl::class,
            'rules' => [
                [
                    [
                        'allow' => true,
                        'actions' => ['login'], // Actions allowed for guests
                        'roles' => ['?'], // Allow guests to access these actions
                    ],
                    [
                        'allow' => true,
                        'roles' => ['@'], // Allow authenticated users
                    ],
                ],
            ],
            'denyCallback' => function ($rule, $action) {
                return Yii::$app->response->redirect(['site/login']);
            },
        ],



        'assetManager' => [
            'bundles' => [
                'kartik\select2\Select2Asset' => [
                    'depends' => [
                        'yii\web\JqueryAsset',
                        'yii\bootstrap5\BootstrapAsset',  // Use Bootstrap 5 asset
                    ],
                ],
                'yii\bootstrap\BootstrapAsset' => [
                    'class' => 'yii\bootstrap5\BootstrapAsset',
                ],
            ],
        ],

        'myMemoryClient' => [
            'class' => 'app\components\MyMemoryClient',
            'baseUrl' => 'https://api.mymemory.translated.net',
            
        ],

        
    ],
    'modules'=>[
    	'user-management' => [
    		'class' => 'webvimark\modules\UserManagement\UserManagementModule',
    		'on beforeAction'=>function(yii\base\ActionEvent $event) {
    				if ( $event->action->uniqueId == 'user-management/auth/login' )
    				{
    					$event->action->controller->layout = 'loginLayout.php';
    				};
    			},
    	],
    ],

    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
