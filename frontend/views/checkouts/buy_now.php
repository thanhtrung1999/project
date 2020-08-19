<section class="container checkout">
    <h1 class="checkout__title">Thông tin liên hệ</h1>
    <div class="checkout__content">
        <form action="index.php?controller=checkout&action=buy_now" method="post">
            <div class="row checkout__content__main">
                <div class="col-md-7 contact-info">
                    <div class="form-group">
                        <label for="full-name">Họ tên <span style="color: #ff293c">*</span></label>
                        <input type="text" id="full-name" name="full_name" class="form-control" value="<?php isset($_POST['full_name']) ? $_POST['full_name'] : ''?>"/>
                        <p class="error-msg m-0"></p>
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ <span style="color: #ff293c">*</span></label>
                        <input type="text" id="address" name="address" class="form-control" value="<?php isset($_POST['address']) ? $_POST['address'] : ''?>"/>
                        <p class="error-msg m-0"></p>
                    </div>
                    <div class="form-group">
                        <label for="mobile">Điện thoại <span style="color: #ff293c">*</span></label>
                        <input type="text" id="mobile" name="mobile" class="form-control" value="<?php isset($_POST['mobile']) ? $_POST['mobile'] : ''?>"/>
                        <p class="error-msg m-0"></p>
                    </div>
                    <div class="form-group">
                        <label for="email">Email <span style="color: #ff293c">*</span></label>
                        <input type="email" id="email" name="email" class="form-control" value="<?php isset($_POST['email']) ? $_POST['email'] : ''?>"/>
                        <p class="error-msg m-0"></p>
                    </div>
                    <div class="form-group">
                        <label for="note">Thông tin bổ sung</label>
                        <textarea id="note" name="note"
                                  class="form-control"
                                  value="<?php isset($_POST['note']) ? $_POST['note'] : ''?>"
                                  placeholder="Ghi chú về đơn hàng, ví dụ: Thời gian nhận hàng hay chỉ dẫn địa điểm giao hàng chi tiết hơn"></textarea>
                    </div>
                    <div class="row btn-record">
                        <div class="col-md-6">
                            <a href="index.php?controller=cart&action=index">Trở lại giỏ hàng</a>
                        </div>
                        <div class="col-md-6">
                            <div class="float-right">
                                <input type="submit" class="btn btn-order" name="order" value="Đặt hàng">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 cart-info">
                    <?php
                    //tổng giá trị đơn hàng
                    $total_order = 0;
                    ?>
                    <?php if (!empty($product_buy_now)):?>
                        <div class="row cart-info__detail">
                            <?php foreach($product_buy_now AS $product_id => $product): ?>
                                <?php if(!empty($product_variants)):?>
                                    <?php foreach ($product as $variant_id => $item):?>
                                        <div class="col-md-12 cart-info__detail-main">
                                            <div class="row">
                                                <div class="col-md-8 product-info">
                                                    <div class="row">
                                                        <div class="col-md-4 product-info__image">
                                                            <img class="w-100" src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                                                            <span><?= $item['amount']?></span>
                                                        </div>
                                                        <?php
                                                        $color = '';
                                                        foreach ($product_variants as $product_variant){
                                                            if($product_variant['variant_value_id'] == $variant_id){
                                                                $color = $product_variant['variant_value'];
                                                            }
                                                        }
                                                        ?>
                                                        <div class="col-md-8 product-info__title">
                                                            <p><?= $item['name']?></p>
                                                            <p>Color: <?= strtoupper($color)?></p>
                                                            <input type="hidden" name="product_id" value="<?= $product_id?>">
                                                            <input type="hidden" name="variant_value_id" value="<?= $variant_id?>">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 product-price">
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
                                    <?php endforeach;?>
                                <?php else:?>
                                    <div class="col-md-12 cart-info__detail-main">
                                        <div class="row">
                                            <div class="col-md-8 product-info">
                                                <div class="row">
                                                    <div class="col-md-4 product-info__image">
                                                        <img class="w-100" src="../backend/assets/uploads/<?= $product['avatar']?>" alt="">
                                                        <span><?= $product['amount']?></span>
                                                    </div>
                                                    <div class="col-md-8 product-info__title">
                                                        <p><?= $product['name']?></p>
                                                        <input type="hidden" name="product_id" value="<?= $product_id?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 product-price">
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
                                <?php endif;?>
                            <?php endforeach;?>
                        </div>
                    <?php endif;?>
                    <hr/>
                    <div class="row cart-info__total">
                        <div class="col-md-6 cart-total__labels">
                            <span>Tổng đơn hàng</span>
                        </div>
                        <div class="col-md-6 cart-total__content">
                            <div class="float-right"><span><?= number_format($total_order)?>đ</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>