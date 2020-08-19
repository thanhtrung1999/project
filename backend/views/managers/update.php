<h2>Cập nhật manager</h2>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" name="username" id="username"
               value="<?php echo isset($_POST['username']) ? $_POST['username'] : $manager['username'] ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <label for="password">Password <span style="color: red;">*</span></label>
        <input type="password" placeholder="Vui lòng nhập lại password cũ hoặc password bạn mong muốn" name="password" id="password"
               value=""
               class="form-control"/>
    </div>
    <div class="form-group">
        <label for="fullname">Full name</label>
        <input type="text" name="fullname" id="fullname"
               value="<?php echo isset($_POST['fullname']) ? $_POST['fullname'] : $manager['fullname'] ?>"
               class="form-control"/>
    </div>
    <?php
    $disabled_admin = '';
    if(isset($_SESSION['manager'])){
        if($_SESSION['manager']['level'] == 2){
            $disabled_admin = 'disabled="true"';
        }
    }

    $selected_member = '';
    $selected_admin = '';
    $selected_super_admin = '';

    if(isset($_POST['level'])){
        switch ($_POST['level']){
            case 1:
                $selected_member = 'selected';
                break;
            case 2:
                $selected_admin = 'selected';
                break;
            case 3:
                $selected_super_admin = 'selected';
                break;
        }
    }
    switch ($manager['level']){
        case 1:
            $selected_member = 'selected';
            break;
        case 2:
            $selected_admin = 'selected';
            break;
        case 3:
            $selected_super_admin = 'selected';
            break;
    }

    $hidden_member = '';
    if(isset($_SESSION['manager'])){
        if($_SESSION['manager']['level'] == 1){
            $hidden_member = 'hidden';
        }
    }
    ?>
    <div class="form-group <?= $hidden_member?>">
        <label for="level">Quyền</label>
        <select name="level" id="level">
            <option value="0" disabled>--Level--</option>
            <option value="1" <?= $selected_member?>>Member</option>
            <option value="2" <?= $selected_admin?>>Admin</option>
            <option value="3" <?= $selected_super_admin?> <?= $disabled_admin?>>Super Admin</option>
        </select>
    </div>
    <div class="form-group">
        <label for="phone">Phone number</label>
        <input type="text" name="phone" id="phone"
               value="<?php echo isset($_POST['phone']) ? $_POST['phone'] : $manager['phone_number'] ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="text" name="email" id="email"
               value="<?php echo isset($_POST['email']) ? $_POST['email'] : $manager['email'] ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" name="address" id="address"
               value="<?php echo isset($_POST['address']) ? $_POST['address'] : $manager['address'] ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <label for="avatar">Avatar</label>
        <input type="file" name="avatar" id="avatar" class="form-control"/>
        <?php if (!empty($manager['avatar'])): ?>
            <img height="80" src="assets/uploads/<?php echo $manager['avatar'] ?>"/>
        <?php endif; ?>
    </div>
    <div class="form-group">
        <label for="jobs">Jobs</label>
        <input type="text" name="jobs" id="jobs"
               value="<?php echo isset($_POST['jobs']) ? $_POST['jobs'] : $manager['jobs'] ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
        <a href="index.php?controller=manager&action=index" class="btn btn-default">Back</a>
    </div>
</form>