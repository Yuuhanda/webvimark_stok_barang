<?php

use app\models\ItemUnit;
use app\models\Item;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\controllers\UnitController;
use webvimark\modules\UserManagement\components\GhostHtml;

/** @var yii\web\View $this */
/** @var app\models\Itemearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Item Units';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-unit-index">

    <h1><?= Html::encode($this->title) ?></h1>


    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            
            'item_name',
            'SKU',
            [
                'attribute' => 'available',
                'contentOptions' => ['style' => 'width: 80px; text-align: right;'], // Adjust width as needed
                'filter' => false, // Disable filter for this column
            ],
            
            // Custom action buttons
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => 'Action', 
                'template' => '{addunit}', // Specify the buttons
                'buttons' => [
                    'addunit' => function ($url, $model, $key) {
                        // Create the "See Detail In Warehouse" button
                        return GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
</svg>', ['unit/add-unit', 'id_item' => $model['id_item']], ['class' => 'btn btn-primary', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'],
                    );
                    },
                ],
            ],
        ],
    ]); ?>


</div>
