<?php

use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\LogSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Damaged Unit');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?php 
            // Button to trigger hidden export form
            echo Html::button(TranslationHelper::translate('Export Data to .xlsx'), [
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
                'attribute' => 'condition',
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'condition',
                    'data' => $conditionList, 
                    'options' => ['placeholder' => 'Select Unit Condition'],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]),
                'label' => TranslationHelper::translate('Condition'),
            ],
            [
                'attribute' => 'serial_number',
                'label' => TranslationHelper::translate('Serial Number'),
            ],
            [
                'attribute' => 'status',
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'status',
                    'data' => $statusList, // Ensure $statusList is an array with valid status values
                    'options' => ['placeholder' => TranslationHelper::translate('Select Status')],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]),
            ],
            [
                'attribute' => 'updated_by',
                'label' => TranslationHelper::translate('Updated By'),
            ],
            [
                'attribute' => 'warehouse',
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'warehouse',
                    'data' => $warehouseList, // Assume $warehouseList contains a list of warehouses
                    'options' => ['placeholder' => TranslationHelper::translate('Select Warehouse')],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]),
                'label' => TranslationHelper::translate('Warehouse'),
            ],
            [
                'attribute' => 'comment',
                'label' => TranslationHelper::translate('Comment'),
            ],  
            // Custom action buttons
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{sendrepair}', // Specify the buttons
                'header' => TranslationHelper::translate('Action'), 
                'buttons' => [
                'sendrepair' => function ($url, $model, $key) {
                    // Ensure we are checking the correct value, like a numeric ID or a specific status name
                    if (isset($model['condition']) && $model['stats'] != '2' && $model['stats'] != '3' )  { // Adjust 'Available' based on your actual status name for status = 1
                        return GhostHtml::a(TranslationHelper::translate('Repair'), ['unit/send-repair', 'id_unit' => $model['id_unit']], ['class' => 'btn btn-primary', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;']);
                    }
                    // Return nothing if the status is not 'Available'
                    return '';
                    },
                ],
            ],
        ],
    ]); ?>


<?php $exportForm = ActiveForm::begin([
        'id' => 'export-form',
        'method' => 'post',
        'action' => ['export/export-damaged'],
    ]); ?>

        <?= Html::hiddenInput('DamagedSearch[condition]', $searchModel->condition) ?>
        <?= Html::hiddenInput('DamagedSearch[serial_number]', $searchModel->serial_number) ?>
        <?= Html::hiddenInput('DamagedSearch[status]', $searchModel->status) ?>
        <?= Html::hiddenInput('DamagedSearch[updated_by]', $searchModel->updated_by) ?>
        <?= Html::hiddenInput('DamagedSearch[warehouse]', $searchModel->warehouse) ?>
        <?= Html::hiddenInput('DamagedSearch[comment]', $searchModel->comment) ?>

    <?php ActiveForm::end(); ?>
</div>
