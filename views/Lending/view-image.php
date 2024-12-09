<?php

use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Url;

/** @var app\models\Lending $model */

?>
<div class="image-preview">
    <?= GhostHtml::img(Url::to('@web/uploads/' . $model->pic_loan, $schema = true), ['alt' => $model->id_lending, 'class' => 'img-fluid']) ?>
</div>
