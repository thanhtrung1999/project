<h2>Cập nhật sản phẩm</h2>
<div class="form-update-content">
    <form action="" class="form-update" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="category_id">Chọn danh mục</label>
            <select name="category_id" class="form-control" id="category_id">
                <option value="0" selected="selected">--Categories--</option>
                <?php foreach ($categories as $category):
                    $selected = '';
                    if (isset($_POST['category_id']) && $category['id'] == $_POST['category_id']) {
                        $selected = 'selected="selected"';
                    }
                    ?>
                    <option value="<?php echo $category['id'] ?>" <?php echo $selected; ?>>
                        <?php echo $category['name'] ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="form-group">
            <label for="brand_id">Chọn hãng</label>
            <select name="brand_id" class="form-control" id="brand_id">
                <option value="0" selected="selected">--Brands--</option>
                <?php foreach ($brands as $brand):
                    $selected = '';
                    if (isset($_POST['brand_id']) && $brand['id'] == $_POST['brand_id']) {
                        $selected = 'selected="selected"';
                    }
                    ?>
                    <option value="<?php echo $brand['id'] ?>" <?php echo $selected; ?>>
                        <?php echo $brand['name'] ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="form-group">
            <label for="product-name">Nhập tên sản phẩm</label>
            <input type="text" name="product_name" value="<?php echo isset($_POST['product_name']) ? $_POST['product_name'] : $product['name'] ?>"
                   class="form-control" id="product-name"/>
        </div>
        <div class="form-group">
            <label for="avatar">Ảnh đại diện</label>
            <input type="file" name="avatar" value="" class="form-control" id="avatar"/>
            <?php if (!empty($product['avatar'])): ?>
                <img height="80" src="assets/uploads/<?php echo $product['avatar'] ?>"/>
            <?php endif; ?>
        </div>
        <div class="form-group">
            <label for="price">Giá</label>
            <input type="number" name="price" value="<?php echo isset($_POST['price']) ? $_POST['price'] : $product['price'] ?>"
                   class="form-control" id="price"/>
        </div>
        <div class="form-group">
            <label for="summary">Mô tả ngắn sản phẩm</label>
            <textarea name="summary" id="summary"
                      class="form-control"><?php echo isset($_POST['summary']) ? $_POST['summary'] : $product['summary'] ?></textarea>
        </div>
        <div class="form-group">
            <label for="description">Mô tả chi tiết sản phẩm</label>
            <textarea name="description" id="description"
                      class="form-control"><?php echo isset($_POST['description']) ? $_POST['description'] : $product['description'] ?></textarea>
        </div>
        <div class="form-group variants">
            <label>Biến thể của sản phẩm</label>
            <?php if (!empty($product_variants)):?>
                <div class="variants_list" style="max-width: 400px;">
                    <?php foreach ($product_variants as $product_variant):?>
                        <div class="variant-block">
                            <a href="javascript:void(0)" onclick="deleteVariant(<?= $product_variant['variant_value_id']?>)">
                                <i class="fas fa-times"></i>
                            </a>
                            <span><?= $product_variant['variant_value']?></span>
                        </div>
                    <?php endforeach;?>
                </div>
            <?php endif;?>
            <button type="button" class="btn btn-insert-variant">+</button>
        </div>
        <div class="form-group">
            <label for="status">Trạng thái</label>
            <select name="status" class="form-control" id="status">
                <?php
                $selected_disabled = '';
                $selected_active = '';
                if ($product['status'] == 0) {
                    $selected_disabled = 'selected';
                } else {
                    $selected_active = 'selected';
                }
                if (isset($_POST['status'])) {
                    switch ($_POST['status']) {
                        case 0:
                            $selected_disabled = 'selected';
                            break;
                        case 1:
                            $selected_active = 'selected';
                            break;
                    }
                }
                ?>
                <option value="0" <?php echo $selected_disabled; ?>>Disabled</option>
                <option value="1" <?php echo $selected_active ?>>Active</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
            <a href="index.php?controller=product&action=index" class="btn btn-default">Back</a>
        </div>
    </form>
</div>

<script type="text/javascript">
    function deleteVariant(variant_value_id) {
        $.post(
            'index.php?controller=product&action=delete_variant',
            {
                'variant_value_id': variant_value_id,
                'product_id': <?= $product['id']?>
            },
            function (data){
                $('.form-update-content').load("index.php?controller=product&action=update&id=<?= $product['id']?> .form-update");
            }
        )
    }
</script>