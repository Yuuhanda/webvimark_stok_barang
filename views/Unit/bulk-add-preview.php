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

<?= Html::beginForm(['bulk-add-preview'], 'post', ['id' => 'bulk-add-form']) ?>
    <?= Html::submitButton(TranslationHelper::translate('Confirm Save'), [
        'class' => 'btn btn-success',
        'id' => 'confirm-save-button', // Assign an ID for JavaScript targeting
    ]) ?>
<?= Html::endForm() ?>

<?php
// Add JavaScript code to handle the button disable logic
$this->registerJs("
    $('#confirm-save-button').on('click', function () {
        $(this).prop('disabled', true); // Disable the button
        $(this).text('" . TranslationHelper::translate('Saving...') . "'); // Optionally change the button text
        $('#bulk-add-form').submit(); // Submit the form
    });
");
?>

