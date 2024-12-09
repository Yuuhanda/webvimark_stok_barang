<?php

use yii\helpers\Html;
use yii\widgets\ActiveField;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Item $model */
/** @var app\models\UploadPicture $uploadModel */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'enableClientValidation' => true,
    'enableAjaxValidation' => false,
    'validateOnSubmit' => true,]); ?>

    <?= $form->field($model, 'item_name')->textInput(['maxlength' => true])
    ->label(TranslationHelper::translate('Item Name'))
    ->hint(TranslationHelper::translate('Enter an item name'))
    ?>

    <?= $form->field($model, 'SKU')->textInput(['maxlength' => true])->label('SKU') ?>


    <?= $form->field($model, 'id_category')->widget(Select2::class, [
        'data' => ArrayHelper::map($category, 'id_category', function($category) {
            return $category['category_name'] . ' (' . $category['cat_code'] . ')';
        }),
        'options' => [
            'placeholder' => TranslationHelper::translate('Select Item Category'),
            'id' => 'unit-dropdown',
        ],
        'pluginOptions' => [
            'allowClear' => true,
        ],
        'bsVersion' => '5', // Set Bootstrap version to 5
    ])->label(TranslationHelper::translate('Item Category')); ?>


    <!-- Image Upload Field -->
    <?= $form->field($uploadModel, 'imageFile')->fileInput([
        'accept' => 'image/*',
        'class' => 'form-control'
    ])->label(TranslationHelper::translate('Item Picture'))
        ->hint(TranslationHelper::translate('Accepted formats: JPG, PNG, JPEG, WEBBP')) 
    ?>

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
    });8
");
//problem encountered. if the form is rejected i.e. field not filled user have to refresh the page
?>


    <?php ActiveForm::end(); ?>

</div>
