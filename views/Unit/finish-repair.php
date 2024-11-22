<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */
$this->title = TranslationHelper::translate('Send Unit To Repair');
$this->params['breadcrumbs'][] = ['label' => 'Item Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Send Unit To Repair">
<h1><?= Html::encode($this->title) ?></h1>

<p>Serial Number: <?= $model->serial_number ?></p>
<div class="finish-repair">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'id_wh')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->dropDownList($condlist, ['prompt' => TranslationHelper::translate('Select Unit Condition')])->label(TranslationHelper::translate('Condition')) ?>
        <!-- Dropdown for warehouses: visible wh_name but stores id_wh -->
        <?= $form->field($model, 'id_wh')->dropDownList($whList, [
            'prompt' => 'Select Warehouse',
            'required' => true
        ])->label(TranslationHelper::translate('Warehouse Name')) ?>
        <?= $form->field($model, 'comment') ?>
    
        <div class="form-group">
            <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- finish-repair -->
