<?php
if (isset($_GET['controller']) && $_GET['controller'] == 'user'){
    $action = $_GET['action'];
    $head_title = '';
    $header_text = '';
    if($action == 'login'){
        $head_title = 'Login Page';
        $header_text = 'Đăng nhập';
    }
    if($action == 'register'){
        $head_title = 'Register Page';
        $header_text = 'Đăng ký';
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <base href="<?= $_SERVER['SCRIPT_NAME'] ?>"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= $head_title?></title>
    <link rel="shortcut icon" type="image/png" href="assets/images/logo_3.png"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5efd05f2e8.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="assets/js/script_user.js"></script>
</head>
<body id="userBody">
<div class="container">
    <?php if (isset($_SESSION['success'])): ?>
        <div class="alert alert-success">
            <?php
            echo $_SESSION['success'];
            unset($_SESSION['success']);
            ?>
        </div>
    <?php endif; ?>
    <?php if (isset($_SESSION['error'])): ?>
        <div class="alert alert-danger">
            <?php
            echo $_SESSION['error'];
            unset($_SESSION['error']);
            ?>
        </div>
    <?php endif; ?>
    <?php if (isset($this->error)): ?>
        <div class="alert alert-danger">
            <?php
            echo $this->error;
            unset($this->error);
            ?>
        </div>
    <?php endif; ?>
</div>
<div class="header">
    <h1 class="header__text header__logo">
        <a class="header__logo__link" href="index.php?controller=home">G10 SHOP</a>
    </h1>
    <h2 class="header__text"><?= $header_text?></h2>
</div>
<div class="user-section">
    <main id="main" class="user-section__main">
        <?= $this->content;?>
    </main>
</div>

<?php require_once 'footer.php'?>
</body>