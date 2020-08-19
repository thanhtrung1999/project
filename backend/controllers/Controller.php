<?php

class Controller
{
    public function __construct()
    {
        if(!isset($_SESSION['manager'])) {
            $_SESSION['error'] = 'Bạn cần đăng nhập';
            header("Location: index.php?controller=login&action=login");
            exit();
        }
    }

    public $content;
    public $error;

    public function view($file, $variables = []){
        extract($variables);
        ob_start();
        require_once "$file";
        $render_view = ob_get_clean();

        return $render_view;
    }
}