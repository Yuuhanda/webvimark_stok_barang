<?php

use yii\helpers\Html;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Warehouse $model */

$this->title = TranslationHelper::translate('Update Warehouse data: ') . ' ' . $model->id_wh;
$this->params['breadcrumbs'][] = ['label' => TranslationHelper::translate('Warehouses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_wh, 'url' => ['view', 'id_wh' => $model->id_wh]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="warehouse-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
