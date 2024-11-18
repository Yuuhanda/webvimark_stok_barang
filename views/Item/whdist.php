<?php

use app\models\Item;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ItemSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Item Detail In Warehouses';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-whdist">
    <h1><?= Html::encode($this->title) ?></h1>

    <p><?= GhostHtml::a('Export to .xlsx', ['export/wh-dist', 'id_item' => Yii::$app->request->get('id_item')], ['class' => 'btn btn-info']) ?></p>

    <!-- Full Warehouse Distribution -->
    <h2>Warehouse Distribution</h2>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'warehouse',
            'available',
            'in_use',
            'in_repair',
            'lost',
        ],
    ]); ?>

    <div class="card border-primary mb-3" style="max-width: 18rem;">
        <div class="card-body text-primary">
            <?= GridView::widget([
                'dataProvider' => $inRepairProvider,
                'summary' => false, // Hide summary row
                'columns' => [
                    [
                        'attribute' => 'in_repair',
                        'label' => 'Units Undergoing Repair',
                        'contentOptions' => ['style' => 'text-align: center; font-weight: bold;'],
                    ],
                ],
                'options' => ['class' => 'table table-striped table-hover'], // Add Bootstrap classes
            ]); ?>
        </div>
    </div>

</div>

