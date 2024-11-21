<?php

use app\models\Item;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate("Item In Warehouse $warehouse_name");
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="Master-Inventory-index">

    <h1><?= Html::encode($this->title) ?></h1>
    
    <p><?= GhostHtml::a(TranslationHelper::translate('Export Data to .xlsx'), ['export/warehouse' ,'id_wh' =>Yii::$app->request->get('id_wh')], ['class' => 'btn btn-info']) ?></p>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'item_name',
                'label' => TranslationHelper::translate('Item Name'),
            ],
            'SKU',
            [
                'attribute' => 'available',
                'label' => TranslationHelper::translate('Available'),
            ],
            [
                'attribute' => 'in_use',
                'label' => TranslationHelper::translate('In-Use'),
            ],
            [
                'attribute' => 'lost',
                'label' => TranslationHelper::translate('Unit Lost'),
            ],
            

        ],
    ]); ?>



</div>
