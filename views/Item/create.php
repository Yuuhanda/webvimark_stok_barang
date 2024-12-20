<?php

use yii\helpers\Html;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Item $model */

$this->title = TranslationHelper::translate('Create Item');
$this->params['breadcrumbs'][] = ['label' => 'Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-create">

    <h1><?= Html::encode($this->title) ?></h1>
    
    <?= $this->render('_form', [
        'model' => $model,
        'uploadModel' => $uploadModel, 
        'category' => $category, 
    ]) ?>


</div>
