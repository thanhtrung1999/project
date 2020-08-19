<div class="g10-user user-section__register">
    <div class="row justify-content-center g10-user__block user-section__register--main">
        <div class="col-md-6 col-8 p-10 g10-user__elem g10-user__elem--form">
            <h4 class="title">Đăng ký</h4>
            <form action="" class="user-section__form" method="post">
                <div class="form-group text-input">
                    <input type="text" placeholder="Username"
                           name="username" id="username" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="email" placeholder="Email"
                           name="email" id="email" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="password" placeholder="Password"
                           name="password" id="password" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="text" placeholder="Họ và tên"
                           name="full_name" id="full-name" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="text" placeholder="Điện thoại"
                           name="phone" id="phone" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="text" placeholder="Địa chỉ"
                           name="address" id="address" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group user-section__button">
                    <input type="submit" name="register" class="btn section-btn btn-register" value="Đăng ký">
                    <input type="reset" class="btn section-btn btn-reset" value="Reset">
                </div>
            </form>
            <div class="text-center login-link">
                <span>Bạn đã có tài khoản? <a href="index.php?controller=user&action=login" class="login-link__main">Đăng nhập</a></span>
            </div>
        </div>
        <div class="col-md-6 p-10 g10-user__elem g10-user__elem--logo">
            <h3 class="logo">
                <a class="logo__link" href="index.php?controller=home"></a>
            </h3>
        </div>
    </div>
</div>