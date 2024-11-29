<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */
$this->title = TranslationHelper::translate('Add New Unit of Item');
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="add-unit">
<h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a(TranslationHelper::translate('Bulk Upload for units'), ['unit/bulk-add', 'id_item' =>Yii::$app->request->get('id_item')], ['class' => 'btn btn-success']) ?>
    </p>
    <?php $form = ActiveForm::begin(); ?>
        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->hiddenInput()->label(false) ?>
        <!-- Dropdown for warehouses: visible wh_name but stores id_wh -->
        <?= $form->field($model, 'id_wh')->dropDownList($whList, ['prompt' => 'Select Warehouse'])->label(TranslationHelper::translate('Warehouse Name')) ?>

        <?= $form->field($model, 'comment')->label(TranslationHelper::translate('Comment')) ?>
        <?= $form->field($model, 'serial_number')->label(TranslationHelper::translate('Serial Number')) ?>
    
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
        $(this).prop('disabled', true); // Disable the button
        $(this).text('" . TranslationHelper::translate('Saving...') . "'); // Optionally change the button text
        $(this).closest('form').submit(); // Submit the form
    });
");
?>
    <?php ActiveForm::end(); ?>

</div><!-- add-unit -->
