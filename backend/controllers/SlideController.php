<?php
require_once 'controllers/Controller.php';
require_once 'models/Slide.php';

class SlideController extends Controller {
    public function index(){
        $slide_model = new Slide();
        $slides = $slide_model->getAllSlides();

        $this->content = $this->view('views/slides/index.php', [
            'slides' => $slides
        ]);
        require_once 'views/layouts/main.php';
    }

    public function create(){
        if(isset($_POST['create'])){
            $heading = $_POST['heading'];
            $text = $_POST['text'];
            $image = $_FILES['image'];

            if($image['error'] == 0){
                $extension = pathinfo($image['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $arr_extension = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'jfif'];

                $file_size_mb = $image['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);

                if (!in_array($extension, $arr_extension)) {
                    $this->error = 'Cần upload file định dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được quá 2MB';
                }
            } else {
                $this->error = 'Lỗi';
            }

            if (empty($this->error)){
                $filename = '';

                if ($image['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }

                    $filename = time() . '-slide-' . $image['name'];
                    move_uploaded_file($image['tmp_name'], $dir_uploads . '/' . $filename);
                }

                $slide_model = new Slide();
                $slide_model->heading = $heading;
                $slide_model->text = $text;
                $slide_model->image = $filename;
                $is_insert = $slide_model->insertSlide();

                if ($is_insert) {
                    $_SESSION['success'] = 'Thêm mới thành công';
                } else {
                    $_SESSION['error'] = 'Thêm mới thất bại';
                }
                header('Location: index.php?controller=slide&action=index');
                exit();
            }
        }

        $this->content = $this->view('views/slides/create.php');
        require_once 'views/layouts/main.php';
    }

    public function update(){
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID category không hợp lệ';
            header('Location: index.php?controller=slide');
            exit();
        }

        $id = $_GET['id'];
        $slide_model = new Slide();
        $slide = $slide_model->getSlideById($id);

        if(isset($_POST['update'])){
            $image = $_FILES['image'];
            $heading = $_POST['heading'];
            $text = $_POST['text'];

            if($image['error'] == 0){
                $extension = pathinfo($image['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $arr_extension = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'jfif'];

                $file_size_mb = $image['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);

                if (!in_array($extension, $arr_extension)) {
                    $this->error = 'Cần upload file định dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được quá 2MB';
                }
            }

            $file = $slide['image'];
            if(empty($this->error)){
                if ($image['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }
                    @unlink($dir_uploads . '/' . $file);
                    $file = time() . '-slide-' . $image['name'];
                    move_uploaded_file($image['tmp_name'], $dir_uploads . '/' . $file);
                }
                $slide_model->image = $file;
                $slide_model->heading = $heading;
                $slide_model->text = $text;
                $slide_model->updated_at = date('Y-m-d H:i:s');
                $is_update = $slide_model->updateSlide($id);

                if ($is_update) {
                    $_SESSION['success'] = 'Update thành công';
                } else {
                    $_SESSION['error'] = 'Update thất bại';
                }
                header('Location: index.php?controller=slide');
                exit();
            }
        }

        $this->content = $this->view('views/slides/update.php', [
            'slide' => $slide
        ]);
        require_once 'views/layouts/main.php';
    }

    public function delete(){
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=slide&action=index');
            exit();
        }
        $id = $_GET['id'];
        $slide_model = new Slide();
        $is_delete = $slide_model->deleteSlide($id);

        if ($is_delete) {
            $_SESSION['success'] = 'Xóa thành công';
        } else {
            $_SESSION['error'] = 'Xóa thất bại';
        }
        header('Location: index.php?controller=slide&action=index');
        exit();
    }
}