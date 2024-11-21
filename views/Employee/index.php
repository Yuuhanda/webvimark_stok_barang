<?php

use app\models\Employee;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\EmployeeSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Employees');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="employee-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= GhostHtml::a(TranslationHelper::translate('Add Employee'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'emp_name',
                'label' => TranslationHelper::translate('Employee Name'),
            ],
            [
                'attribute' => 'phone',
                'label' => TranslationHelper::translate('Phone'),
            ],
            [
                'attribute' => 'email',
                'label' => TranslationHelper::translate('Email'),
            ],
            [
                'attribute' => 'address',
                'label' => TranslationHelper::translate('Address'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete}',
                'header' => TranslationHelper::translate('Action'),
                'buttons' => [
                    'update' => function ($url, $model, $key) {
                        return GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                              <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/>
                                            </svg>', 
                        ['update', 'id_employee' => $model['id_employee']], [
                            'class' => 'btn btn-success',
                            'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                        ]);
                    },
                    'delete' => function ($url, $model, $key) {
                            return GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                </svg>', 
                                ['delete', 'id_employee' => $model['id_employee']], [
                                'class' => 'btn btn-danger',
                                'data' => [
                                    'confirm' => TranslationHelper::translate('Are you sure you want to delete this employee?'),
                                    'method' => 'post', // Yii2's built-in support for form submission on link click
                                ],
                                'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                            ]);
                    },
                    ]
            ],
        ],
    ]); ?>


</div>
