<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\RepairLog $model */

$this->title = 'Update Repair Log: ' . $model->id_repair;
$this->params['breadcrumbs'][] = ['label' => 'Repair Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_repair, 'url' => ['view', 'id_repair' => $model->id_repair]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="repair-log-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
