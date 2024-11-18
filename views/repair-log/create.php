<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\RepairLog $model */

$this->title = 'Create Repair Log';
$this->params['breadcrumbs'][] = ['label' => 'Repair Logs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="repair-log-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
