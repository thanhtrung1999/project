$(document).ready(function () {
    const regular_email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    const regular_phone = /^[0-9]{10}$/;

    $('#full-name').blur(function () {
        if($('#full-name').val() === ''){
            $('#full-name').addClass('error');
            $('#full-name').parent().find($('p.error-msg')).text('Họ và tên không được để trống');
            $('#full-name').parent().find($('label.error')).text('');
            $('#full-name').parent().find($('label.error')).css('display','none');
        } else {
            $('#full-name').removeClass('error');
            $('#full-name').parent().find($('p.error-msg')).text('');
        }
    });
    $('#address').blur(function () {
        if($('#address').val() === ''){
            $('#address').addClass('error');
            $('#address').parent().find($('p.error-msg')).text('Địa chỉ không được để trống');
            $('#address').parent().find($('label.error')).text('');
            $('#address').parent().find($('label.error')).css('display','none');
        } else {
            $('#address').removeClass('error');
            $('#address').parent().find($('p.error-msg')).text('');
        }
    });
    $('#mobile').blur(function () {
        if($('#mobile').val() === ''){
            $('#mobile').addClass('error');
            $('#mobile').parent().find($('p.error-msg')).text('Số điện thoại không được để trống');
            $('#mobile').parent().find($('label.error')).text('');
            $('#mobile').parent().find($('label.error')).css('display','none');
        } else if ($('#mobile').val() !== '' && regular_phone.test($('#mobile').val()) === false){
            $('#mobile').addClass('error');
            $('#mobile').parent().find($('p.error-msg')).text('Số điện thoại sai định dạng');
            $('#mobile').parent().find($('label.error')).text('');
            $('#mobile').parent().find($('label.error')).css('display','none');
        } else {
            $('#mobile').removeClass('error');
            $('#mobile').parent().find($('p.error-msg')).text('');
        }
    });
    $('#email').blur(function () {
        if($('#email').val() === ''){
            $('#email').addClass('error');
            $('#email').parent().find($('p.error-msg')).text('Email không được để trống');
            $('#email').parent().find($('label.error')).text('');
            $('#email').parent().find($('label.error')).css('display','none');
        } else if($('#email').val() !== '' && regular_email.test($('#email').val()) === false){
            $('#email').addClass('error');
            $('#email').parent().find($('p.error-msg')).text('Email sai định dạng');
            $('#email').parent().find($('label.error')).text('');
            $('#email').parent().find($('label.error')).css('display','none');
        } else {
            $('#email').removeClass('error');
            $('#email').parent().find($('p.error-msg')).text('');
        }
    });

    $('.checkout .checkout__content form').submit(function (event) {
        let full_name = $('#full-name').val();
        let address = $('#address').val();
        let phone = $('#mobile').val();
        let email = $('#email').val();
        let note = $('#mote').val()

        if(full_name === ''){
            event.preventDefault();
            $('#full-name').addClass('error');
            $('#full-name').parent().find($('p.error-msg')).text('');
        } else {
            $('#full-name').removeClass('error');
        }

        if(address === ''){
            event.preventDefault();
            $('#address').addClass('error');
            $('#address').parent().find($('p.error-msg')).text('');
        } else {
            $('#address').removeClass('error');
        }

        if(phone === ''){
            event.preventDefault();
            $('#mobile').addClass('error');
            $('#mobile').parent().find($('p.error-msg')).text('');
        } else if (phone !== '' && regular_phone.test(phone) === false){
            event.preventDefault();
            $('#mobile').addClass('error');
            $('#mobile').parent().find($('p.error-msg')).text('');
        } else {
            $('#mobile').removeClass('error');
        }

        if(email === ''){
            event.preventDefault();
            $('#email').addClass('error');
            $('#email').parent().find($('p.error-msg')).text('');
        } else if(email !== '' && regular_email.test(email) === false){
            event.preventDefault();
            $('#email').addClass('error');
            $('#email').parent().find($('p.error-msg')).text('');
        } else {
            $('#email').removeClass('error');
        }
    });
    $('.checkout .checkout__content form').validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            "full_name": {
                required: true
            },
            "address": {
                required: true
            },
            "mobile": {
                required: true,
                number: true,
                maxlength: 10
            },
            "email": {
                required: true,
                email: true
            }
        },
        messages: {
            "full_name": {
                required: "Họ và tên không được để trống"
            },
            "address": {
                required: "Địa chỉ không được để trống"
            },
            "mobile": {
                required: "Số điện thoại không được để trống",
                number: "Số điện thoại sai định dạng",
                maxlength: "Tối đa 10 ký tự"
            },
            "email": {
                required: "Email không được để trống",
                email: "Email sai định dạng"
            }
        }
    });
})