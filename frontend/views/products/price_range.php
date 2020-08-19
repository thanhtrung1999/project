<?php
$min = $_GET['min_price'];
$max = $_GET['max_price'];
$active_range_1 = '';
$active_range_2 = '';
$active_range_3 = '';
$active_range_4 = '';
$active_range_5 = '';
$active_range_6 = '';

if($min == 1 && $max == 4000000){
    $active_range_1 = 'active-range';
}
if($min == 4000000 && $max == 8000000){
    $active_range_2 = 'active-range';
}
if($min == 8000000 && $max == 12000000){
    $active_range_3 = 'active-range';
}
if($min == 12000000 && $max == 16000000){
    $active_range_4 = 'active-range';
}
if($min == 16000000 && $max == 20000000){
    $active_range_5 = 'active-range';
}
if($min == 20000000 && $max == 999999999){
    $active_range_6 = 'active-range';
}
?>

<section class="container product-list">
    <div class="product--price-range-dropdown">
        <?php if ($products[0]['category_name'] == 'Laptop'):?>
            <div class="dropdown">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Chọn khoảng giá Laptop
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item <?= $active_range_1?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=1&max_price=4000000">
                        < 4.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_2?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=4000000&max_price=8000000">
                        4.000.000đ - 8.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_3?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=8000000&max_price=12000000">
                        8.000.000đ - 12.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_4?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=12000000&max_price=16000000">
                        12.000.000đ - 16.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_5?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=16000000&max_price=20000000">
                        16.000.000đ - 20.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_6?>"
                       href="index.php?controller=product&action=price_range&category_name=laptop&min_price=20000000&max_price=999999999">
                        20.000.000đ+
                    </a>
                </div>
            </div>
        <?php endif;?>
        <?php if ($products[0]['category_name'] == 'Điện thoại'):?>
            <div class="dropdown">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Chọn khoảng giá Điện thoại
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item <?= $active_range_1?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=1&max_price=4000000">
                        < 4.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_2?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=4000000&max_price=8000000">
                        4.000.000đ - 8.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_3?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=8000000&max_price=12000000">
                        8.000.000đ - 12.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_4?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=12000000&max_price=16000000">
                        12.000.000đ - 16.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_5?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=16000000&max_price=20000000">
                        16.000.000đ - 20.000.000đ
                    </a>
                    <a class="dropdown-item <?= $active_range_6?>"
                       href="index.php?controller=product&action=price_range&category_name=điện thoại&min_price=20000000&max_price=999999999">
                        20.000.000đ+
                    </a>
                </div>
            </div>
        <?php endif;?>
    </div>
    <?php if(!empty($products)):?>
        <div class="row">
            <?php foreach ($products as $product):
                $style_img = '';
                if($product['category_name'] == 'Điện thoại'){
                    $style_img = 'height: 15rem';
                }
            ?>
                <div class="col-md-3 col-6 product-content" id="product__item-<?= $product['id']?>">
                    <a title="<?= $product['name']?>" href="index.php?controller=product&action=detail&category_id=<?= $product['category_id']?>&brand_id=<?= $product['brand_id']?>&product_id=<?= $product['id']?>">
                        <img style="<?= $style_img?>" src="../backend/assets/uploads/<?= $product['avatar']?>">
                    </a>
                    <p class="product-name"><?= $product['name']?></p>
                    <p class="product-price"><?= number_format($product['price'])?>đ</p>
                </div>
            <?php endforeach;?>
        </div>
    <?php else:?>
        <h2>Không có sản phẩm trong khoảng giá từ <?= $_GET['min_price']?> đến <?= $_GET['max_price']?></h2>
    <?php endif;?>
</section>
