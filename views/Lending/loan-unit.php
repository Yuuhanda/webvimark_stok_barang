<?php

use Codeception\Step\Action;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Lending $model */
/** @var ActiveForm $form */
/** @var array $emplist */
/** @var app\models\UploadPicture $uploadModel */
/** @var array $avalunit */
$this->title = TranslationHelper::translate('Lending');
$this->params['breadcrumbs'][] = $this->title;
//['action' => ['lending/create']]
?>

<div class="loan-unit">
<h1><?= Html::encode($this->title) ?></h1>
    <?php $form = ActiveForm::begin([
    'options' => [
        'enctype' => 'multipart/form-data' // required for file uploads
    ],
    'enableClientValidation' => true,
    'enableAjaxValidation' => false, // Set to true if you need AJAX validation
    'method' => 'post',
]); ?>


    
    <!-- Dropdown for available units -->
    <?= $form->field($model, 'id_unit', [
    'labelOptions' => ['label' => 'Select Unit']])->widget(Select2::class, [
        'data' => ArrayHelper::map($avalunit, 'id_unit', function($unit) {
            return $unit['serial_number'] . ' (' . $unit['condition_name'] . ')';
        }),
        'options' => [
            'placeholder' => TranslationHelper::translate('Select Available Unit'),
            'id' => 'unit-dropdown',
        ],
        'pluginOptions' => [
            'allowClear' => true,
        ],
        'bsVersion' => '5', // Set Bootstrap version to 5
       
    ])->label(TranslationHelper::translate('Select Unit Item'));  ?>

    <!-- Hidden field for type -->
    <?= $form->field($model, 'type')->hiddenInput()->label(false) ?>

    <!-- Dropdown for employee list -->
    <?= $form->field($model, 'id_employee')->widget(Select2::class, [
        'data' => $emplist,
        'options' => ['placeholder' => TranslationHelper::translate('Select Employee')],
        'pluginOptions' => [
            'allowClear' => true,
        ],
    ])->label(TranslationHelper::translate('Select Employee')); ?>

    <!-- Image Upload Field -->
    <?= $form->field($uploadModel, 'imageFile')->fileInput()->label(TranslationHelper::translate('Unit Picture')) ?>



    
    <div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div><!-- loan-unit -->

