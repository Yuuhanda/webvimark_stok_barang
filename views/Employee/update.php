<?php

use yii\helpers\Html;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Employee $model */

$this->title = TranslationHelper::translate('Update Employee data: ') .' '. $model->id_employee;
$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_employee, 'url' => ['view', 'id_employee' => $model->id_employee]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="employee-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
