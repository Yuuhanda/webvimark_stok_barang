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
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <?= GhostNav::widget([
            'options' => ['class' => 'navbar-nav'],
            'items' => [  
                Yii::$app->user->isGuest
                    ? ['label' => 'Login', 'url' => ['/user-management/auth/login']]
                    : ['label' => 'Logout (' . Yii::$app->user->identity->username . ')', 'url' => ['/user-management/auth/logout'], 'linkOptions' => ['data-method' => 'post']]
            ],
        ]) ?>
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
                    'items' => [
                        [
                            'label' => 'Inventory',
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => 'Master Inventory', 'url' => ['/item/index'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Manage Unit', 'url' => ['/unit/index'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Bulk Upload History', 'url' => ['/docs/index'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Unit Usage Log', 'url' => ['/log/index'], 'options' => ['class' => 'nav-item']], //dropdown item
                            ],
                        ],
                        [
                            'label' => 'Item Loaning',
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => 'Unit Loaning', 'url' => ['/lending/index'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Loaning List', 'url' => ['/lending/list'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Lending History', 'url' => ['/lending/lending-history'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Item Loan Report', 'url' => ['/lending/item-report-active'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Unit Loan Report', 'url' => ['/lending/unit-report-active'], 'options' => ['class' => 'nav-item']], //dropdown item
                            ],
                        ],
                        [
                            'label' => 'Damaged & In-Repair Unit',
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => [
                                ['label' => 'Damaged Unit', 'url' => ['/unit/damaged'], 'options' => ['class' => 'nav-item']], //dropdown item
                                ['label' => 'Unit In-Repair', 'url' => ['/unit/repair'], 'options' => ['class' => 'nav-item']], //dropdown item
                            ],
                        ],
                        ['label' => 'Edit Unit Data', 'url' => ['/unit/correction-search'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        ['label' => 'Warehouse', 'url' => ['/warehouse/index'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        ['label' => 'Employee', 'url' => ['/employee/index'], 'options' => ['class' => 'nav-item'], 'template' => '<a href="{url}" class="nav-link">{label}</a>',], //dropdown item
                        [
                            'label' => 'Admin Menu',
                            'url' => '#',
                            'options' => ['class' => 'nav-item has-treeview'],
                            'template' => '<a href="#" class="nav-link">{label}</a>',
                            'items' => UserManagementModule::menuItems(),
                        ],
                        
                    ],
                ]) ?>

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

    <!-- Footer -->
    <footer class="main-footer">
        <strong>&copy; Fikri A. Yuhanda - Prabubima Tech 2024 || Office Inventory Management Yii2 <?= date('Y') ?></strong>
    </footer>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
