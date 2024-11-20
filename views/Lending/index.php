<?php

use app\models\UnitLog;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\LogSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Lending');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="unit-loan-list">

    <h1><?= Html::encode($this->title) ?></h1>



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
            [
                'attribute' => 'SKU',
                'label' => 'SKU'
            ],
            [
                'attribute' => 'available',
                //'contentOptions' => ['style' => 'width: 80px; text-align: right;'], 
                'filter' => false, // Disable filter for this column
                'label' => TranslationHelper::translate('Available Unit'),
            ],
            // Custom action buttons
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{loanunit}', // Specify the buttons
                'header' => TranslationHelper::translate('Action'), 
                'buttons' => [
                    'loanunit' => function ($url, $model, $key) {
                        // Check if 'available' is greater than 0
                        if ($model['available'] > 0) {
                            // Create the "Loan A Unit" button
                            return GhostHtml::a(TranslationHelper::translate('Lend a Unit'), ['lending/loan-unit', 'id_item' => $model['id_item']], ['class' => 'btn btn-primary', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;']);
                        }
                        // Return nothing if 'available' is 0 or less
                        return '';
                    },
                ],
            ],
        ],
    ]); ?>



</div>
