<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var array $whList */
/** @var string $username */
/** @var \app\models\User $userdata */

$this->title = "Assign Warehouse Admins #{$username}";
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="assign-admins">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>Assign a warehouse to the admin <strong><?= Html::encode($username) ?></strong>.</p>

    <div class="warehouse-assignment-form">
        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($userdata, 'id_wh')->widget(Select2::class, [
            'data' => $whList,
            'options' => ['placeholder' => 'Select a warehouse...'],
            'pluginOptions' => ['allowClear' => true],
        ])->label('Warehouse') ?>

        <div class="form-group mt-3">
            <?= Html::submitButton('Assign', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>
