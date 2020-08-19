<?php
require_once "controllers/Controller.php";
require_once "models/Manager.php";
require_once "models/Pagination.php";

class ManagerController extends Controller {
    public function index(){
        $manager_model = new Manager();
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $total = $manager_model->getTotal();
        $query_additional = '';
        if(isset($_GET['username'])) {
            $query_additional .= "&username=" . $_GET['username'];
        }
        $params = [
            'total' => $total,
            'limit' => 5,
            'query_string' => 'page',
            'controller' => 'manager',
            'action' => 'index',
            'page' => $page,
            'query_additional' => $query_additional
        ];
        $pagination = new Pagination($params);
        $pages = $pagination->getPagination();
        $managers = $manager_model->getAllPagination($params);

        $this->content = $this->view('views/managers/index.php', [
            'pages' => $pages,
            'managers' => $managers
        ]);

        require_once 'views/layouts/main.php';
    }

    public function create(){
        if(isset($_SESSION['manager']) && $_SESSION['manager']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền thêm manager';
            header("Location: index.php?controller=manager");
            exit();
        }
        if(isset($_POST['create'])){
            $username = $_POST['username'];
            $fullname = $_POST['fullname'];
            $level = $_POST['level'];
            $manager_model = new Manager();
            $manager = $manager_model->getManagerByUsername($username);

            if(empty($username) || empty($fullname)){
                $this->error = 'Các trường bắt buộc phải nhập';
            } else if(!empty($manager)){
                $this->error = 'Username đã tồn tại';
            } else if(empty($level) || $level == 0){
                $this->error = 'Phân quyền manager là bắt buộc';
            } else if(!empty($level)){
                if($_SESSION['manager']['level'] == 2){
                    if($level == 2 || $level == 3){
                        $this->error = 'Mày thích edit HTML của tao không?';
                    }
                }
            }

            if(empty($this->error)){
                $manager_model->username = $username;
                $manager_model->password = password_hash(1, PASSWORD_DEFAULT);
                $manager_model->fullname = $fullname;
                $manager_model->level = $level;
                $is_create = $manager_model->create();

                if($is_create){
                    $_SESSION['success'] = "Thêm manager thành công";
                    header("Location: index.php?controller=manager");
                    exit();
                } else {
                    $_SESSION['error'] = "Thêm manager thất bại";
                }
            }
        }

        $this->content = $this->view('views/managers/create.php');
        require_once 'views/layouts/main.php';
    }

    public function update() {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            header("Location: index.php?controller=manager");
            exit();
        }

        $id = $_GET['id'];
        $manager_model = new Manager();
        $manager = $manager_model->getById($id);

        if($_SESSION['manager']['username'] != $manager['username']){
            if($_SESSION['manager']['level'] <= $manager['level']){
                $_SESSION['error'] = 'Bạn không có quyền cập nhật manager này';
                header("Location: index.php?controller=manager");
                exit();
            }
        }

        if (isset($_POST['submit'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $fullname = $_POST['fullname'];
            $level = $_POST['level'];
            $phone = $_POST['phone'];
            $email = $_POST['email'];
            $address = $_POST['address'];
            $jobs = $_POST['jobs'];
            $check_manager_exist = $manager_model->getManagerByUsername($username);

            if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->error = 'Email không đúng định dạng';
            } else if (empty($password)) {
                $this->error = 'Password bắt buộc phải nhập';
            } else if(!empty($check_manager_exist) && $username != $manager['username']){
                $this->error = 'Username đã tồn tại';
            } else if(!empty($phone) && !is_numeric($phone)){
                $this->error = 'Số điện thoại phải ở dạng số';
            } else if(empty($level) || $level == 0){
                $this->error = 'Quyền manager là bắt buộc';
            } else if ($_FILES['avatar']['error'] == 0) {
                $extension = pathinfo($_FILES['avatar']['name'], PATHINFO_EXTENSION);
                $extension = strtolower($extension);
                $allow_extensions = ['png', 'jpg', 'jpeg', 'gif', 'webp'];
                $file_size_mb = $_FILES['avatar']['size'] / 1024 / 1024;
                $file_size_mb = round($file_size_mb, 2);
                if (!in_array($extension, $allow_extensions)) {
                    $this->error = 'Phải upload avatar dạng ảnh';
                } else if ($file_size_mb > 2) {
                    $this->error = 'File upload không được lớn hơn 2Mb';
                }
            } else if(!empty($level)){
                if($_SESSION['manager']['level'] == 2){
                    if($level == 3){
                        $this->error = 'Mày thích edit HTML của tao không?';
                    }
                }
            }

            if (empty($this->error)) {
                $filename = $manager['avatar'];
                //xử lý upload ảnh nếu có
                if ($_FILES['avatar']['error'] == 0) {
                    $dir_uploads = __DIR__ . '/../assets/uploads';
                    //xóa file ảnh đã update trc đó
                    @unlink($dir_uploads . '/' . $filename);
                    if (!file_exists($dir_uploads)) {
                        mkdir($dir_uploads);
                    }

                    $filename = time() . '-manager-' . $_FILES['avatar']['name'];
                    move_uploaded_file($_FILES['avatar']['tmp_name'], $dir_uploads . '/' . $filename);
                }
                //lưu password dưới dạng mã hóa, hiện tại sử dụng cơ chế bcrypt
                $manager_model->username = $username;
                $manager_model->password = password_hash($password, PASSWORD_DEFAULT);
                $manager_model->fullname = $fullname;
                $manager_model->level = $level;
                $manager_model->phone_number = $phone;
                $manager_model->address = $address;
                $manager_model->email = $email;
                $manager_model->avatar = $filename;
                $manager_model->jobs = $jobs;
                $is_update = $manager_model->update($id);
                if ($is_update) {
                    $_SESSION['success'] = 'Update dữ liệu thành công';
//                    $_SESSION['user_new'] = $user_new;
                    header("Location: index.php?controller=manager");
                    exit();
                } else {
                    $_SESSION['error'] = 'Update dữ liệu thất bại';
                }
            }
        }

        $this->content = $this->view('views/managers/update.php', [
            'manager' => $manager
        ]);

        require_once 'views/layouts/main.php';
    }

    public function delete() {
        if(isset($_SESSION['manager']) && $_SESSION['manager']['level'] == 1){
            $_SESSION['error'] = 'Member không có quyền xóa manager';
            header("Location: index.php?controller=manager");
            exit();
        }
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            $_SESSION['error'] = 'ID không hợp lệ';
            header('Location: index.php?controller=manager');
            exit();
        }

        $id = $_GET['id'];
        if($id == $_SESSION['manager']['id']){
            $_SESSION['error'] = 'Bạn không thể xóa chính bạn';
            header("Location: index.php?controller=manager");
            exit();
        } else {
            $manager_model = new Manager();
            $is_delete = $manager_model->delete($id);
            if ($is_delete) {
                $_SESSION['success'] = 'Xóa dữ liệu thành công';
                header('Location: index.php?controller=manager');
                exit();
            } else {
                $_SESSION['error'] = 'Xóa dữ liệu thất bại';
            }
        }
    }

    public function detail() {
        if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
            header("Location: index.php?controller=manager");
            exit();
        }
        $id = $_GET['id'];
        $manager_model = new Manager();
        $manager = $manager_model->getById($id);

        $this->content = $this->view('views/managers/detail.php', [
            'manager' => $manager
        ]);

        require_once 'views/layouts/main.php';
    }

    public function logout() {

//        session_destroy();
        $_SESSION = [];
        session_destroy();
//        unset($_SESSION['user']);
        $_SESSION['success'] = 'Logout thành công';
        header('Location: index.php?controller=login&action=login');
        exit();
    }
}