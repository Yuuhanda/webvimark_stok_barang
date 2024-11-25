<?php

use app\models\DocUploaded;
use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\web\JqueryAsset;
use app\helpers\TranslationHelper;
use yii\widgets\ActiveForm;

JqueryAsset::register($this);

/** @var yii\web\View $this */
/** @var app\models\DocSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = TranslationHelper::translate('Bulk Upload History');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="doc-uploaded-index">

    <h1><?= Html::encode($this->title) ?></h1>


    <div class="Delete-form">
        
            <?php $form = ActiveForm::begin([
                'method' => 'get',
                'action' => ['delete-old-docs'],
                'options' => [
                    'onsubmit' => 'return confirm("' . TranslationHelper::translate('Are you sure you want to delete old files?') . '")',
                ],
            ]); ?>
            <div class="row">
            <div class="col-md-6">
                <?= Html::dropDownList(
                    'length',
                    null,
                    [
                        '1' => TranslationHelper::translate('Older than 1 day'),
                        '7' => TranslationHelper::translate('Older than 7 days (1 week)'),
                        '30' => TranslationHelper::translate('Older than 30 days (1 month)'),
                        '365' => TranslationHelper::translate('Older than 365 days (1 year)'),
                    ],
                    ['prompt' => TranslationHelper::translate('Select File Age'), 'class' => 'form-control']
                ) ?>
            </div>

            <div class="col-md-6 text-left"> 
                <?= Html::submitButton(TranslationHelper::translate('Delete old documents'), ['class' => 'btn btn-danger']) ?>
            </div>
            </div>
            <?php ActiveForm::end(); ?>
        
    </div>
    <br>


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?//= Html::a(TranslationHelper::translate('Delete old documents'), ['delete-old-docs'], [
      //      'class' => 'btn btn-danger',
      //      'data' => [
      //          'confirm' => TranslationHelper::translate('Are you sure you want to delete all old document?'),
      //          'method' => 'post',
      //      ],
      //  ]) ?>
        
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'file_name',
                'label' => TranslationHelper::translate('File Name'),
            ],
            [
                'attribute' => 'datetime',
                'value' => function ($model) {
                    return Yii::$app->formatter->asDateTime($model['datetime'], 'php: H:i, d F, Y');
                },
                'label' => TranslationHelper::translate('Date Time'),
            ],
            'username',
            [
                'label' => TranslationHelper::translate('Action'),
                'format' => 'raw',
                'value' => function ($model) {
                    $filePath = Url::to('@web/document/' . $model['file_name']);
                    $viewdocs = Url::to(['view-docs', 'file_name' => $model['file_name']]);
                    $delete = Url::to(['delete' , 'id_doc' => $model['id_doc']]);
                    return GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
                          <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                          <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708z"/>
                        </svg>', $filePath, [
                        'class' => 'btn btn-primary',
                        'target' => '_blank',
                        'data-pjax' => '0',
                        'title' => 'Download', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                    ]) . ' ' .
                    GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                          <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                          <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                        </svg>', $viewdocs, [
                        'class' => 'btn btn-primary',
                        'target' => '_blank',
                        'data-pjax' => '0',
                        'title' => 'View', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                    ]). ' ' .
                    GhostHtml::a('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                          <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                          <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                        </svg>', $delete, [
                        'class' => 'btn btn-danger',
                        'target' => '_blank',
                        'data-pjax' => '0',
                        'data' => [
                            'confirm' => TranslationHelper::translate('Are you sure you want to delete this documen?'),
                            'method' => 'post', // Yii2's built-in support for form submission on link click
                        ],
                        'title' => 'View', 'style' => 'margin-top: 1px; margin-bottom: 1px; font-size: 12px; padding: 3px 6px;'
                    ]);
                },
            ],
            
        ],
    ]); ?>


</div>
