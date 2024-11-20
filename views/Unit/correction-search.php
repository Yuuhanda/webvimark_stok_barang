<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;
/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
/** @var ActiveForm $form */
$this->title = TranslationHelper::translate('Search Data');
$this->params['breadcrumbs'][] = ['label' => 'Item Units', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="correction-search">
    <h1><?= Html::encode($this->title) ?></h1>
    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'serial_number')->label(TranslationHelper::translate('Search Serial Number')) ?>
    
        <div class="form-group">
            <?= Html::submitButton(TranslationHelper::translate('Search'), ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- correction-search -->
