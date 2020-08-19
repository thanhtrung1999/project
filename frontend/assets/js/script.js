$(document).ready(function () {
    $('.carousel').carousel({
        interval: 2400
    });
    $('.g10-section-mobile .menu-toggle').click(function () {
        $('#toggleSection').addClass('open-section-toggle');
    });
    $('.section-toggle i').click(function () {
        $('.section-toggle').removeClass('open-section-toggle');
    });
    $('.section-toggle #mobileNavBar .categories-menu--li').click(function () {
        $(this).find($('div.sub-menu')).slideToggle(600).addClass('slide__open-sub-menu');
    });
    $('.section-header .user .user__block').click(function () {
        $(this).find($('div.sub-block')).toggle();
    });
    // $('.section-product-variants .variant .variant__block label').click(function () {
    //     $(this).toggleClass('active-check');
    // });
    $('.slides .slides__elem').slick({
        dots: true,
        infinite: true,
        autoplay: true,
        autoplaySpeed: 2000,
    });
    $(window).scroll(function (event) {
        let pos_body = $('html, body').scrollTop();
        let pos_main = $('.section-main').offset().top;

        if(pos_body > $(window).height()){
            $('.section-back-to-top').addClass('show-btn').removeClass('section-back-to-top--hidden');;
        } else {
            $('.section-back-to-top').removeClass('show-btn').addClass('section-back-to-top--hidden');
        }
    });
    $('.section-back-to-top').click(function(event) {
        $('html,body').animate({scrollTop:0},800);
    });

    // $('.products-cart .cart-form .cart-item .product-amount .plus-amount').click(function () {
    //     // alert('Cộng');
    //     let amount_input = $(this).parent().parent().find('input.product-amount__input').val();
    //     if(amount_input < 10){
    //         amount_input++;
    //     } else {
    //         amount_input = 10;
    //     }
    //     $(this).parent().parent().find('input.product-amount__input').attr('value', amount_input);
    // });
    // $('.products-cart .cart-form .cart-item .product-amount .minus-amount').click(function () {
    //     // alert('Trừ');
    //     let amount_input = $(this).parent().parent().find('input.product-amount__input').val();
    //     if(amount_input > 1){
    //         amount_input--;
    //     } else {
    //         amount_input = 1;
    //     }
    //     $(this).parent().parent().find('input.product-amount__input').attr('value', amount_input);
    // });
})