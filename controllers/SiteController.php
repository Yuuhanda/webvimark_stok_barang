<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\web\Response;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\User;
use app\components\MyMemoryService;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */

     public function behaviors()
     {
         return [
             'ghost-access'=> [
                 'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
             ],
         ];
     }
     

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->redirect(['item/index']);
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }
    
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            // Get the current logged-in user's ID
            $userId = Yii::$app->user->identity->id;
    
            // Fetch the user data from the user table
            $user = User::findOne($userId);
    
            // Initialize the AuthManager
            $auth = Yii::$app->authManager;
    
            // Check if the user is a superadmin (1) or maintenance and repair officer (2)
            if ($user) {
        // Assuming $auth is your DbManager instance and $userId is the ID of the user being logged in

        if ($user->superadmin == 1) {
            // Check if the user already has the 'superadmin' role
            $superadminRole = $auth->getRole('superadmin');
            if ($superadminRole !== null && !$auth->getAssignment('superadmin', $userId)) {
                $auth->assign($superadminRole, $userId);
            }
            } elseif ($user->superadmin == 2) {
                // Check if the user already has the 'maintenance' role
                $maintenanceRole = $auth->getRole('maintenance');
                if ($maintenanceRole !== null && !$auth->getAssignment('maintenance', $userId)) {
                    $auth->assign($maintenanceRole, $userId);
                }
            }   elseif ($user->superadmin == 0) {
                // Check if the user already has the 'maintenance' role
                $adminRole = $auth->getRole('admin');
                if ($adminRole !== null && !$auth->getAssignment('admin', $userId)) {
                    $auth->assign($adminRole, $userId);
                }
            }

            }
    
            return $this->redirect(['item/index']);
        }
    
        $model->password = ''; // Clear the password field for security reasons
        return $this->render('login', [
            'model' => $model,
        ]);
    }
    


    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionTranslate()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
    
        $text = Yii::$app->request->get('text');
        $sourceLang = Yii::$app->request->get('sourceLang', 'en');
        $targetLang = Yii::$app->request->get('targetLang', 'id'); // Default to Indonesian
    
        if (!$text) {
            return ['success' => false, 'error' => 'No text provided for translation.'];
        }
    
        try {
            $translatedText = MyMemoryService::translate($text, $sourceLang, $targetLang);
            return ['success' => true, 'translatedText' => $translatedText];
        } catch (\Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }



    
}
