<?php if (!empty($product)):
    $style_image = '';
    $style_img_list = '';
    if($product['category_name'] == 'Điện thoại'){
        $style_image = 'height: 23rem';
        $style_img_list = 'height: 15rem';
    }
?>
    <section class="container product-detail" id="item-<?= $product['id'] ?>__detail">
        <div class="row product-detail__content">
            <div class="col-md-6 product-detail__image">
                <div class="image-content">
                    <img style="<?= $style_image?>" src="../backend/assets/uploads/<?= $product['avatar'] ?>">
                </div>
            </div>
            <div class="col-md-6 product-detail__main">
                <div class="content">
                    <h3 class="product-title"><?= $product['name'] ?></h3>
                    <p class="product-price"><?= number_format($product['price']) ?>đ</p>
                    <form action="index.php?controller=cart&action=add" method="post" class="form-payment">
                        <input type="hidden" name="product_id" value="<?= $product['id']?>">
                        <?php if (!empty($product_variants)):
                            $product_variant_name = [];
                            foreach ($product_variants as $key => $product_variant) {
                                $product_variant_name[] = $product_variant['variant_name'];
                            }
                            //sử dụng hàm array_unique để bỏ hết các giá trị trùng lặp
                            $product_variant_name = array_unique($product_variant_name);
                            ?>
                            <div class="section-product-variants">
                                <!-- Nếu mảng trên có đúng 1 phần tử, thì chắc chắn các $product_variant đang chỉ có 1 variant_name, nên sẽ hiển thị chúng -->
                                <div class="variant">
                                    <?php if (count($product_variant_name) == 1): ?>
                                        <h4 class="variant__name"><?= $product_variant_name[0] ?></h4>
                                    <?php endif; ?>
                                    <?php foreach ($product_variants as $key => $product_variant):?>
                                        <!-- Nếu mảng $product_variant_name có nhiều hơn 1 phần tử: -->
                                        <?php if (count($product_variant_name) > 1): ?>
                                            <h4 class="variant__name"><?= $product_variant['variant_name'] ?></h4>
                                        <?php endif; ?>
                                        <div class="variant__block">
                                            <input type="checkbox"
                                                   name="variant_value[]"
                                                   value="<?= $product_variant['variant_value_id']?>"
                                                   class="variant__value" id="product-variant--<?= $product_variant['variant_value_id']?>">
                                            <label for="product-variant--<?= $product_variant['variant_value_id']?>">
                                                <span><?= $product_variant['variant_value']?></span>
                                            </label>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        <?php endif; ?>
                        <button type="submit" name="add_cart" class="btn btn--add-to-cart">
                            Thêm vào giỏ hàng
                        </button>
                        <button type="submit" name="buy_now" class="btn btn--buy-now">
                            Mua ngay
                        </button>
                    </form>
                    <div class="product-description">
                        <h4>Mô tả sản phẩm</h4>
                        <div class="product-description__content">
                            <?= $product['description'] ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="fb-comment" class="container facebook-comment">
        <div class="fb-comments" data-href="https://www.facebook.com/G10-Shop-105030857981906" data-numposts="5" data-width=""></div>
    </div>
    <?php if (!empty($products_random)):?>
        <section class="container product-list products-more">
            <h2>Có thể bạn quan tâm</h2>
            <div class="row">
                <?php foreach ($products_random as $product):?>
                    <div class="col-md-3 col-6 product-content" id="product__item-<?= $product['id']?>">
                        <a title="<?= $product['name']?>" href="index.php?controller=product&action=detail&category_id=<?= $product['category_id']?>&brand_id=<?= $product['brand_id']?>&product_id=<?= $product['id']?>">
                            <img style="<?= $style_img_list?>" src="../backend/assets/uploads/<?= $product['avatar']?>">
                        </a>
                        <p class="product-name"><?= $product['name']?></p>
                        <p class="product-price"><?= number_format($product['price'])?>đ</p>
                    </div>
                <?php endforeach;?>
            </div>
        </section>
    <?php endif;?>
<?php else:
    header("Location: index.php?controller=product&action=index&category_id=$category_id");
    exit();
?>
<?php endif;?>
