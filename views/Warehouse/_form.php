<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Warehouse $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="warehouse-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'wh_name')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Warehouse Name')) ?>

    <?= $form->field($model, 'wh_address')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Warehouse Name')) ?>

    <div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
