<?php
$year = '';
$username = '';
$jobs = '';
$avatar = '';

if (isset($_SESSION['manager'])) {
    $username = $_SESSION['manager']['username'];
    $jobs = $_SESSION['manager']['jobs'];
    $avatar = $_SESSION['manager']['avatar'];
    $year = date('Y', strtotime($_SESSION['manager']['created_at']));
}
?>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="index.php" class="nav-link">Home</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->
        <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="<?php echo isset($avatar) ? 'assets/uploads/'."$avatar" : 'http://www.clker.com/cliparts/d/L/P/X/z/i/no-image-icon-hi.png'?>" class="user-image" alt="User Image">
                <span class="hidden-xs"><?php echo $username; ?></span>
            </a>
            <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                    <img src="<?php echo isset($avatar) ? 'assets/uploads/'."$avatar" : 'http://www.clker.com/cliparts/d/L/P/X/z/i/no-image-icon-hi.png'?>" class="img-circle" alt="User Image">

                    <p>
                        <?php echo $username . ' - ' . $jobs; ?>
                        <!--Nguyễn Viết Mạnh - Web Developer-->
                        <small>Thành viên từ năm <?php echo $year; ?></small>
                    </p>
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                    <?php
                    $url_detail = "index.php?controller=manager&action=detail&id=" . $_SESSION['manager']['id'];
                    ?>
                    <div class="pull-left">
                        <a href="<?=$url_detail?>" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                        <a href="index.php?controller=manager&action=logout" class="btn btn-default btn-flat">Sign
                            out</a>
                    </div>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<!-- /.navbar -->