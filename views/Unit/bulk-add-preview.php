<?php
use yii\helpers\Html;
use yii\helpers\Url;
use app\helpers\TranslationHelper;

?>

<h1><?= TranslationHelper::translate('Preview Units to be Added')?></h1>
<h4><?= TranslationHelper::translate('Serial Number will be rejected if an identical one is found')?></h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th><?= TranslationHelper::translate('ID Warehouse')?></th>
            <th><?= TranslationHelper::translate('Serial Number')?></th>
            <th><?= TranslationHelper::translate('Comment')?></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($unitData as $unit): ?>
            <tr>
                <td><?= Html::encode($unit['id_wh']) ?></td>
                <td><?= Html::encode($unit['serial_number']) ?></td>
                <td><?= Html::encode($unit['comment']) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?= Html::beginForm(['bulk-add-preview'], 'post') ?>
    <?= Html::submitButton(TranslationHelper::translate('Confirm Save'), ['class' => 'btn btn-success']) ?>
<?= Html::endForm() ?>
