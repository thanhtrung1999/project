<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link">
        <img src="assets/dist/img/AdminLTELogo.png"
             alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="pull-left image">
                <img src="<?php echo isset($avatar) ? 'assets/uploads/'."$avatar" : 'http://www.clker.com/cliparts/d/L/P/X/z/i/no-image-icon-hi.png'?>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p style="margin-bottom: 4px; color: #ffffff"><?php echo $username; ?></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item header" style="color: #ffffff">LAOYOUT ADMIN</li>
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=category&action=index">
                        <i class="fa fa-th"></i> <span>Quản lý danh mục</span>
                        <span class="pull-right-container">
              <!--<small class="label pull-right bg-green">new</small>-->
            </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=product&action=index">
                        <i class="fa fa-code"></i> <span>Quản lý sản phẩm</span>
                        <span class="pull-right-container">
              <!--<small class="label pull-right bg-green">new</small>-->
            </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=slide&action=index">
                        <i class="fas fa-images" style="width: 20px" aria-hidden="true"></i> <span>Quản lý Slide</span>
                        <span class="pull-right-container"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=order&action=index">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>Quản lý đơn hàng</span>
                        <span class="pull-right-container"></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=manager&action=index">
                        <i class="fa fa-user" aria-hidden="true"></i> <span>Quản lý manager</span>
                        <span class="pull-right-container"></span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>