<?php
require_once 'helpers/Helper.php';
?>
<table class="table table-bordered">
    <tr>
        <th>ID</th>
        <td><?php echo $product['id']?></td>
    </tr>
    <tr>
        <th>Category name</th>
        <td><?php echo $product['category_name']?></td>
    </tr>
    <tr>
        <th>Brand name</th>
        <td><?php echo $product['brand_name']?></td>
    </tr>
    <tr>
        <th>Product name</th>
        <td><?php echo $product['name']?></td>
    </tr>
    <tr>
        <th>Avatar</th>
        <td>
            <?php if (!empty($product['avatar'])): ?>
                <img height="80" src="assets/uploads/<?php echo $product['avatar'] ?>"/>
            <?php endif; ?>
        </td>
    </tr>
    <tr>
        <th>Price</th>
        <td><?php echo number_format($product['price']) ?></td>
    </tr>
    <tr>
        <th>Status</th>
        <td><?php echo Helper::getStatusText($product['status']) ?></td>
    </tr>
    <tr>
        <th>Variants</th>
        <td>
            <?php foreach ($product_variants as $product_variant):?>
                <div>
                    <span><b><?= $product_variant['variant_name']?>:</b></span>
                    <span><?= $product_variant['variant_value']?></span>
                </div>
            <?php endforeach;?>
        </td>
    </tr>
    <tr>
        <th>Created at</th>
        <td><?php echo date('d-m-Y H:i:s', strtotime($product['created_at'])) ?></td>
    </tr>
    <tr>
        <th>Updated at</th>
        <td><?php echo !empty($product['updated_at']) ? date('d-m-Y H:i:s', strtotime($product['updated_at'])) : '--' ?></td>
    </tr>
</table>
<a href="index.php?controller=product&action=index" class="btn btn-default">Back</a>