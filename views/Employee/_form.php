<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;
/** @var yii\web\View $this */
/** @var app\models\Employee $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="employee-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'emp_name')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Employee Name')) ?>

    <?= $form->field($model, 'phone')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Phone')) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Email')) ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Address')) ?>

    <div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
