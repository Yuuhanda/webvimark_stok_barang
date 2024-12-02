<?php

use app\helpers\TranslationHelper;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
use yii\bootstrap5\ActiveForm;
use webvimark\extensions\BootstrapSwitch\BootstrapSwitch;

/**
 * @var yii\web\View $this
 * @var webvimark\modules\UserManagement\models\User $model
 * @var yii\bootstrap\ActiveForm $form
 */
?>


<div class="user-form">

    <?php $form = ActiveForm::begin([
        'id' => 'user',
        'layout' => 'horizontal',
        'validateOnBlur' => false,
    ]); ?>

    <?= $form->field($model->loadDefaultValues(), 'status')
        ->dropDownList(User::getStatusList()) ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => 255, 'autocomplete' => 'off']) ?>

    <?php if ($model->isNewRecord): ?>

        <?= $form->field($model, 'password')->passwordInput(['maxlength' => 255, 'autocomplete' => 'off']) ?>

        <?= $form->field($model, 'repeat_password')->passwordInput(['maxlength' => 255, 'autocomplete' => 'off']) ?>

    <?php endif; ?>

    <?php if (User::hasPermission('editUserEmail')): ?>

        <?= $form->field($model, 'email')->textInput(['maxlength' => 255]) ?>
        <?= $form->field($model, 'email_confirmed')->checkbox()->label(TranslationHelper::translate('Email Confirmed')) ?>

    <?php endif; ?>

    <?php if (User::hasPermission('bindUserToIp')): ?>

        <?= $form->field($model, 'bind_to_ip')
            ->textInput(['maxlength' => 255])
            ->hint(UserManagementModule::t('back', 'For example: 123.34.56.78, 168.111.192.12')) ?>

    <?php endif; ?>

    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <?php if ($model->isNewRecord): ?>
                <?= Html::submitButton(
                    '<span class="glyphicon glyphicon-plus-sign"></span> ' . UserManagementModule::t('back', TranslationHelper::translate('Create')),
                    [
                        'class' => 'btn btn-success',
                        'id' => 'create-button', // ID for JavaScript targeting
                    ]
                ) ?>
            <?php else: ?>
                <?= Html::submitButton(
                    '<span class="glyphicon glyphicon-ok"></span> ' . UserManagementModule::t('back', TranslationHelper::translate('Save')),
                    [
                        'class' => 'btn btn-primary',
                        'id' => 'save-button', // ID for JavaScript targeting
                    ]
                ) ?>
            <?php endif; ?>
        </div>
    </div>

<?php
// JavaScript to disable the button and handle form submission
$this->registerJs("
    $('#create-button, save-button').on('click', function () {
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


    <?php ActiveForm::end(); ?>

</div>


<?php BootstrapSwitch::widget() ?>