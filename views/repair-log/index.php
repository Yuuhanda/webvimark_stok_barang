<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\helpers\TranslationHelper;
use webvimark\modules\UserManagement\components\GhostHtml;

/** @var yii\web\View $this */
/** @var app\models\RepairLogSearch $searchModel */
/** @var yii\data\ArrayDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Repair Logs Summary');
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
                'label' => TranslationHelper::translate('Year'),
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
                'label' => TranslationHelper::translate('Month'),
            ],
            [
                'attribute' => 'rep_type_1_count',
                'label' => TranslationHelper::translate('Repair Initiated'),
            ],
            [
                'attribute' => 'rep_type_2_count',
                'label' => TranslationHelper::translate('Repair Closed'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{detail}',
                'header' => TranslationHelper::translate('Action'),
                'buttons' => [
                    'detail' => function ($url, $model, $key) {
                        return GhostHtml::a(
                            '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                            </svg>',
                            ['repair-log/detail-single', 'month' => $model['month'], 'year' => $model['year']],
                            [
                                'class' => 'btn btn-info',
                                'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;',
                            ]
                        );
                    },
                ],
            ],
            
        ],
    ]); ?>

</div>
