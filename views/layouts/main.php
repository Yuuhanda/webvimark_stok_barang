

<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use yii\bootstrap5\BootstrapAsset;
use webvimark\modules\UserManagement\components\GhostMenu;
use webvimark\modules\UserManagement\UserManagementModule;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\components\GhostNav;

BootstrapAsset::register($this);


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
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>

<header id="header">
<?php

NavBar::begin([
    'brandLabel' => 'Office Invetory',
    'options' => ['class' => 'navbar-expand-md navbar-dark bg-dark fixed-top'],
]);

echo GhostNav::widget([
    'options' => ['class' => 'navbar-nav'],
    'items' => [
        // Inventory Dropdown
        [
            'label' => 'Inventory',
            'items' => [
                ['label' => 'Master Inventory', 'url' => ['/item/index']],
                ['label' => 'Manage Unit', 'url' => ['/unit/index']],
                ['label' => 'Bulk Upload History', 'url' => ['/docs/index']],
                ['label' => 'Unit Usage Log', 'url' => ['/log/index']],
            ]
        ],
        // Item Loaning Dropdown
        [
            'label' => 'Item Loaning',
            'items' => [
                ['label' => 'Unit Loaning', 'url' => ['/lending/index']],
                ['label' => 'Loaning List', 'url' => ['/lending/list']],
                ['label' => 'Lending History', 'url' => ['/lending/lending-history']],
                ['label' => 'Item Loan Report', 'url' => ['/lending/item-report-active']],
                ['label' => 'Unit Loan Report', 'url' => ['/lending/unit-report-active']],
            ],
        ],
        // Unit Damaged & In-Repair Dropdown
        [
            'label' => 'Damaged & In-Repair Unit',
            'items' => [
                ['label' => 'Damaged Unit', 'url' => ['/unit/damaged']],
                ['label' => 'Unit In-Repair', 'url' => ['/unit/repair']]
            ]
        ],
        // Single Links
        ['label' => 'Search & Edit Unit Data', 'url' => ['/unit/correction-search']],
        ['label' => 'Warehouse', 'url' => ['/warehouse/index'], ],
        ['label' => 'Employee', 'url' => ['/employee/index']],
        [
            'label' => 'Admin Menu',
            'items'=>UserManagementModule::menuItems(), 
        ],
        
        
        // User Login/Logout
        Yii::$app->user->isGuest
            ? ['label' => 'Login', 'url' => ['/user-management/auth/login']]
            : ['label' => 'Account Settings', 'url'=>['/user-management/auth/change-own-password']],
            '<li class="nav-item">'
                . Html::beginForm(['/user-management/auth/logout'], 'post')
                . Html::submitButton(
                    'Logout (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'nav-link btn btn-link logout']
                )
                . Html::endForm()
                . '</li>',
    ],
]);

NavBar::end();
?>

</header>


<br>
<main id="main" class="flex-shrink-0" role="main">
    <div class="container">
        <?php if (!empty($this->params['breadcrumbs'])): ?>
            <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
        <?php endif ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>

<footer id="footer" class="mt-auto py-3 bg-light">
    <div class="container">
        <div class="row text-muted">
            <div class="col-md-6 text-center text-md-start">&copy;Fikri A. Yuhanda - Prabubima Tech 2024 || Office Inventory Management Yii2 <?= date('Y') ?></div>
            <!--<div class="col-md-6 text-center text-md-end"><?php //echo Yii::powered() ?></div> -->
        </div>
    </div>
</footer>
<?php



?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
