<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\RepairLog $model */

$this->title = $model->id_repair;
$this->params['breadcrumbs'][] = ['label' => 'Repair Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="repair-log-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id_repair' => $model->id_repair], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id_repair' => $model->id_repair], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_repair',
            'id_unit',
            'comment',
            'rep_type',
            'datetime',
        ],
    ]) ?>

</div>
