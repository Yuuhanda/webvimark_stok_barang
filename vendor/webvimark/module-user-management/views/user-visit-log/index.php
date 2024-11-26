<?php

use webvimark\extensions\DateRangePicker\DateRangePicker;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
use yii\widgets\Pjax;
use webvimark\extensions\GridPageSize\GridPageSize;
use yii\grid\GridView;
use app\helpers\TranslationHelper;
/**
 * @var yii\web\View $this
 * @var yii\data\ActiveDataProvider $dataProvider
 * @var webvimark\modules\UserManagement\models\search\UserVisitLogSearch $searchModel
 */

$this->title = UserManagementModule::t('back', TranslationHelper::translate('User Visit log'));
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-visit-log-index">

	<?php // echo $this->render('_search', ['model' => $searchModel]); ?>

	<div class="panel panel-default">

		<div class="panel-body">

			<div class="row">
				<div class="col-sm-12 text-right">
					<?= GridPageSize::widget(['pjaxId'=>'user-visit-log-grid-pjax']) ?>
				</div>
			</div>

			<?php Pjax::begin([
				'id'=>'user-visit-log-grid-pjax',
			]) ?>

			<?= GridView::widget([
				'id'=>'user-visit-log-grid',
				'dataProvider' => $dataProvider,
				'pager'=>[
					'options'=>['class'=>'pagination pagination-sm'],
					'hideOnSinglePage'=>true,
					'lastPageLabel'=>'>>',
					'firstPageLabel'=>'<<',
				],
				'layout'=>'{items}<div class="row"><div class="col-sm-8">{pager}</div><div class="col-sm-4 text-right">{summary}</div></div>',
				'filterModel' => $searchModel,
				'columns' => [
					['class' => 'yii\grid\SerialColumn', 'options'=>['style'=>'width:10px'] ],

					[
						'attribute'=>'user_id',
						'value'=>function($model){
								return Html::a(@$model->user->username, ['view', 'id'=>$model->id], ['data-pjax'=>0]);
							},
						'format'=>'raw',
					],
					[
						'attribute' => 'language',
						'label' => TranslationHelper::translate('Language'),
					],
					'os',
					'browser',
					array(
						'attribute'=>'ip',
						'value'=>function($model){
								return Html::a($model->ip, "http://ipinfo.io/" . $model->ip, ["target"=>"_blank"]);
							},
						'format'=>'raw',
					),
					['attribute'=>'visit_time:datetime',
					'value' => function ($model) {
						return Yii::$app->formatter->asDate($model['visit_time'], 'php:H:i d F, Y');
					},
					'format' => 'raw',
					'label' => TranslationHelper::translate('Visit Time : Date')
					],
					[
						'class' => 'yii\grid\ActionColumn',
						'template'=>'{view}',
						'contentOptions'=>['style'=>'width:70px; text-align:center;'],
					],
				],
			]); ?>
		
			<?php Pjax::end() ?>
		</div>
	</div>
</div>

<?php DateRangePicker::widget([
	'model'     => $searchModel,
	'attribute' => 'visit_time',
]) ?>