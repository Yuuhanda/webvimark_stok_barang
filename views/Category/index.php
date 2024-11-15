<?php

use app\models\ItemCategory;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\CategorySearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Item Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-category-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Item Category', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'category_name',
            [
                'attribute' => 'cat_code',
                'label' => 'Category Code', // Custom label for cat_code
            ],
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, ItemCategory $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_category' => $model->id_category]);
                 }
            ],
        ],
    ]); ?>


</div>
