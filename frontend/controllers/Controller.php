<?php

class Controller {
    public $error;
    public $content;

    public function view($file, $variable = []) {
        extract($variable);
        ob_start();
        require_once "$file";
        $render_view = ob_get_clean();

        return $render_view;
    }
}