<?php
require_once 'models/User.php';
require_once 'models/Category.php';

class UserController {
    public $content;
    public $error;

    public function view($file, $variable = []){
        extract($variable);
        ob_start();
        require_once "$file";

        $render_view = ob_get_clean();
        return $render_view;
    }

    public function login(){
        $category_model = new Category();
        $categories = $category_model->getAllCategories();

        $this->content = $this->view('views/users/login.php');
        require_once "views/layouts/main_user.php";
    }

    public function checkLogin(){
        $user_model = new User();

        $username = $_POST['username'];
        $password = $_POST['password'];

        $error_status = false;
        if(empty($username) || empty($password)){
            $error_status = true;
        }
        if ($error_status == false){
            $login = $user_model->getLogin($username, $password);
            if($login != false){
                $user = $user_model->getLoginByUsernameOrEmail($username);
                $_SESSION['user'] = $user;
                setcookie('user', json_encode($user), time()+604800);
            }
            echo json_encode($login);
        }
    }

    public function logout(){
        if(isset($_COOKIE['user'])){
            setcookie('user', $_COOKIE['user'], time()-1);
            header("Location: index.php?controller=home");
            exit();
        }
    }

    public function register(){
        $category_model = new Category();
        $categories = $category_model->getAllCategories();

        $this->content = $this->view('views/users/register.php');
        require_once "views/layouts/main_user.php";
    }

    public function checkRegister(){
        $user_model = new User();

        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $full_name = $_POST['full_name'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];

        $error_status = false;
        if(empty($username) || empty($password) || empty($full_name) || empty($phone)){
            $error_status = true;
        } else if (!empty($email) && !filter_var($email, FILTER_VALIDATE_EMAIL)){
            $error_status = true;
        } else if(strlen($password) < 5){
            $error_status = true;
        } else if(!is_numeric($phone)){
            $error_status = true;
        }

        if($error_status == false){
            $check_user_exist = $user_model->getUserByUsername($username);

            if(empty($check_user_exist)){
                $user_model->username = $username;
                $user_model->email = $email;
                $user_model->password = password_hash($password, PASSWORD_DEFAULT);
                $user_model->full_name = $full_name;
                $user_model->phone_number = $phone;
                $user_model->address = $address;
                $register = $user_model->insertRegister();

                $data = $register;
                echo json_encode($data);
            } else {
                $data = $check_user_exist;
                echo json_encode($data);
            }
        }
    }
}