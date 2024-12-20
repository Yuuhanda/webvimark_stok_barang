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
<div class="send-unit-repair'">
<h1><?= Html::encode($this->title) ?></h1>

<p>Serial Number: <?= $model->serial_number ?></p>
<div class="send-repair">

    <?php $form = ActiveForm::begin([
        'enableClientValidation' => true,
        'enableAjaxValidation' => false,
        'options' => ['csrf' => true]
    ]); ?>

        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'id_wh')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'comment')->textArea(['rows' => 2])->label(TranslationHelper::translate('Comment should be information about repair')) ?>
    

        <div class="form-group">
            <?= Html::submitButton(TranslationHelper::translate('Send Unit To Repair'), [
                'class' => 'btn btn-primary',
                'id' => 'submit-button', // Assign an ID for JavaScript targeting
            ]) ?>
        </div>

<?php
// Add JavaScript code to handle the button disable logic
$this->registerJs("
    $('#submit-button').on('click', function () {
        var button = $(this);
        button.prop('disabled', true); // Disable the button
        button.text('" . TranslationHelper::translate('Saving...') . "'); // Change button text
        
        // Ensure the form is validated before final submission
        var form = button.closest('form');
        form.on('beforeValidate', function () {
            button.prop('disabled', true).text('" . TranslationHelper::translate('Saving...') . "');
        });
        
        form.on('afterValidate', function (event, messages, errorAttributes) {
            if (errorAttributes.length > 0) {
                // If there are validation errors, re-enable the button
                button.prop('disabled', false).text('" . TranslationHelper::translate('Save') . "');
            }
        });

        form.submit(); // Submit the form
    });
");
?>

    <?php ActiveForm::end(); ?>

</div><!-- send-repair -->

<div class="loading-spinner" style="display:none;">
    <i class="fa fa-spinner fa-spin"></i>
</div>

<?= $form->errorSummary($model) ?>
