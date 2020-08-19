$(document).ready(function () {
    let username_elem = $('.user-section__register .user-section__form #username');
    let email_elem = $('.user-section__register .user-section__form #email');
    let password_elem = $('.user-section__register .user-section__form #password');
    let full_name_elem = $('.user-section__register .user-section__form #full-name');
    let phone_elem = $('.user-section__register .user-section__form #phone');

    const regular_username = /^([a-zA-Z_]+)([a-zA-Z_0-9]+)$/;
    const regular_email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    const regular_phone = /^[0-9]{10}$/;

    let error_status;

    username_elem.blur(function () {
        if(username_elem.val() === ''){
            error_status = true;
            username_elem.addClass('error');
            username_elem.parent().find($('p.error-msg')).text('Username không được để trống');
        } else if(!regular_username.test(username_elem.val())) {
            error_status = true;
            username_elem.addClass('error');
            username_elem.parent().find($('p.error-msg')).text('Username sai định dạng');
        } else {
            error_status = false;
            username_elem.removeClass('error');
            username_elem.parent().find($('p.error-msg')).text('');
        }
    });
    email_elem.blur(function () {
        if(email_elem.val() !== '' && !regular_email.test(email_elem.val())){
            error_status = true;
            email_elem.addClass('error');
            email_elem.parent().find($('p.error-msg')).text('Email sai định dạng');
        } else {
            error_status = false;
            email_elem.removeClass('error');
            email_elem.parent().find($('p.error-msg')).text('');
        }
    });
    password_elem.blur(function () {
        if(password_elem.val() === ''){
            error_status = true;
            password_elem.addClass('error');
            password_elem.parent().find($('p.error-msg')).text('Password không được để trống');
        } else if(password_elem.val().length < 5){
            error_status = true;
            password_elem.addClass('error');
            password_elem.parent().find($('p.error-msg')).text('Password phải lớn hơn 5 ký tự');
        } else {
            error_status = false;
            password_elem.removeClass('error');
            password_elem.parent().find($('p.error-msg')).text('');
        }
    });
    full_name_elem.blur(function () {
        if(full_name_elem.val() === ''){
            error_status = true;
            full_name_elem.addClass('error');
            full_name_elem.parent().find($('p.error-msg')).text('Họ và tên không được để trống');
        } else {
            error_status = false;
            full_name_elem.removeClass('error');
            full_name_elem.parent().find($('p.error-msg')).text('');
        }
    });
    phone_elem.blur(function () {
        if(phone_elem.val() === ''){
            error_status = true;
            phone_elem.addClass('error');
            phone_elem.parent().find($('p.error-msg')).text('Số điện thoại không được để trống');
        } else if(!regular_phone.test(phone_elem.val())){
            error_status = true;
            phone_elem.addClass('error');
            phone_elem.parent().find($('p.error-msg')).text('Số điện thoại sai định dạng');
        } else {
            error_status = false
            phone_elem.removeClass('error');
            phone_elem.parent().find($('p.error-msg')).text('');
        }
    });

    $('.user-section__register .g10-user__elem--form .user-section__form').submit(function (event) {
        let form = $(this);
        //validate username
        if(username_elem.val() === ''){
            event.preventDefault();
            error_status = true;
            username_elem.addClass('error');
            username_elem.parent().find($('p.error-msg')).text('Username không được để trống');
        } else if(!regular_username.test(username_elem.val())) {
            event.preventDefault();
            error_status = true;
            username_elem.addClass('error');
            username_elem.parent().find($('p.error-msg')).text('Username sai định dạng');
        } else {
            error_status = false;
            username_elem.removeClass('error');
            username_elem.parent().find($('p.error-msg')).text('');
        }
        //validate email
        if(email_elem.val() !== '' && !regular_email.test(email_elem.val())){
            event.preventDefault();
            error_status = true;
            email_elem.addClass('error');
            email_elem.parent().find($('p.error-msg')).text('Email sai định dạng');
        } else {
            error_status = false;
            email_elem.removeClass('error');
            email_elem.parent().find($('p.error-msg')).text('');
        }
        //validate password
        if(password_elem.val() === ''){
            event.preventDefault();
            error_status = true;
            password_elem.addClass('error');
            password_elem.parent().find($('p.error-msg')).text('Password không được để trống');
        } else if(password_elem.val().length < 5){
            event.preventDefault();
            error_status = true;
            password_elem.addClass('error');
            password_elem.parent().find($('p.error-msg')).text('Password phải lớn hơn 5 ký tự');
        } else {
            error_status = false;
            password_elem.removeClass('error');
            password_elem.parent().find($('p.error-msg')).text('');
        }
        //validate full name
        if(full_name_elem.val() === ''){
            event.preventDefault();
            error_status = true;
            full_name_elem.addClass('error');
            full_name_elem.parent().find($('p.error-msg')).text('Họ và tên không được để trống');
        } else {
            error_status = false;
            full_name_elem.removeClass('error');
            full_name_elem.parent().find($('p.error-msg')).text('');
        }
        //validate phone
        if(phone_elem.val() === ''){
            event.preventDefault();
            error_status = true;
            phone_elem.addClass('error');
            phone_elem.parent().find($('p.error-msg')).text('Số điện thoại không được để trống');
        } else if(!regular_phone.test(phone_elem.val())){
            event.preventDefault();
            error_status = true;
            phone_elem.addClass('error');
            phone_elem.parent().find($('p.error-msg')).text('Số điện thoại sai định dạng');
        } else {
            error_status = false
            phone_elem.removeClass('error');
            phone_elem.parent().find($('p.error-msg')).text('');
        }

        if(error_status === false){
            $.ajax({
                type: "POST",
                url: "index.php?controller=user&action=checkRegister",
                data: form.serialize(),
                success: function (response) {
                    if(response == 'true'){
                        alert("Đăng ký thành công");
                        location.replace("index.php?controller=user&action=login");
                    } else {
                        alert("Đăng ký thất bại");
                    }
                }
            });
        }
    });

    let username_login_elem = $('.user-section__login .user-section__form #username');
    let password_login_elem = $('.user-section__login .user-section__form #password');
    $('.user-section__login .g10-user__elem--form .user-section__form').submit(function (event) {
        let form = $(this);
        //validate username
        if(username_login_elem.val() === ''){
            event.preventDefault();
            error_status = true;
            username_login_elem.addClass('error');
            username_login_elem.parent().find($('p.error-msg')).text('Username không được để trống');
        } else {
            error_status = false;
            username_login_elem.removeClass('error');
            username_login_elem.parent().find($('p.error-msg')).text('');
        }
        //validate password
        if(password_login_elem.val() === '') {
            event.preventDefault();
            error_status = true;
            password_login_elem.addClass('error');
            password_login_elem.parent().find($('p.error-msg')).text('Password không được để trống');
        } else {
            error_status = false;
            password_login_elem.removeClass('error');
            password_login_elem.parent().find($('p.error-msg')).text('');
        }

        if(error_status === false){
            $.ajax({
                type: "POST",
                url: "index.php?controller=user&action=checkLogin",
                data: form.serialize(),
                success: function (response) {
                    // alert(response);
                    if(response !== 'false'){
                        // alert(response);
                        // let obj = JSON.parse(response);
                        $('#error-login').text("");
                        alert("Đăng nhập thành công");
                        location.replace("index.php?controller=home");
                        // document.cookie = `user=${obj};expires=${new Date().getTime() + 999999999}`;
                    } else {
                        $('#error-login').text("Sai username, email hoặc password");
                        return false;
                    }
                }
            });
            return false;
        }
    });
})