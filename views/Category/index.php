<?php

use app\models\ItemCategory;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\CategorySearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Item Categories');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-category-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(TranslationHelper::translate('Create Item Category'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            [
                'attribute' => 'category_name',
                'label' => TranslationHelper::translate('Category Name'), // Custom label for cat_code
            ],
            [
                'attribute' => 'cat_code',
                'label' => TranslationHelper::translate('Category Code'), // Custom label for cat_code
            ],
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, ItemCategory $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id_category' => $model->id_category]);
                 },
            ],
        ],
    ]); ?>


</div>
