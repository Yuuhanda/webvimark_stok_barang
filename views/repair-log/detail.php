<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\helpers\TranslationHelper;
use kartik\select2\Select2;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\RepairLogSearch $searchModel */
/** @var yii\data\ArrayDataProvider $dataProvider */
//if there is a year and month in get show it in the title if not just show it as 'Repair Log'
// Retrieve the year and month from the GET parameters
$monthNames = [
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
];

// Dynamically set the title
if ($searchModel->year || $searchModel->month) {
    $monthName = $searchModel->month ? ($monthNames[$searchModel->month] ?? '') : '';
    $this->title = TranslationHelper::translate('Repair Logs for') . ' ' . trim("$monthName $searchModel->year");
} else {
    $this->title = TranslationHelper::translate('Repair Logs');
}

$this->params['breadcrumbs'][] = $this->title;

?>
<div class="repair-log-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?php 
            // Button to trigger hidden export form
            echo GhostHtml::button(TranslationHelper::translate('Export Data to .xlsx'), [
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
                'filter' => Select2::widget([
                    'model' => $searchModel,
                    'attribute' => 'rep_type',
                    'data' => $typeList, // Assume $updatedByList contains a list of users
                    'options' => ['placeholder' => TranslationHelper::translate('Select Type')],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]),
                'label' =>TranslationHelper::translate('Type'),
            ],
            [
                'attribute' => 'datetime',
                'label' => TranslationHelper::translate('date'),
                'value' => function ($model) {
                    return Yii::$app->formatter->asDatetime($model['datetime'], 'php:d F, Y, H:i'); 
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

<?php $exportForm = ActiveForm::begin([
        'id' => 'export-form',
        'method' => 'post',
        'action' => ['export/repair-log'],
    ]); ?>

        <?= Html::hiddenInput('RepairLogSearch[serial_number]', $searchModel->serial_number) ?>
        <?= Html::hiddenInput('RepairLogSearch[item_name]', $searchModel->item_name) ?>
        <?= Html::hiddenInput('RepairLogSearch[rep_type]', $searchModel->rep_type) ?>
        <?= Html::hiddenInput('RepairLogSearch[month]', $searchModel->month) ?>
        <?= Html::hiddenInput('RepairLogSearch[year]', $searchModel->year) ?>

    <?php ActiveForm::end(); ?>

</div>
