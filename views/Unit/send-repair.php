<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */
$this->title = 'Send Unit To Repair';
$this->params['breadcrumbs'][] = ['label' => 'Item Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Send Unit To Repair'">
<h1><?= Html::encode($this->title) ?></h1>

<p>Serial Number: <?= $model->serial_number ?></p>
<div class="send-repair">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'id_item')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'condition')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'status')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'id_wh')->hiddenInput()->label(false) ?>
        <?= $form->field($model, 'comment')->label(TranslationHelper::translate('Comment should be information about repair')) ?>
    

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
        $(this).prop('disabled', true); // Disable the button
        $(this).text('" . TranslationHelper::translate('Saving...') . "'); // Optionally change the button text
        $(this).closest('form').submit(); // Submit the form
    });
");
?>

    <?php ActiveForm::end(); ?>

</div><!-- send-repair -->
