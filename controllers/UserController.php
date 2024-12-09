<?php
//currently not in use the app uses wevimark's user management module
namespace app\controllers;

use app\models\User;
use app\models\UserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\db\Expression; 
use Yii;
use app\helpers\TranslationHelper;
/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
{
    /**
     * @inheritDoc
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
     * Lists all User models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new User();

        if ($this->request->isPost) {
            if ($model->load($this->request->post())) {
                $model->created_at = new Expression('NOW()');
                $model->updated_at = new Expression('NOW()');
                $model->status = 1;

                // Hash the password before saving
                if (!empty($model->password_hash)) {
                    $model->password_hash = Yii::$app->security->generatePasswordHash($model->password_hash);
                }
                // Get the user's IP address
                $model->registration_ip = Yii::$app->request->userIP;

                // Save the model
                if ($model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    // Handle the error here (e.g., validation failure)
                    Yii::error('Failed to save the model: ' . json_encode($model->errors));
                    Yii::$app->session->setFlash('error', TranslationHelper::translate('Failed to save the model') . json_encode($model->errors));
                    return $this->redirect(['create']);
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post())) {
            if (!empty($model->password_hash)) {
                $model->password_hash = Yii::$app->security->generatePasswordHash($model->password_hash);
            }
            $model->save();
            Yii::$app->session->setFlash('success', TranslationHelper::translate('Admin updated successfully.'));
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionGenerateAuthKeys()
    {
        $users = User::find()->all();
        foreach ($users as $user) {
            if (empty($user->auth_key)) {
                $user->generateAuthKey();
                $user->save(false);
                echo "Generated auth_key for user ID: {$user->id}\n";
            }
        }
    }

    public function actionToggleStatus($id) {
        // Corrected the findOne syntax to use an array
        $user = User::findOne($id);
    
        // Check if the user was found
        if ($user !== null) {
            // Toggle status
            $user->status = $user->status == 1 ? 0 : 1;
    
            // Attempt to save the user model
            if ($user->save()) {
                Yii::$app->session->setFlash('success', TranslationHelper::translate('User status updated successfully.'));
            } else {
                Yii::$app->session->setFlash('error', TranslationHelper::translate('Failed to update user status.'));
            }
        } else {
            Yii::$app->session->setFlash('error', TranslationHelper::translate('User not found.'));
        }
    
        return $this->redirect(['index']);
    }

    public function actionOptions()
    {
        $id = Yii::$app->user->id; // Get the logged-in user's ID
        $model = User::findOne($id); // Retrieve the user's record
    
        if (!$model) {
            throw new \yii\web\NotFoundHttpException('User not found.');
        }
    
        if ($this->request->isPost && $model->load(Yii::$app->request->post())) {
            if ($model->save()) {
                Yii::$app->session->setFlash('success', TranslationHelper::translate('Your preferences have been updated successfully.'));
                return $this->redirect(['options']); // Redirect to the same page
            } else {
                Yii::$app->session->setFlash('error', TranslationHelper::translate('Failed to update your preferences. Please try again.'));
            }
        }
    
        return $this->render('options', [
            'model' => $model,
        ]);
    }
    
    

}
