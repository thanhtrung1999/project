<h2>Danh sách Slide</h2>
<a href="index.php?controller=slide&action=create" class="btn btn-success mb-3">
    <i class="fa fa-plus"></i> Thêm mới
</a>
<table class="table table-bordered slide-list-table">
    <tr>
        <th>ID</th>
        <th>Image</th>
        <th>Heading</th>
        <th>Text</th>
        <th>Created at</th>
        <th>Update at</th>
        <th></th>
    </tr>
    <tbody>
    <?php if (!empty($slides)):?>
        <?php foreach ($slides as $slide):?>
            <tr>
                <td><?= $slide['id']?></td>
                <td>
                    <?php if (!empty($slide['image'])): ?>
                        <img height="80" src="assets/uploads/<?php echo $slide['image'] ?>"/>
                    <?php endif; ?>
                </td>
                <td><?= $slide['heading']?></td>
                <td><?= $slide['text']?></td>
                <td><?= date('d-m-Y H:i:s', strtotime($slide['created_at'])) ?></td>
                <td><?php echo !empty($slide['updated_at']) ? date('d-m-Y H:i:s', strtotime($slide['updated_at'])) : '' ?></td>
                <td>
                    <?php
                    $url_update = "index.php?controller=slide&action=update&id=" . $slide['id'];
                    $url_delete = "index.php?controller=slide&action=delete&id=" . $slide['id'];
                    ?>
                    <a title="Update" href="<?php echo $url_update ?>"><i class="fa fa-pencil-alt"></i></a> &nbsp;&nbsp;
                    <a title="Xóa" href="<?php echo $url_delete ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa slide này không?')"><i
                            class="fa fa-trash"></i></a>
                </td>
            </tr>
        <?php endforeach;?>
    <?php else:?>
    <tr>
        <td colspan="7">Không có dữ liệu</td>
    </tr>
    <?php endif;?>
    </tbody>
</table>