<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use webvimark\modules\UserManagement\components\GhostMenu;
use webvimark\modules\UserManagement\UserManagementModule;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\components\GhostNav;
use app\assets\AdminLteAsset;
use app\helpers\TranslationHelper;

AdminLteAsset::register($this);
AppAsset::register($this);

$this->registerCsrfMetaTags();
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="hold-transition sidebar-mini">
<?php $this->beginBody() ?>

<div class="wrapper">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-black navbar-dark">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-list" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
        </svg>
        <i class="fas fa-bars"></i></a>
        <?= GhostNav::widget([
            'options' => ['class' => 'navbar-nav'],
            'items' => [  
                Yii::$app->user->isGuest
                    ? ['label' => 'Login', 'url' => ['/user-management/auth/login']]
                    : ['label'=> TranslationHelper::translate('Change Password'), 'url'=>['/user-management/auth/change-own-password']],
                    [
                        'label' => TranslationHelper::translate(('Logout')) .' ('. Yii::$app->user->identity->username . ')', 
                        'url' => ['/user-management/auth/logout'], 
                        'linkOptions' => ['data-method' => 'post'],
                        'options' => ['class' => 'ml-auto']  // This aligns the Logout button to the right
                    ],
                    
            ],
            ]) 
        ?>
    </nav>


    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="#" class="brand-link">
            <span class="brand-text font-weight-light">Office Inventory</span>
        </a>

        <div class="sidebar">
            <nav class="mt-2">
            <?= GhostMenu::widget([
                    'options' => ['class' => 'nav nav-pills nav-sidebar flex-column', 'data-widget' => 'treeview', 'role' => 'menu', 'data-accordion' => 'false'],
                    'activateParents' => true,
                    'activeCssClass' => 'active menu-open',
                    'linkTemplate' => '<a href="{url}" class="nav-link {active}">{label}</a>',
                    'submenuTemplate' => "\n<ul class='nav nav-treeview'>\n{items}\n</ul>\n",
                    'items' => [
                        [
                            'label' => TranslationHelper::translate('Inventory'),
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => TranslationHelper::translate('Master Inventory'), 'url' => ['/item/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Item Category'), 'url' => ['/category/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Manage Unit'), 'url' => ['/unit/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Bulk Upload History'), 'url' => ['/docs/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Unit Usage Log'), 'url' => ['/log/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                            ],
                        ],
                        [
                            'label' => TranslationHelper::translate('Lending'),
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => TranslationHelper::translate('Lending'), 'url' => ['/lending/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Lending List'), 'url' => ['/lending/list'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Lending History'), 'url' => ['/lending/lending-history'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Item Lending Report'), 'url' => ['/lending/item-report-active'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Units Lending Report'), 'url' => ['/lending/unit-report-active'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                            ],
                        ],
                        [
                            'label' => TranslationHelper::translate('Damaged & In-Repair Unit'),
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => TranslationHelper::translate('Repair Summary'), 'url' => ['/repair-log/index'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Damaged Unit'), 'url' => ['/unit/damaged'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Unit In-Repair'), 'url' => ['/unit/repair'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                                ['label' => TranslationHelper::translate('Repair Log'), 'url' => ['/repair-log/detail'], 'options' => ['class' => 'nav-item dropdown-indent']], //dropdown item
                            ],
                        ],
                        ['label' =>     TranslationHelper::translate('Edit Unit Data'), 'url' => ['/unit/correction-search'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        ['label' =>     TranslationHelper::translate('Warehouse'), 'url' => ['/warehouse/index'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        ['label' =>     TranslationHelper::translate('Employee'), 'url' => ['/employee/index'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        [
                            'label' => TranslationHelper::translate('Admin Menu'),
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => array_merge(
                                UserManagementModule::menuItems(),
                                [
                                    [
                                        'label' => TranslationHelper::translate('Assign Warehouse Admin'),
                                        'url' => ['/warehouse/assign'], // The route for the new item
                                        'options' => ['class' => 'nav-item dropdown-indent'],
                                    ],
                                ]
                            ),
                        ],
                        ['label' =>     TranslationHelper::translate('User Options'), 'url' => ['/user/options'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',]
                        
                        
                    ],
                ]) ?>
    <br><br>
    <? 
    //echo Html::dropDownList('language', Yii::$app->language, ['en' => 'English', 'id' => 'Indonesian'], [
    //    'id' => 'language-switcher',
    //    'class' => 'form-select',
    //]) 
    ?>

    <?php
    $this->registerJs(<<<JS
    $('#language-switcher').change(function() {
        var selectedLang = $(this).val();
        $.post('/site/set-language', { language: selectedLang }, function() {
            location.reload();
        });
    });
    JS
    );
    ?>


            </nav>
        </div>
    </aside>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="row mb-2">
                    <div class="col-sm-6">
                        <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs'] ?? []]) ?>
                    </div></div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </section>
    </div>
<br>
    <!-- Footer -->
    <footer class="main-footer">
        <strong>&copy; Fikri A. Yuhanda - Prabubima Tech 2024 || Office Inventory Management Yii2 <?= date('Y') ?></strong>
    </footer>
</div>
<?php 
$this->registerJs(<<<JS
// Function to dynamically translate text using the MyMemory Translate API
function translateText(text, sourceLang, targetLang) {
    $.get('/site/translate', { text: text, sourceLang: sourceLang, targetLang: targetLang }, function(data) {
        if (data.success) {
            $('#translated-content').text(data.translatedText); // Update translated content
        } else {
            console.error('Translation failed:', data.error);
        }
    });
}

// Switch language and dynamically translate the page
$('#language-switcher').change(function() {
    var selectedLang = $(this).val();
    var sourceLang = 'en'; // Default source language
    var textToTranslate = $('#content-wrapper').text(); // Example content selector
    var textToTranslate = $('#nav').text(); // Example content selector
    translateText(textToTranslate, sourceLang, selectedLang);
});

JS
, \yii\web\View::POS_READY);

?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>