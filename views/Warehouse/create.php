<?php

use yii\helpers\Html;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Warehouse $model */

$this->title = TranslationHelper::translate('Add Warehouse');
$this->params['breadcrumbs'][] = ['label' => TranslationHelper::translate('Warehouses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="warehouse-create">

    <h1><?= Html::encode($this->title) ?></h1>
    
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
