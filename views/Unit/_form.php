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
        $(this).prop('disabled', true); // Disable the button
        $(this).text('" . TranslationHelper::translate('Saving...') . "'); // Optionally change the button text
        $(this).closest('form').submit(); // Submit the form
    });
");
?>

    <?php ActiveForm::end(); ?>

</div>
