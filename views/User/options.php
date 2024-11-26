<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\User $model */

$this->title = TranslationHelper::translate('User Options');
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="user-update">

    <h1><?= Html::encode($this->title) ?></h1>
<br>
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_lang')->dropDownList(
        [
            'en' => 'English',
            'id' => 'Bahasa Indonesia',
            'fr' => 'Français',
            'de' => 'Deutsche',
        ],
        ['prompt' => TranslationHelper::translate('Select Language'), 'required' => true]
    )->label(TranslationHelper::translate('Language')) // add ['required' => true]?> 

    <div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

