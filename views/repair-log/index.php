<?php

use yii\helpers\Html;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\RepairLogSearch $searchModel */
/** @var yii\data\ArrayDataProvider $dataProvider */

$this->title = 'Repair Logs Summary';
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
                'attribute' => 'year',
                'value' => 'year',
                'filter' => Html::textInput(
                    'RepairLogSearch[year]',
                    $searchModel->year,
                    ['class' => 'form-control', 'placeholder' => 'Year']
                ),
                'contentOptions' => ['style' => 'width: 150px;'],
                'headerOptions' => ['style' => 'width: 150px;'],
            ],
            [
                'attribute' => 'month',
                'value' => function ($model) {
                    return date('F', mktime(0, 0, 0, $model['month'], 10));
                },
                'filter' => Html::dropDownList(
                    'RepairLogSearch[month]',
                    $searchModel->month,
                    [
                        '' => 'All',
                        1 => 'January', 2 => 'February', 3 => 'March',
                        4 => 'April', 5 => 'May', 6 => 'June',
                        7 => 'July', 8 => 'August', 9 => 'September',
                        10 => 'October', 11 => 'November', 12 => 'December',
                    ],
                    ['class' => 'form-control']
                ),
                'contentOptions' => ['style' => 'width: 250px;'],
                'headerOptions' => ['style' => 'width: 250px;'],
            ],
            [
                'attribute' => 'rep_type_1_count',
                'label' => 'Went to Repair',
            ],
            [
                'attribute' => 'rep_type_2_count',
                'label' => 'Repair Closed',
            ],
            //[
            //    'attribute' => 'total_repairs',
            //    'label' => 'Total Repairs',
            //],
        ],
    ]); ?>

</div>
