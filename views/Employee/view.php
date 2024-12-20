<?php

use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\widgets\DetailView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\Employee $model */

$this->title = $model->id_employee;
$this->params['breadcrumbs'][] = ['label' => 'Employees', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="employee-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= GhostHtml::a('Update', [TranslationHelper::translate('update'), 'id_employee' => $model->id_employee], ['class' => 'btn btn-primary']) ?>
        <?= GhostHtml::a('Delete', [TranslationHelper::translate('delete'), 'id_employee' => $model->id_employee], [
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
            'id_employee',
            'emp_name',
            'phone',
            'email:email',
            'address',
        ],
    ]) ?>

</div>
