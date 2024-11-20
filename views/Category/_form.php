<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;
/** @var yii\web\View $this */
/** @var app\models\ItemCategory $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="item-category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'category_name')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Category Name')) ?>

    <?= $form->field($model, 'cat_code')->textInput(['maxlength' => true])->label(TranslationHelper::translate('Category Code'))  ?>

    <div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
