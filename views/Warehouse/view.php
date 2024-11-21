<?php

use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\widgets\DetailView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Warehouse $model */

$this->title = $model->id_wh;
$this->params['breadcrumbs'][] = ['label' => TranslationHelper::translate('Warehouses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="warehouse-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= GhostHtml::a(TranslationHelper::translate('Update'), ['update', 'id_wh' => $model->id_wh], ['class' => 'btn btn-primary']) ?>
        <?= GhostHtml::a(TranslationHelper::translate('Delete'), ['delete', 'id_wh' => $model->id_wh], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => TranslationHelper::translate('Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_wh',
            'wh_name',
            'wh_address',
        ],
    ]) ?>

</div>
