<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\helpers\TranslationHelper;

/** @var array $whList */
/** @var string $username */
/** @var \app\models\User $userdata */

$this->title = TranslationHelper::translate("Assign Warehouse Admins {$username}");
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="assign-admins">
    <h1><?= Html::encode($this->title) ?></h1>

    <p><?=TranslationHelper::translate("Assigning a warehouse to an admin will restrict the account to only be able to access items & warehouse they are assigned to")?> <strong><?//= Html::encode($username) ?></strong>.</p>

    <div class="warehouse-assignment-form">
        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($userdata, 'id_wh')->widget(Select2::class, [
            'data' => $whList,
            'options' => ['placeholder' => 'Select a warehouse...'],
            'pluginOptions' => ['allowClear' => true],
        ])->label(TranslationHelper::translate('Warehouse')) ?>

<div class="form-group">
        <?= Html::submitButton(TranslationHelper::translate('Assign Admin'), [
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
    });8
");
//problem encountered. if the form is rejected i.e. field not filled user have to refresh the page
?>
        <?php ActiveForm::end(); ?>
    </div>
</div>
