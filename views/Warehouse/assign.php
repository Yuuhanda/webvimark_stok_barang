<?php

use app\models\Warehouse;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\WarehouseSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Warehouse Admins');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="warehouse-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'username',
                'label' => TranslationHelper::translate('Username'),
            ],
            [
                'attribute' => 'warehouse',
                'label' => TranslationHelper::translate('Warehouse'),
                'value' => function ($model) {
                    return $model->warehouseRelation ? $model->warehouseRelation->wh_name : '(Not Set)';
                },
                'filter' => Html::activeTextInput($searchModel, 'warehouse', [
                    'class' => 'form-control',
                ]),
            ],
            [
                'attribute' => 'id_wh',
                'label' => TranslationHelper::translate('Id Warehouse'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{assign}',
                'header' => TranslationHelper::translate('Action'),
                'buttons' => [
                    'assign' => function ($url, $model, $key) {
                        return GhostHtml::a(
                            'Assign Admin To Warehouse',
                            ['/warehouse/assign-admins', 'id' => $model->id],
                            [
                                'class' => 'btn btn-primary',
                                'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                            ]
                        );
                    },
                ],
            ],
        ],
    ]); ?>



</div>
