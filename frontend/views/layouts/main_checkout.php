<!doctype html>
<html lang="en">
<head>
    <base href="<?= $_SERVER['SCRIPT_NAME'] ?>"/>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>G10 Shop</title>
    <link rel="shortcut icon" type="image/png" href="assets/images/logo_3.png"/>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/5efd05f2e8.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="assets/js/script_checkout.js"></script>
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=968723900189443&autoLogAppEvents=1" nonce="Y8sI4hpR"></script>
<div class="container section-error" style="padding: 0">
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

<div id="g10-section-main" class="section-main">
    <main id="main" class="section-main__content">
        <?= $this->content;?>
    </main>
</div>
<div class="g10-section section-back-to-top section-back-to-top--hidden">
    <button class="btn btn-back-to-top"><i class="fas fa-angle-double-up"></i></button>
</div>

<?php require_once 'footer.php'?>