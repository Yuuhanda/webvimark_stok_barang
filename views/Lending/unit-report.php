<?php

use app\models\UnitLog;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\LogSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Unit Loan Report';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-loan-report">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php 
            // Button to trigger hidden export form
            echo GhostHtml::button( TranslationHelper::translate('Export Data to .xlsx'), [
                'class' => 'btn btn-success',
                'onclick' => "$('#export-form').submit();"
            ]);
        ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel' => $searchModel,
    'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'item_name',
                'value' => 'item_name',
                'label' => TranslationHelper::translate('Item Name'),
            ],
            [
                'attribute' => 'serial_number',
                'value' => 'serial_number',
                'label' => TranslationHelper::translate('Serial Number'),
            ],
            [
                'attribute' => 'number_of_times_unit_is_lent',
                'label' => TranslationHelper::translate('Number of Times Unit is Lent'),
                'filter' => false, // Disable filter for aggregate columns if not needed
            ],
        ],
    ]); ?>

        <!-- Export Form with Hidden Fields -->
        <?php $exportForm = ActiveForm::begin([
            'id' => 'export-form',
            'method' => 'post',
            'action' => ['export/export-unit-report'],
            ]); ?>

                <?= Html::hiddenInput('LendingSearch[item_name]', $searchModel->item_name) ?>
                <?= Html::hiddenInput('LendingSearch[content]', $searchModel->serial_number) ?>
        <?php ActiveForm::end(); ?>


</div>
