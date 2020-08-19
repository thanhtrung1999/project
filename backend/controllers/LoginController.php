<?php
require_once 'models/Manager.php';

class LoginController
{
    public $content;
    public $error;
    
    public function view($file, $variables = []) {
        date_default_timezone_set("Asia/Ho_Chi_Minh");
        
        extract($variables);
        ob_start();
        
        require_once "$file";
        $render_view = ob_get_clean();

        return $render_view;
    }

    public function login() {
        if (isset($_SESSION['manager'])) {
            header('Location: index.php?controller=product&action=index');
            exit();
        }
        if (isset($_POST['submit'])) {
            $username = $_POST['username'];
            $password = $_POST['password'];

            if (empty($username) || empty($password)) {
                $this->error = 'Username hoặc password không được để trống';
            }
            $manager_model = new Manager();
            if (empty($this->error)) {
                $manager = $manager_model->getManagerByUsernameAndPassword($username, $password);
                if ($manager == false) {
                    $this->error = 'Sai username hoặc password';
                } else {
                    $_SESSION['success'] = 'Đăng nhập thành công';
                    //tạo session user để xác định manager nào đang login
                    $_SESSION['manager'] = $manager;
                    header("Location: index.php?controller=product");
                    exit();
                }
            }
        }
        $this->content = $this->view('views/managers/login.php');

        require_once 'views/layouts/main_login.php';
    }

    public function register() {

        if (isset($_POST['submit'])) {
            $manager_model = new Manager();
            $username = $_POST['username'];
            $password = $_POST['password'];
            $password_confirm = $_POST['password_confirm'];
            $fullname = $_POST['fullname'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $email = $_POST['email'];
            $jobs = $_POST['jobs'];
            $manager = $manager_model->getManagerByUsername($username);
            
            if (empty($username) || empty($password) || empty($password_confirm) || empty($fullname)) {
                $this->error = 'Các trường Username, Password, Nhập lại password, Full name ko được để trống';
            } else if ($password != $password_confirm) {
                $this->error = 'Nhập lại password chưa đúng';
            } else if (!empty($phone)) {
                if(!is_numeric($phone)){
                    $this->error = 'Số điện thoại sai định dạng';
                } else {
                    if(strlen($phone) > 10){
                        $this->error = 'Số điện thoại tối đa 10 ký tự';
                    }
                }
            } else if(!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->error = 'Email sai định dạng';
            } else if (!empty($manager)) {
                $this->error = 'Username này đã tồn tại';
            }

            if (empty($this->error)) {
                $manager_model->username = $username;
                $manager_model->password = password_hash($password, PASSWORD_DEFAULT);
                $manager_model->fullname = $fullname;
                $manager_model->phone_number = $phone;
                $manager_model->address = $address;
                $manager_model->email = $email;
                $manager_model->jobs = $jobs;
                $is_insert = $manager_model->insertRegister();
                if ($is_insert) {
                    $_SESSION['success'] = 'Đăng ký thành công';
                } else {
                    $_SESSION['error'] = 'Đăng ký thất bại';
                }
                header('Location: index.php?controller=login&action=login');
                exit();
            }
        }

        $this->content = $this->view('views/managers/register.php');
        require_once 'views/layouts/main_login.php';
    }
}