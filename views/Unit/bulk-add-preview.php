<?php
use yii\helpers\Html;
use yii\helpers\Url;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */
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
        var button = $(this);
        button.prop('disabled', true); // Disable the button
        button.text('" . TranslationHelper::translate('Saving...') . "'); // Change button text
        
        // Ensure the form is validated before final submission
        var form = button.closest('form');
        form.on('beforeValidate', function () {
            button.prop('disabled', true).text('" . TranslationHelper::translate('Saving...') . "');
        });
        
        form.on('afterValidate', function (event, messages, errorAttributes) {
            if (errorAttributes.length > 0) {
                // If there are validation errors, re-enable the button
                button.prop('disabled', false).text('" . TranslationHelper::translate('Save') . "');
            }
        });

        form.submit(); // Submit the form
    });
");
?>

