<h2>Thêm, sửa, xóa thương hiệu</h2>

<h3>Danh sách thương hiệu</h3>
<form action="" method="post" class="brands-form">
    <table class="table table-bordered brand-list-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Brand name</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <?php if (!empty($brands)):?>
            <?php foreach ($brands as $brand):?>
                <tr>
                    <td><?= $brand['id']?></td>
                    <td><?= $brand['name']?></td>
                    <td>
                        <a title="Xóa hãng"
                           href="index.php?controller=product&action=delete_brand&brand_id=<?= $brand['id']?>"
                           onclick="return confirm('Are you sure delete?')"
                        <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
        </tbody>
    </table>
    <div class="form-group">
        <a class="btn btn-success btn-create-brand">Thêm hãng</a>
        <input type="submit" name="submit" value="Cập nhật" class="btn btn-primary"/>
        <a href="index.php?controller=product&action=index" class="btn btn-default">Back</a>
    </div>
</form>