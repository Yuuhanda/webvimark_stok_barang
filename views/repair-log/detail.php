<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\helpers\TranslationHelper;
use webvimark\modules\UserManagement\components\GhostHtml;

/** @var yii\web\View $this */
/** @var app\models\RepairLogSearch $searchModel */
/** @var yii\data\ArrayDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Repair Logs');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="repair-log-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'serial_number',
                'value' => 'serial_number',
                'label' => TranslationHelper::translate('serial_number'),
            ],
            [
                'attribute' => 'item_name',
                'label' => TranslationHelper::translate('item_name'),
            ],
            [
                'attribute' => 'rep_type',
                'label' => TranslationHelper::translate('Type'),
            ],
            [
                'attribute' => 'datetime',
                'label' => TranslationHelper::translate('date'),
                'value' => function ($model) {
                    return Yii::$app->formatter->asDatetime($model['datetime'], 'php:F j, Y H:i'); 
                },
                'filter' => '<div style="display: flex; gap: 10px;">' . Html::dropDownList(
                    'RepairLogSearch[month]', // Ensure the search model has a `month` attribute
                    $searchModel->month,
                    [
                        '' => 'All',
                        1 => 'January',
                        2 => 'February',
                        3 => 'March',
                        4 => 'April',
                        5 => 'May',
                        6 => 'June',
                        7 => 'July',
                        8 => 'August',
                        9 => 'September',
                        10 => 'October',
                        11 => 'November',
                        12 => 'December',
                    ],
                    ['class' => 'form-control', 'prompt' => TranslationHelper::translate('Select Month')] //i need it to select year too
                )
                . '<br>' . 
                Html::dropDownList(
                    'RepairLogSearch[year]', 
                    $searchModel->year,
                    array_combine(range(date('Y') - 10, date('Y')), range(date('Y') - 10, date('Y'))), // Last 10 years
                    ['class' => 'form-control', 'prompt' => TranslationHelper::translate('Select Year')]
                ).
                '</div>',
                'filterInputOptions' => ['class' => 'form-control', 'id' => null],
            ],
            

        ],
    ]); ?>

</div>