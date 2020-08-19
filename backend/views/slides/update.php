<?php if (!empty($slide)):?>
    <h2>Chỉnh sửa Slide #<?= $slide['id']?></h2>
    <form method="post" action="" enctype="multipart/form-data">
        <div class="form-group">
            <label>Banner</label>
            <input type="file" name="image" class="form-control"/>
        </div>
        <?php if (!empty($slide['image'])): ?>
            <img src="assets/uploads/<?php echo $slide['image']; ?>" height="50"/>
        <?php endif; ?>
        <div class="form-group">
            <label>Heading</label>
            <input type="text" name="heading" value="<?php echo isset($_POST['heading']) ? $_POST['heading'] : $slide['heading']; ?>"
                   class="form-control"/>
        </div>
        <div class="form-group">
            <label>Nội dung</label>
            <textarea class="form-control"
                      name="text"><?php echo isset($_POST['text']) ? $_POST['text'] : $slide['text']; ?></textarea>
        </div>

        <input type="submit" class="btn btn-primary" name="update" value="Cập nhật"/>
        <input type="reset" class="btn btn-secondary" name="reset" value="Reset"/>
    </form>
<?php endif;?>
