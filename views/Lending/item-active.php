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

$this->title = TranslationHelper::translate('Item Lending Report');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-loan-report">

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
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel' => $searchModel,
    'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'item_name',
                'label' => TranslationHelper::translate('Item Name')
            ],
            'SKU',
            [
                'attribute' => 'total_item_lent',
                'label' => TranslationHelper::translate('Total Item Lent')
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{detail}',
                'header' => TranslationHelper::translate('Action'), 
                'buttons' => [
                    'detail' => function ($url, $model, $key) {
                        return GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                        </svg>', 
                        ['lending/history-detail', 'id_item' => $model['id_item']], [
                            'class' => 'btn btn-info',
                            'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                        ]);
                    },
                ],

            ],
        ],
    ]); ?>

        <!-- Export Form with Hidden Fields -->
        <?php $exportForm = ActiveForm::begin([
            'id' => 'export-form',
            'method' => 'post',
            'action' => ['export/export-item-report'],
            ]); ?>

                <?= Html::hiddenInput('LendingSearch[item_name]', $searchModel->item_name) ?>
                <?= Html::hiddenInput('LendingSearch[content]', $searchModel->SKU) ?>
                <?= Html::hiddenInput('LendingSearch[id_item]', $searchModel->id_item) ?>
        <?php ActiveForm::end(); ?>

</div>
