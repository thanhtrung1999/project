<?php
session_start();
date_default_timezone_set("Asia/Ho_Chi_Minh");

$controller = isset($_GET['controller']) ? $_GET['controller'] : 'home';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

$controller = ucfirst($controller);
$controller .= "Controller";
$path_controller = "controllers/$controller.php";

if(!file_exists($path_controller)){
    die('<h1>Page Not Found</h1>');
}

require_once "$path_controller";

$object = new $controller();
if(!method_exists($object, $action)){
    die("<h1>Sorry, URL doesn't correct</h1>");
}

$object->$action();
