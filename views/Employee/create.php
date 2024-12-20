<?php

use yii\helpers\Html;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Employee $model */

$this->title = TranslationHelper::translate('Add Employee');
$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
