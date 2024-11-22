<?php

use app\models\UnitLog;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\LogSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Unit In-Repair');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-repair-index">

    <h1><?= Html::encode($this->title) ?></h1>


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <p>
        <?php 
            // Button to trigger hidden export form
            echo Html::button(TranslationHelper::translate('Export Data to .xlsx'), [
                'class' => 'btn btn-success',
                'onclick' => "$('#export-form').submit();"
            ]);
        ?>
    </p>
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
                'label' => TranslationHelper::translate('Condition')
            ],
            [
                'attribute' => 'serial_number',
                'label' =>TranslationHelper::translate('Serial Number'),
            ],
            [
                'attribute' => 'status',
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'status',
                    'data' => $statusList, 
                    'options' => ['placeholder' => 'Select Status'],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]),
                'label' =>TranslationHelper::translate('Status'),
            ],
            [
                'attribute' => 'updated_by',
                'label' =>TranslationHelper::translate('Updated By'),
            ],
            [
                'attribute' => 'comment',
                'label' =>TranslationHelper::translate('Comment'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => TranslationHelper::translate('Action'), 
                'template' => '{repairdone}', // Specify the buttons
                'buttons' => [
                    'repairdone' => function ($url, $model, $key) {
                        // Create the "See Detail In Warehouse" button
                        return GhostHtml::a(TranslationHelper::translate('Finish Repair'), ['unit/finish-repair', 'id_unit' => $model['id_unit']], ['class' => 'btn btn-primary', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;']);
                    },
                ],
            ],
        ],
    ]); ?>
    <?php $exportForm = ActiveForm::begin([
        'id' => 'export-form',
        'method' => 'post',
        'action' => ['export/export-repair'],
    ]); ?>

        <?= Html::hiddenInput('DamagedSearch[condition]', $searchModel->condition) ?>
        <?= Html::hiddenInput('DamagedSearch[serial_number]', $searchModel->serial_number) ?>
        <?= Html::hiddenInput('DamagedSearch[status]', $searchModel->status) ?>
        <?= Html::hiddenInput('DamagedSearch[updated_by]', $searchModel->updated_by) ?>
        <?= Html::hiddenInput('DamagedSearch[comment]', $searchModel->comment) ?>

    <?php ActiveForm::end(); ?>


</div>
