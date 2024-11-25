<?php

use app\models\Lending;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\date\DatePicker;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\widgets\ActiveForm;
use yii\bootstrap5\Modal;
use yii\web\View;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\LendigSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Lending List');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-loan-list">

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

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'serial_number',
                'label' =>TranslationHelper::translate('Serial Number'),
            ],
            [
                'attribute' => 'employee',
                'label' =>TranslationHelper::translate('Employee'),
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
                'label' => TranslationHelper::translate('Date'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{viewImage} {returnunit}',
                'header' => TranslationHelper::translate('Action'),
                'buttons' => [
                    'viewImage' => function ($url, $model, $key) {
                        return GhostHtml::a(
                            '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                              <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                              <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                            </svg>', 
                            '#',
                            [
                                'class' => 'btn btn-secondary',
                                'title' => TranslationHelper::translate('View Image'),
                                'data-bs-toggle' => 'modal',
                                'data-bs-target' => '#imageModal',
                                'data-id' => $model['id_lending'],
                                'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                            ]
                        );
                    },
                    'returnunit' => function ($url, $model, $key) {
                        return GhostHtml::a(TranslationHelper::translate('Returns'), ['unit/return-unit', 'id_unit' => $model['id_unit']], ['class' => 'btn btn-primary', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;']);
                    },
                ],
            ],
        ],
    ]); ?>

    <?php $exportForm = ActiveForm::begin([
        'id' => 'export-form',
        'method' => 'post',
        'action' => ['export/export-lending'],
    ]); ?>

        <?= Html::hiddenInput('LendingSearch[serial_number]', $searchModel->serial_number) ?>
        <?= Html::hiddenInput('LendingSearch[updated_by]', $searchModel->updated_by) ?>
        <?= Html::hiddenInput('LendingSearch[employee]', $searchModel->employee) ?>
        <?= Html::hiddenInput('LendingSearch[comment]', $searchModel->comment) ?>
        <?= Html::hiddenInput('LendingSearch[date]', $searchModel->date) ?>

    <?php ActiveForm::end(); ?>


        <!-- Modal for displaying the image -->
        <?php Modal::begin([
        'id' => 'imageModal',
        'title' => TranslationHelper::translate('Item Image'),
        'size' => Modal::SIZE_LARGE,
        'footer' => Html::button('Close', ['class' => 'btn btn-secondary', 'data-bs-dismiss' => 'modal']),
    ]); ?>
        <div id="modalContent">Loading...</div>
    <?php Modal::end(); ?>
</div>

<?php
$this->registerJs(<<<JS
// JavaScript to load image in the modal when the button is clicked
$(document).on('click', '[data-bs-target="#imageModal"]', function() {
    var itemId = $(this).data('id');
    $.get('view-image', { id: itemId }, function(data) {
        $('#imageModal #modalContent').html(data);
    });
});
JS
, View::POS_READY);
?>