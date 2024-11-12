<?php

use app\models\Lending;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\date\DatePicker;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/** @var yii\web\View $this */
/** @var app\models\LendigSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Lending History';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-loan-list-history">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php 
            // Button to trigger hidden export form
            echo Html::button('Export Data to .xlsx', [
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
            'serial_number',
            'employee',
            'updated_by',
            'comment',
            [
                'attribute' => 'date',
                'filter' => DatePicker::widget([
                    'model' => $searchModel,
                    'attribute' => 'date',
                    'pluginOptions' => [
                        'autoclose' => true,
                        'format' => 'yyyy-mm-dd', // Adjust to your preferred format
                    ],
                ]),
                'value' => function ($model) {
                    return Yii::$app->formatter->asDate($model['date'], 'php:d F, Y');
                },
                'format' => 'raw',
            ],
            //  'status',
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
            ],
        ],
    ]); ?>

    <?php $exportForm = ActiveForm::begin([
        'id' => 'export-form',
        'method' => 'post',
        'action' => ['export/export-lending-history'],
    ]); ?>

        <?= Html::hiddenInput('LendingSearch[serial_number]', $searchModel->serial_number) ?>
        <?= Html::hiddenInput('LendingSearch[updated_by]', $searchModel->updated_by) ?>
        <?= Html::hiddenInput('LendingSearch[employee]', $searchModel->employee) ?>
        <?= Html::hiddenInput('LendingSearch[comment]', $searchModel->comment) ?>
        <?= Html::hiddenInput('LendingSearch[date]', $searchModel->date) ?>
        <?= Html::hiddenInput('LendingSearch[status]', $searchModel->status) ?>


    <?php ActiveForm::end(); ?>

</div>
