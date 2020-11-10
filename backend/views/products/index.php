<?php
require_once 'helpers/Helper.php';
?>
<!--form search-->
<form action="" method="GET">
    <div class="row filter__form">
        <div class="form-group col-md-4 filter__form--by-product-name">
            <label for="product-name">Product name</label>
            <input type="text" name="product_name" value="<?php echo isset($_GET['product_name']) ? $_GET['product_name'] : '' ?>" id="product-name"
                   class="form-control"/>
        </div>
        <div class="form-group col-md-4 filter__form--by-category-name">
            <label for="categories">Chọn danh mục</label>
            <select name="category_id" id="categories" class="form-control">
                <option value="0" selected="selected">--Categories--</option>
                <?php foreach ($categories as $category):

                    $selected = '';
                    if (isset($_GET['category_id']) && $category['id'] == $_GET['category_id']) {
                        $selected = 'selected="selected"';
                    }
                    ?>
                    <option value="<?= $category['id'] ?>" <?= $selected; ?>>
                        <?= $category['name'] ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="form-group col-md-4 filter__form--by-brand-name">
            <a href="index.php?controller=product&action=brands">+</a>
            <label for="brands">Chọn hãng</label>
            <select name="brand_id" id="brands" class="form-control">
                <option value="0" selected="selected">--Brands--</option>
                <?php foreach ($brands as $brand):
                    $selected = '';
                    if (isset($_GET['brand_id']) && $brand['id'] == $_GET['brand_id']) {
                        $selected = 'selected="selected"';
                    }
                    ?>
                    <option value="<?= $brand['id'] ?>" <?= $selected; ?>>
                        <?= $brand['name'] ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <input type="hidden" name="controller" value="product"/>
    <input type="hidden" name="action" value="index"/>
    <input type="submit" name="search" value="Tìm kiếm" class="btn btn-primary"/>
    <a href="index.php?controller=product" class="btn btn-default">Xóa filter</a>
</form>


<h2>Danh sách sản phẩm</h2>
<a href="index.php?controller=product&action=create" class="btn btn-success mb-3">
    <i class="fa fa-plus"></i> Thêm mới
</a>
<table id="products-table" class="table table-bordered product_list_table">
    <thead>
        <tr class="header">
            <th id="sort-by-ID" class="sort" style="display: flex; cursor: pointer;">ID</th>
            <th class="category-name">Category name</th>
            <th class="brand-name">Brand name</th>
            <th class="product-name">Name</th>
            <th>Avatar</th>
            <th>Price</th>
            <th>Status</th>
            <th>Created_at</th>
            <th>Updated_at</th>
            <th></th>
        </tr>
    </thead>
    <tbody id="content">
    <?php if (!empty($products)): ?>
        <?php foreach ($products as $product): ?>
            <tr>
                <td><?php echo $product['id'] ?></td>
                <td class="category-name"><?php echo $product['category_name'] ?></td>
                <td class="brand-name"><?php echo $product['brand_name'] ?></td>
                <td class="product-name"><?php echo $product['name'] ?></td>
                <td>
                    <?php if (!empty($product['avatar'])): ?>
                        <img height="80" src="assets/uploads/<?php echo $product['avatar'] ?>"/>
                    <?php endif; ?>
                </td>
                <td><?php echo number_format($product['price']) ?></td>
                <td><?php echo Helper::getStatusText($product['status']) ?></td>
                <td><?php echo date('d-m-Y H:i:s', strtotime($product['created_at'])) ?></td>
                <td><?php echo !empty($product['updated_at']) ? date('d-m-Y H:i:s', strtotime($product['updated_at'])) : '' ?></td>
                <td class="action">
                    <?php
                    $url_detail = "index.php?controller=product&action=detail&id=" . $product['id'];
                    $url_update = "index.php?controller=product&action=update&id=" . $product['id'];
                    $url_delete = "index.php?controller=product&action=delete&id=" . $product['id'];

                    $disabled_member = '';
                    if(isset($_SESSION['manager'])){
                        if($_SESSION['manager']['level'] == 1){
                            $disabled_member = 'class="hidden"';
                        }
                    }
                    ?>
                    <a title="Chi tiết" href="<?php echo $url_detail ?>"><i class="fa fa-eye"></i></a> &nbsp;&nbsp;
                    <a <?= $disabled_member?> title="Update" href="<?php echo $url_update ?>"><i class="fa fa-pencil-alt"></i></a> &nbsp;&nbsp;
                    <a <?= $disabled_member?> title="Xóa" href="<?php echo $url_delete ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm <?= $product['name']?> không?')"><i
                                class="fa fa-trash"></i></a>
                </td>
            </tr>
        <?php endforeach; ?>

    <?php else: ?>
        <tr>
            <td colspan="9"><h2>No data found</h2></td>
        </tr>
    <?php endif; ?>
    </tbody>
</table>
<?= $pages?>

<div id="asc-or-desc">
    <input type="hidden" id="id_order" value="asc">
</div>
