<form method="GET" action="">
    <div class="form-group">
        <label for="username">Nhập username</label>
        <input type="text" name="username" id="username"
               value="<?php echo isset($_GET['username']) ? $_GET['username'] : '' ?>" class="form-control"/>
        <input type="hidden" name="controller" value="manager"/>
        <input type="hidden" name="action" value="index"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Tìm kiếm" name="search" class="btn btn-primary"/>
        <a href="index.php?controller=manager" class="btn btn-default">Back</a>
    </div>
</form>

<h2>Danh sách manager</h2>
<?php
$disabled_member = '';
if(isset($_SESSION['manager'])){
    if($_SESSION['manager']['level'] == 1){
        $disabled_member = 'disabled="true"';
    }
}
?>
<a href="index.php?controller=manager&action=create" class="btn btn-success mb-3" <?= $disabled_member?>>
    <i class="fa fa-plus"></i> Thêm mới
</a>
<table class="table table-bordered user-list-table">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Full name</th>
        <th>phone</th>
        <th>address</th>
        <th>email</th>
        <th>avatar</th>
        <th>jobs</th>
        <th>created_at</th>
        <th></th>
    </tr>
    <?php if (!empty($managers)): ?>
        <?php foreach ($managers as $manager): ?>
            <tr>
                <td><?php echo $manager['id'] ?></td>
                <td><?php echo $manager['username'] ?></td>
                <td><?php echo $manager['fullname'] ?></td>
                <td><?php echo $manager['phone_number'] ?></td>
                <td><?php echo $manager['address'] ?></td>
                <td><?php echo $manager['email'] ?></td>
                <td>
                    <?php if (!empty($manager['avatar'])): ?>
                        <img height="80" src="assets/uploads/<?php echo $manager['avatar'] ?>"/>
                    <?php endif; ?>
                </td>
                <td><?php echo $manager['jobs'] ?></td>
                <td><?php echo date('d-m-Y H:i:s', strtotime($manager['created_at'])) ?></td>
                <?php
                $disabled = '';
                if(isset($_SESSION['manager'])){
                    if($_SESSION['manager']['username'] != $manager['username']) {
                        if ($_SESSION['manager']['level'] <= $manager['level']) {
                            $disabled = 'hidden';
                        }
                    }
                }
                ?>
                <td class="action">
                    <?php
                    $url_detail = "index.php?controller=manager&action=detail&id=" . $manager['id'];
                    $url_update = "index.php?controller=manager&action=update&id=" . $manager['id'];
                    $url_delete = "index.php?controller=manager&action=delete&id=" . $manager['id'];
                    ?>
                    <a title="Chi tiết" href="<?php echo $url_detail ?>"><i class="fa fa-eye"></i></a> &nbsp;&nbsp;
                    <a class="<?= $disabled?>" title="Update" href="<?php echo $url_update ?>" <?= $disabled_member?>><i class="fa fa-pencil-alt"></i></a> &nbsp;&nbsp;
                    <a class="<?= $disabled?>" title="Xóa" href="<?php echo $url_delete ?>" <?= $disabled_member?> onclick="return confirm('Bạn có chắc chắn xóa người quản trị này?')"><i
                                class="fa fa-trash"></i></a>
                </td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
    <?php endif; ?>
</table>
<?php echo $pages; ?>