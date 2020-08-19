<?php
require_once "models/Category.php";
require_once "models/Product.php";
require_once "models/Slide.php";
require_once "controllers/Controller.php";

class HomeController extends Controller {
    public function index(){
        $category_model = new Category();
        $product_model = new Product();
        $slide_model = new Slide();

        $categories = $category_model->getAllCategories();
        $slides = $slide_model->getSlides();

        $laptop_dell_limit = $product_model->getProductRandLimitByName('laptop', 'dell', 4);
        $laptop_asus_limit = $product_model->getProductRandLimitByName('laptop', 'asus', 4);
        $laptop_lenovo_limit = $product_model->getProductRandLimitByName('laptop', 'lenovo', 4);
        $laptop_acer_limit = $product_model->getProductRandLimitByName('laptop', 'acer', 4);

        $phone_iphone_limit = $product_model->getProductRandLimitByName('điện thoại', 'iphone', 4);
        $phone_samsung_limit = $product_model->getProductRandLimitByName('điện thoại', 'samsung', 4);
        $phone_vsmart_limit = $product_model->getProductRandLimitByName('điện thoại', 'vsmart', 4);
        $phone_realme_limit = $product_model->getProductRandLimitByName('điện thoại', 'realme', 4);
        $phone_oppo_limit = $product_model->getProductRandLimitByName('điện thoại', 'oppo', 4);

        $count_categories = $category_model->countCategories();
        $brands_laptop = $product_model->getBrandByCategoryName('laptop');
        $brands_phone = $product_model->getBrandByCategoryName('điện thoại');
        $brands_accessories = $product_model->getBrandByCategoryName('ổ cứng');

        $this->content = $this->view('views/homes/index.php', [
            'categories' => $categories,
            'slides' => $slides,
            'count_categories' => $count_categories,
            'laptop_dell_limit' => $laptop_dell_limit,
            'laptop_asus_limit' => $laptop_asus_limit,
            'laptop_lenovo_limit' => $laptop_lenovo_limit,
            'laptop_acer_limit' => $laptop_acer_limit,
            'phone_iphone_limit' => $phone_iphone_limit,
            'phone_samsung_limit' => $phone_samsung_limit,
            'phone_vsmart_limit' => $phone_vsmart_limit,
            'phone_realme_limit' => $phone_realme_limit,
            'phone_oppo_limit' => $phone_oppo_limit
        ]);

        require_once 'views/layouts/main.php';
    }
}