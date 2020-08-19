<h2>Thêm mới Slide</h2>
<form method="post" action="" enctype="multipart/form-data">
    <div class="form-group">
        <label>Banner</label>
        <input type="file" name="image" class="form-control"/>
    </div>
    <div class="form-group">
        <label>Heading</label>
        <input type="text" name="heading" value="<?php echo isset($_POST['heading']) ? $_POST['heading'] : ''; ?>"
               class="form-control"/>
    </div>
    <div class="form-group">
        <label>Nội dung</label>
        <textarea class="form-control"
                  name="text"><?php echo isset($_POST['text']) ? $_POST['text'] : ''; ?></textarea>
    </div>

    <input type="submit" class="btn btn-primary" name="create" value="Save"/>
    <input type="reset" class="btn btn-secondary" name="reset" value="Reset"/>
</form>