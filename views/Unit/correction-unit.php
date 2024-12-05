<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;
/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */
$this->title = TranslationHelper::translate('Edit Unit Data');
$this->params['breadcrumbs'][] = ['label' => 'Item Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="correction-unit">
<h1><?= Html::encode($this->title) ?></h1>
<p><?=TranslationHelper::translate('Serial Number : ')?><?= $model->serial_number ?></p>
    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->dropDownList($statslist, ['prompt' => 'Select Unit Status'])->label(TranslationHelper::translate('Status')) ?>
        <?= $form->field($model, 'condition')->dropDownList($condlist, ['prompt' => 'Select Unit Condition'])->label(TranslationHelper::translate('Condition')) ?>
        <!-- Dropdown for warehouses: visible wh_name but stores id_wh -->
        <?= $form->field($model, 'id_wh')->dropDownList($whList, ['prompt' => 'Select Warehouse'])->label(TranslationHelper::translate('Warehouse Name')) ?>
        <?= $form->field($model, 'comment')->textarea( ['rows' => 2])->label(TranslationHelper::translate('Comment')) ?>
        <?= $form->field($model, 'serial_number')->hiddenInput()->label(false) ?>
    
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

</div><!-- correction-unit -->
