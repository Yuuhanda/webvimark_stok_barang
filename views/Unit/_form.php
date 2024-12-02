<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;


/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="item-unit-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_item')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'id_wh')->textInput() ?>

    <?= $form->field($model, 'comment')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'serial_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'condition')->textInput() ?>

    <div class="form-group">
    <?= Html::submitButton(TranslationHelper::translate('Save'), [
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

</div>
