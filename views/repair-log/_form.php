<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\RepairLog $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="repair-log-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_unit')->textInput() ?>

    <?= $form->field($model, 'comment')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rep_type')->textInput() ?>

    <?= $form->field($model, 'datetime')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
