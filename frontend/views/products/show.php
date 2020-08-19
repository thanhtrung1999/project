<section class="container product-list" id="product__category-<?= $category_by_id['name']?>__brand-<?= $brand_by_id['name']?>">
    <?php if(!empty($products_by_brand)):?>
        <h2 class="category-name"><?= $category_by_id['name']?> / <?= $brand_by_id['name']?></h2>
        <div class="row">
            <?php
            $style_img = '';
            if($category_by_id['name'] == 'Điện thoại'){
                $style_img = 'height: 15rem';
            }
            ?>
            <?php foreach ($products_by_brand as $product):?>
                <div class="col-md-3 col-6 product-content" id="product__item-<?= $product['id']?>">
                    <a title="<?= $product['name']?>" href="index.php?controller=product&action=detail&category_id=<?= $category_by_id['id']?>&brand_id=<?= $brand_by_id['id']?>&product_id=<?= $product['id']?>">
                        <img style="<?= $style_img?>" src="../backend/assets/uploads/<?= $product['avatar']?>">
                    </a>
                    <p class="product-name"><?= $product['name']?></p>
                    <p class="product-price"><?= number_format($product['price'])?>đ</p>
                </div>
            <?php endforeach;?>
        </div>
        <?= $pages?>
    <?php else:?>
        <h2><?= $category_by_id['name']?> <?= $brand_by_id['name']?> hết sản phẩm mất rồi :((</h2>
    <?php endif;?>
</section>