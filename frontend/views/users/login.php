<div class="g10-user user-section__login">
    <div class="row justify-content-center g10-user__block user-section__login--main">
        <div class="col-md-6 col-8 p-10 g10-user__elem g10-user__elem--form">
            <h4 class="title">Đăng nhập</h4>
            <form action="" class="user-section__form" method="post">
                <div class="form-group text-input">
                    <input type="text" placeholder="Username or email"
                           name="username" id="username" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group text-input">
                    <input type="password" placeholder="Password"
                           name="password" id="password" class="form-control">
                    <p class="error-msg"></p>
                </div>
                <div class="form-group user-section__button">
                    <input type="submit" name="login" class="btn section-btn btn-login" value="Đăng nhập">
                    <input type="reset" class="btn section-btn btn-reset" value="Reset">
                </div>
            </form>
            <p id="error-login"></p>
            <div class="text-center register-link">
                <span>Bạn mới đến G10 Shop? <a href="index.php?controller=user&action=register" class="register-link__main">Đăng ký</a></span>
            </div>
        </div>
        <div class="col-md-6 p-10 g10-user__elem g10-user__elem--logo">
            <h3 class="logo">
                <a class="logo__link" href="index.php?controller=home"></a>
            </h3>
        </div>
    </div>
</div>