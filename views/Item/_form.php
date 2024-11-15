<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\models\Item $model */
/** @var app\models\UploadPicture $uploadModel */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="item-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'item_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'SKU')->textInput(['maxlength' => true]) ?>


    <?= $form->field($model, 'id_category')->widget(Select2::class, [
        'data' => ArrayHelper::map($category, 'id_category', function($category) {
            return $category['category_name'] . ' (' . $category['cat_code'] . ')';
        }),
        'options' => [
            'placeholder' => 'Select Item Category',
            'id' => 'unit-dropdown',
        ],
        'pluginOptions' => [
            'allowClear' => true,
        ],
        'bsVersion' => '5', // Set Bootstrap version to 5
    ]); ?>


    <!-- Image Upload Field -->
    <?= $form->field($uploadModel, 'imageFile')->fileInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
