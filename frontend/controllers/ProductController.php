<?php
require_once "models/Category.php";
require_once "models/Product.php";
require_once "models/Pagination.php";
require_once "controllers/Controller.php";

class ProductController extends Controller {
    public function index(){
        if(!isset($_GET['category_id']) || !is_numeric($_GET['category_id'])){
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        $product_model = new Product();
        $count_total = $product_model->countTotal();

        $category_id = $_GET['category_id'];
        $query_additional = '&category_id=' . $category_id;
        $arr_params = [
            'total' => $count_total,
            'limit' => 12,
            'query_string' => 'page',
            'controller' => 'product',
            'action' => 'index',
            'query_additional' => $query_additional,
            'page' => isset($_GET['page']) ? $_GET['page'] : 1
        ];

        $products_by_category = $product_model->getAllProductsPagination($arr_params);
        $pagination = new Pagination($arr_params);
        $pages = $pagination->getPagination();

        $category_model = new Category();
        $category_by_id = $category_model->getCategoryById($category_id);

        $categories = $category_model->getAllCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/products/index.php',[
            'products_by_category' => $products_by_category,
            'category_by_id' => $category_by_id,
            'pages' => $pages
        ]);
        require_once "views/layouts/main.php";
    }

    public function show(){
        if (!isset($_GET['category_id']) || !is_numeric($_GET['category_id'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        if (!isset($_GET['brand_id']) || !is_numeric($_GET['brand_id'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        $product_model = new Product();
        $count_total = $product_model->countTotal();

        $category_id = $_GET['category_id'];
        $brand_id = $_GET['brand_id'];

        $query_additional = '&category_id=' . $category_id . '&brand_id=' . $brand_id;
        $arr_params = [
            'total' => $count_total,
            'limit' => 12,
            'query_string' => 'page',
            'controller' => 'product',
            'action' => 'show',
            'query_additional' => $query_additional,
            'page' => isset($_GET['page']) ? $_GET['page'] : 1
        ];

        $products_by_brand = $product_model->getAllProductsPagination($arr_params);
        $pagination = new Pagination($arr_params);
        $pages = $pagination->getPagination();

        $category_model = new Category();
        $brand_by_id = $product_model->getBrandById($brand_id);
        $category_by_id = $category_model->getCategoryById($category_id);

        $categories = $category_model->getAllCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/products/show.php',[
            'products_by_brand' => $products_by_brand,
            'brand_by_id' => $brand_by_id,
            'category_by_id' => $category_by_id,
            'pages' => $pages
        ]);
        require_once "views/layouts/main.php";
    }

    public function price_range(){
        if (!isset($_GET['category_name'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        if (!isset($_GET['min_price']) || !is_numeric($_GET['min_price'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        if (!isset($_GET['max_price']) || !is_numeric($_GET['max_price'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        $category_name = $_GET['category_name'];
        $min_price = $_GET['min_price'];
        $max_price = $_GET['max_price'];

        $product_model = new Product();
        $category_model = new Category();

        $products = $product_model->getProductByPriceRange($category_name, $min_price, $max_price);
        $categories = $category_model->getAllCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/products/price_range.php', [
            'products' => $products
        ]);
        require_once 'views/layouts/main.php';
    }

    public function all(){
        $product_model = new Product();
        $count_total = $product_model->countTotal();

        $query_additional = '';

        if (isset($_GET['search_title'])) {
            $query_additional .= '&search_title=' . $_GET['search_title'] . '&search=';
        }
        $arr_params = [
            'total' => $count_total,
            'limit' => 12,
            'query_string' => 'page',
            'controller' => 'product',
            'action' => 'all',
            'query_additional' => $query_additional,
            'page' => isset($_GET['page']) ? $_GET['page'] : 1
        ];
        $products = $product_model->getAllProductsPagination($arr_params);
        $pagination = new Pagination($arr_params);

        $pages = $pagination->getPagination();

        //lấy danh sách category đang có trên hệ thống để phục vụ cho search
        $category_model = new Category();
        $categories = $category_model->getAllCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/products/all.php', [
            'products' => $products,
            'pages' => $pages,
        ]);
        require_once 'views/layouts/main.php';
    }

    public function detail(){
        if (!isset($_GET['category_id']) || !is_numeric($_GET['category_id'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        $category_id = $_GET['category_id'];
        if (!isset($_GET['brand_id']) || !is_numeric($_GET['brand_id'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/';
            header("Location: index.php?controller=home");
            exit();
        }
        $brand_id = $_GET['brand_id'];
        if (!isset($_GET['product_id']) || !is_numeric($_GET['product_id'])) {
//            $url_redirect = $_SERVER['SCRIPT_NAME'] . '/products';
            header("Location: index.php?controller=product&action=index&category_id=$category_id");
            exit();
        }

        $product_id = $_GET['product_id'];
        $product_model = new Product();
        $category_model = new Category();

        $product = $product_model->getProductById($product_id);
        $product_variants = $product_model->getProductVariantsById($product_id);
        $products_random = $product_model->getProductRandomLimit($category_id, $brand_id, 8);

        $categories = $category_model->getAllCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/products/detail.php', [
            'product' => $product,
            'product_variants' => $product_variants,
            'products_random' => $products_random
        ]);

        require_once 'views/layouts/main.php';
    }
}