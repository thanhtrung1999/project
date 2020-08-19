<?php
require_once "models/Model.php";

class Product extends Model
{
    public $str_search = '';

    public function __construct()
    {
        parent::__construct();
        if (isset($_GET['search_title']) && !empty($_GET['search_title'])) {
            $this->str_search .= " AND products.name LIKE '%{$_GET['search_title']}%' 
                                   OR categories.name LIKE '%{$_GET['search_title']}%' 
                                   OR brands.name LIKE '%{$_GET['search_title']}%'";
        }
        if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
            $this->str_search .= " AND products.category_id = {$_GET['category_id']}";
        }
        if (isset($_GET['brand_id']) && !empty($_GET['brand_id'])) {
            $this->str_search .= " AND products.brand_id = {$_GET['brand_id']}";
        }
    }

    public function getAllProducts(){
        $obj_select_all = $this->connection->prepare("SELECT * FROM products WHERE TRUE $this->str_search");
        $obj_select_all->execute();

        $all_products = $obj_select_all->fetchAll(PDO::FETCH_ASSOC);
        return $all_products;
    }

    public function getAllProductsPagination($arr_params)
    {
        $limit = $arr_params['limit'];
        $page = $arr_params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                            FROM products INNER JOIN categories ON products.category_id = categories.id
                            INNER JOIN brands ON products.brand_id = brands.id 
                            WHERE TRUE $this->str_search LIMIT $start, $limit");

        $obj_select->execute();
        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $products;
    }

    public function countTotal()
    {
        $obj_select = $this->connection
            ->prepare("SELECT COUNT(products.id) FROM products 
                            INNER JOIN categories ON products.category_id = categories.id
                            INNER JOIN brands ON products.brand_id = brands.id WHERE TRUE $this->str_search");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }

    public function getProductRandLimitByName($category_name, $brand_name, $limit){
        $obj_select_limit = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                            FROM products INNER JOIN categories ON products.category_id = categories.id
                            INNER JOIN brands ON products.brand_id = brands.id
                            WHERE categories.name = '$category_name' AND brands.name = '$brand_name' 
                            ORDER BY RAND() 
                            LIMIT $limit");
        $obj_select_limit->execute();
        return $obj_select_limit->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductByPriceRange($category_name, $min_price, $max_price){
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name 
                            FROM products INNER JOIN categories ON products.category_id = categories.id 
                            WHERE categories.name = '$category_name' AND price >= $min_price AND price <= $max_price 
                            ORDER BY price ASC");

        $obj_select->execute();
        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductById($id){
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                            FROM products INNER JOIN categories ON products.category_id = categories.id
                            INNER JOIN brands ON products.brand_id = brands.id 
                            WHERE products.id = $id");
        $obj_select->execute();

        $products = $obj_select->fetch(PDO::FETCH_ASSOC);
        return $products;
    }

    public function getProductVariantsById($id){
        $obj_select = $this->connection
            ->prepare("SELECT product_variant.*, variants.id AS variant_id, variants.name AS variant_name, variants_value.value AS variant_value
                            FROM variants_value INNER JOIN product_variant ON variants_value.id = product_variant.variant_value_id
                            INNER JOIN variants ON variants_value.variant_id = variants.id
                            WHERE product_variant.product_id = $id");
        $obj_select->execute();
        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getVariantValueById($id){
        $obj_select = $this->connection
            ->prepare("SELECT * FROM variants_value WHERE id = $id");
        $obj_select->execute();
        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function getProductRandomLimit($category_id, $brand_id, $limit){
        $obj_select_random = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                            FROM products INNER JOIN categories ON products.category_id = categories.id
                            INNER JOIN brands ON products.brand_id = brands.id
                            WHERE categories.id = $category_id 
                            ORDER BY RAND() 
                            LIMIT $limit");
        $obj_select_random->execute();
        return $obj_select_random->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllBrands(){
        $obj_select = $this->connection->prepare("SELECT * FROM brands");
        $obj_select->execute();

        $result = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    public function getBrandById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM brands WHERE id = $id");
        $obj_select->execute();

        $products = $obj_select->fetch(PDO::FETCH_ASSOC);
        return $products;
    }

    public function getBrandByCategoryName($category_name){
        $obj_select = $this->connection
            ->prepare("SELECT DISTINCT brands.id AS brand_id, brands.name AS brand_name
                            FROM products INNER JOIN brands ON products.brand_id = brands.id
                            INNER JOIN categories ON products.category_id = categories.id
                            WHERE categories.name = '$category_name'");
        $obj_select->execute();

        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }
}