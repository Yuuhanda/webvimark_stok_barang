<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var yii\web\View $this */
/** @var app\models\ItemUnit $model */

$this->title = TranslationHelper::translate('Add Unit in Bulk');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="add-unit">
<h1><?= Html::encode($this->title) ?></h1>

<!-- Download Template Button -->
<p>
    <?= Html::a(TranslationHelper::translate('Download Template'), Yii::getAlias('@web') . '/templates/add-unit-template.xlsx', [
        'class' => 'btn btn-primary',
        'target' => '_blank', // Opens in a new tab
        'download' => 'add-unit-template.xlsx', // Initiates download
    ]) ?>
</p>

<!-- Upload Form -->
<?php $form = ActiveForm::begin([
    'options' => ['enctype' => 'multipart/form-data']
]) ?>

<?= $form->field($model, 'file')->fileInput() ?>

<div class="form-group">
    <?= Html::submitButton(TranslationHelper::translate('Save'), [
        'class' => 'btn btn-primary',
        'id' => 'submit-button', // Assign an ID for JavaScript targeting
    ]) ?>
</div>

<?php
// Add JavaScript code to handle the button disable logic
$this->registerJs("
    $('#submit-button').on('click', function () {
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


<?php ActiveForm::end() ?>
</div>