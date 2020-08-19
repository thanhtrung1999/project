<!--<pre>-->
<!--    --><?//= print_r($_SESSION['cart'])?>
<!--</pre>-->
<section class="container products-cart">
    <h2 class="products-cart__title">Giỏ hàng của bạn</h2>
    <div class="row products-cart__content">
        <div class="col-12 cart-label">
            <div class="row">
                <div class="col-6"></div>
                <div class="col-6">
                    <div class="row">
                        <p class="col-4 cart-label__item cart-label__price">Giá</p>
                        <p class="col-4 cart-label__item cart-label__amount">Số lượng</p>
                        <p class="col-4 cart-label__item cart-label__total">Tổng</p>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        <form class="w-100 cart-form" action="" method="post">
            <?php
            $total_order = 0;
            ?>
            <div class="row cart-form__content">
                <?php if (!empty($_SESSION['cart'])):
//                    echo "<pre>";
//                    print_r($_SESSION['cart']);
//                    echo "</pre>";
//                    echo count($_SESSION['cart']);
                ?>
                    <?php foreach ($_SESSION['cart'] as $product_id => $product):?>
                        <?php if(!empty($product_variants[$product_id])):?>
                            <?php foreach ($product as $variant_id => $item):?>
                                <div class="col-12 cart-item">
                                    <div class="row">
                                        <div class="col-6 cart-item__left">
                                            <div class="row">
                                                <div class="col-3 product-image">
                                                    <img class="w-100" src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                                                </div>
                                                <div class="col-9 product-title">
                                                    <strong><?= $item['name']?></strong>
                                                    <?php
                                                    $color = '';
                                                    if (!empty($product_variants)){
                                                        foreach ($product_variants[$product_id] as $product_variant){
                                                            if($product_variant['variant_value_id'] == $variant_id){
                                                                $color = $product_variant['variant_value'];
                                                            }
                                                        }
                                                    }
                                                    ?>
                                                    <p>Color: <span><?= strtoupper($color)?></span></p>
                                                    <a href="javascript:void(0)" class="btn btn-outline-danger" onclick="deleteCart(<?= $product_id;?>, <?= $variant_id?>)">Xóa</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 cart-item__right">
                                            <div class="row">
                                                <div class="col-4 text-md-right product-price">
                                                    <span><?= number_format($item['price']); ?>đ</span>
                                                </div>
                                                <div class="col-4 text-md-right product-amount">
                                                    <div class="row justify-content-end product-amount__block">
<!--                                                        <span class="btn-amount minus-amount">-</span>-->
                                                        <input type="number" min="1" step="1" max="10" name="<?= $product_id; ?>"
                                                               id="num-<?= $product_id?>--<?= $variant_id?>"
                                                               class="col-8 p-0 product-amount__input"
                                                               value="<?= $item['amount']?>"
                                                               onchange="updateCart(<?= $product_id?>, <?= $variant_id?>)">
<!--                                                        <span class="btn-amount plus-amount">+</span>-->
                                                    </div>
                                                </div>
                                                <div class="col-4 text-md-right product-total">
                                                    <?php
                                                    //hiển thị Thành tiền tương ứng với từng sp
                                                    $total_product = $item['amount'] * $item['price'];
                                                    //cộng dồn vào biến Tổng giá trị đơn hàng
                                                    $total_order += $total_product;
                                                    echo number_format($total_product) . 'đ';
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 cart-line">
                                    <hr/>
                                </div>
                            <?php endforeach;?>
                        <?php else:?>
                            <div class="col-12 cart-item">
                                <div class="row">
                                    <div class="col-6 cart-item__left">
                                        <div class="row">
                                            <div class="col-3 product-image">
                                                <img class="w-100" src="../backend/assets/uploads/<?= $product['avatar']?>" alt="">
                                            </div>
                                            <div class="col-9 product-title">
                                                <strong><?= $product['name']?></strong>
                                                <a href="javascript:void(0)" class="btn btn-outline-danger" onclick="deleteCart(<?= $product_id;?>)">Xóa</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6 cart-item__right">
                                        <div class="row">
                                            <div class="col-4 text-md-right product-price">
                                                <span><?= number_format($product['price']); ?>đ</span>
                                            </div>
                                            <div class="col-4 text-md-right product-amount">
                                                <div class="row justify-content-end product-amount__block">
<!--                                                    <span class="btn-amount minus-amount">-</span>-->
                                                    <input type="number" min="1" step="1" max="10" name="<?= $product_id; ?>"
                                                           id="num-<?= $product_id?>--"
                                                           class="col-8 p-0 product-amount__input"
                                                           value="<?= $product['amount']?>"
                                                           onchange="updateCart(<?= $product_id?>)">
<!--                                                    <span class="btn-amount plus-amount">+</span>-->
                                                </div>
                                            </div>
                                            <div class="col-4 text-md-right product-total">
                                                <?php
                                                //hiển thị Thành tiền tương ứng với từng sp
                                                $total_product = $product['amount'] * $product['price'];
                                                //cộng dồn vào biến Tổng giá trị đơn hàng
                                                $total_order += $total_product;
                                                echo number_format($total_product) . 'đ';
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 cart-line">
                                <hr/>
                            </div>
                        <?php endif;?>
                    <?php endforeach;?>
                <?php else:?>
                    <?php if (isset($_SESSION['error'])): ?>
                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <h4><?= $_SESSION['error']?></h4>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endif;?>
            </div>
            <div class="row cart-form__total">
                <div class="col-12">
                    <p class="sub-total">Tổng giá trị đơn hàng: <span><?= number_format($total_order)?>đ</span></p>
                </div>
            </div>
            <div class="row cart-form__button">
                <div class="col-12">
                    <a href="index.php?controller=product&action=all" class="btn btn__shopping-continue">Tiếp tục mua hàng</a>
                    <a href="index.php?controller=checkout" class="btn btn__payment">Thanh toán</a>
                </div>
            </div>
        </form>
    </div>
</section>

<script type="text/javascript">
    load_cart_data();
    function updateCart(product_id, variant_value_id = '') {
        let num = $("#num-"+product_id+"--"+variant_value_id).val();
        num = parseInt(num);
        if(num > 10){
            alert("Mỗi sản phầm chỉ được phép mua với số lượng tối đa là 10");
        } else {
            $.post(
                'index.php?controller=cart&action=update',
                {
                    'product_id': product_id,
                    'variant_value_id': variant_value_id,
                    'num': num
                },
                function (data){
                    $('.cart-form').load("index.php?controller=cart&action=index .cart-form");
                }
            );
            $.ajax({
                url: 'index.php?controller=cart&action=fetch_cart',
                method: 'POST',
                dataType: 'json',
                success: function (data) {
                    $('.section-header #cart-quantity').text(data);
                }
            });
        }
    }
    function deleteCart(product_id, variant_value_id = '') {
        $.post(
            'index.php?controller=cart&action=update',
            {
                'product_id': product_id,
                'variant_value_id': variant_value_id,
                'num': 0
            },
            function (data){
                // alert('Xóa sản phẩm thành công');
                $('.cart-form').load("index.php?controller=cart&action=index .cart-form");
            }
        );
        $.ajax({
            url: 'index.php?controller=cart&action=fetch_cart',
            method: 'POST',
            dataType: 'json',
            success: function (data) {
                $('.section-header #cart-quantity').text(data);
            }
        });
    }
</script>