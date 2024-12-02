<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */

$this->title = TranslationHelper::translate('Return Unit');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="return-unit">
<h1><?= Html::encode($this->title) ?></h1>
    <p>
    <?php //echo Html::a('Return Unit in Bulk', ['unit/bulk-return', 'id_item' =>Yii::$app->request->get('id_item')], ['class' => 'btn btn-success']) ?>
    </p>
    <?php $form = ActiveForm::begin(); ?>
        <?= $form->field($model, 'id_unit')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->dropDownList($condlist, ['prompt' => TranslationHelper::translate('Select Unit Condition')])->label(TranslationHelper::translate('Condition Name')) ?>
        <!-- Dropdown for warehouses: visible wh_name but stores id_wh -->
        <?= $form->field($model, 'id_wh')->dropDownList($whList, ['prompt' => TranslationHelper::translate('Select Warehouse')])->label(TranslationHelper::translate('Warehouse Name')) ?>

        <?= $form->field($model, 'comment')->label(TranslationHelper::translate('Comment')) ?>
        <?= $form->field($model, 'serial_number')->hiddenInput()->label(false) ?>

        <!-- Image Upload Field -->
        <?= $form->field($uploadModel, 'imageFile')->fileInput(['required' => true])->label(TranslationHelper::translate('Unit Picture')) ?>
    

        <div class="form-group">
            <?= Html::submitButton(TranslationHelper::translate('Return Unit To Warehouse'), [
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

</div><!-- return-unit -->
