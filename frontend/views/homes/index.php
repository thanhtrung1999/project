<?php require_once 'views/layouts/slide.php'?>

<div class="container categories">
    <h2 class="introduce-title">Shop chúng tôi có</h2>
    <?php if (!empty($categories)):?>
    <div class="row categories__block">
    <?php foreach ($categories as $category):?>
        <div class="col-md-3 category" id="category--<?= $category['id']?>">
            <div class="category__image category__link">
                <a href="index.php?controller=product&action=index&category_id=<?= $category['id']?>">
                    <img src="../backend/assets/uploads/<?= $category['avatar']?>" alt="">
                </a>
            </div>
            <h3 class="category__name"><?= $category['name']?></h3>
        </div>
    <?php endforeach;?>
    </div>
    <?php endif;?>
</div>
<hr class="container line"/>
<div class="list--products list--products-laptop container">
    <?php if (!empty($laptop_dell_limit)):?>
        <div class="categories-brands" id="laptop-dell">
            <h2 class="categories-brands__name"><span>Laptop Dell</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($laptop_dell_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($laptop_asus_limit)):?>
        <div class="categories-brands" id="laptop-asus">
            <h2 class="categories-brands__name"><span>Laptop Asus</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($laptop_asus_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($laptop_lenovo_limit)):?>
        <div class="categories-brands" id="laptop-lenovo">
            <h2 class="categories-brands__name"><span>Laptop Lenovo</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($laptop_lenovo_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($laptop_acer_limit)):?>
        <div class="categories-brands" id="laptop-acer">
            <h2 class="categories-brands__name"><span>Laptop Acer</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($laptop_acer_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <h2>Lap theo khoảng giá</h2>
    <div class="row products--by-price-range">
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=1&max_price=4000000"
               class="price-range__link price-range--2-4">
                    <p>< 4.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=4000000&max_price=8000000"
               class="price-range__link price-range--4-8">
                    <p>4.000.000đ</p>
                    <p>-</p>
                    <p>8.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=8000000&max_price=12000000"
               class="price-range__link price-range--8-12">
                    <p>8.000.000đ</p>
                    <p>-</p>
                    <p>12.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=12000000&max_price=16000000"
               class="price-range__link price-range--12-16">
                    <p>12.000.000đ</p>
                    <p>-</p>
                    <p>16.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=16000000&max_price=20000000"
               class="price-range__link price-range--16-20">
                    <p>16.000.000đ</p>
                    <p>-</p>
                    <p>20.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=laptop&min_price=20000000&max_price=999999999"
               class="price-range__link price-range--20+">
                    <p>20.000.000đ+</p>
            </a>
        </div>
    </div>
</div>
<hr class="container line"/>
<div class="list--products list--products-phone container">
    <?php if (!empty($phone_iphone_limit)):?>
        <div class="categories-brands" id="iphone">
            <h2 class="categories-brands__name"><span>Điện thoại IPhone</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($phone_iphone_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($phone_samsung_limit)):?>
        <div class="categories-brands" id="samsung">
            <h2 class="categories-brands__name"><span>Điện thoại Samsung</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($phone_samsung_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($phone_vsmart_limit)):?>
        <div class="categories-brands" id="vsmart">
            <h2 class="categories-brands__name"><span>Điện thoại Vsmart</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($phone_vsmart_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($phone_realme_limit)):?>
        <div class="categories-brands" id="realme">
            <h2 class="categories-brands__name"><span>Điện thoại Realme</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($phone_realme_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <?php if (!empty($phone_oppo_limit)):?>
        <div class="categories-brands" id="oppo">
            <h2 class="categories-brands__name"><span>Điện thoại Oppo</span></h2>
            <div class="row categories-brands__elem">
                <?php foreach ($phone_oppo_limit as $item):?>
                    <div class="col-md-3 col-6 product-item" id="laptop--item-<?= $item['id']?>">
                        <div class="product-item__image product-item__link">
                            <a href="index.php?controller=product&action=detail&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>&product_id=<?= $item['id']?>">
                                <img src="../backend/assets/uploads/<?= $item['avatar']?>" alt="">
                            </a>
                        </div>
                        <h3 class="product-item__name"><?= $item['name']?></h3>
                    </div>
                <?php endforeach;?>
            </div>
            <div class="more-product"><a class="more-product__link" href="index.php?controller=product&action=show&category_id=<?= $item['category_id']?>&brand_id=<?= $item['brand_id']?>">
                Xem toàn bộ
            </a></div>
        </div>
    <?php endif;?>
    <h2>Điện thoại theo khoảng giá</h2>
    <div class="row products--by-price-range">
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=1&max_price=4000000"
               class="price-range__link price-range--2-4">
                <p>< 4.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=4000000&max_price=8000000"
               class="price-range__link price-range--4-8">
                <p>4.000.000đ</p>
                <p>-</p>
                <p>8.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=8000000&max_price=12000000"
               class="price-range__link price-range--8-12">
                <p>8.000.000đ</p>
                <p>-</p>
                <p>12.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=12000000&max_price=16000000"
               class="price-range__link price-range--12-16">
                <p>12.000.000đ</p>
                <p>-</p>
                <p>16.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=16000000&max_price=20000000"
               class="price-range__link price-range--16-20">
                <p>16.000.000đ</p>
                <p>-</p>
                <p>20.000.000đ</p>
            </a>
        </div>
        <div class="col-2 p-0 price-range__block">
            <a href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=20000000&max_price=999999999"
               class="price-range__link price-range--20+">
                <p>20.000.000đ+</p>
            </a>
        </div>
    </div>
</div>
