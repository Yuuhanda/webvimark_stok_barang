<?php

use webvimark\modules\UserManagement\components\GhostHtml;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var app\models\Item $model */

?>
<div class="image-preview">
    <?= GhostHtml::img(Url::to('@web/uploads/' . $model->imagefile, $schema = true), ['alt' => $model->item_name, 'class' => 'img-fluid']) ?>
</div>
