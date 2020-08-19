<?php
require_once 'models/Model.php';

class Product extends Model
{

    public $id;
    public $category_id;
    public $brand_id;
    public $name;
    public $avatar;
    public $price;
    public $summary;
    public $description;
    public $status;
    public $created_at;
    public $updated_at;

    public $str_search = '';

    public function __construct()
    {
        parent::__construct();
        if (isset($_GET['product_name']) && !empty($_GET['product_name'])) {
            $this->str_search .= " AND products.name LIKE '%{$_GET['product_name']}%'";
        }
        if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
            $this->str_search .= " AND products.category_id = {$_GET['category_id']}";
        }
        if (isset($_GET['brand_id']) && !empty($_GET['brand_id'])) {
            $this->str_search .= " AND products.brand_id = {$_GET['brand_id']}";
        }
    }

    public function getAll()
    {
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                        FROM products INNER JOIN categories ON categories.id = products.category_id 
                        INNER JOIN brands ON brands.id = products.brand_id 
                        WHERE TRUE $this->str_search
                        ORDER BY products.created_at ASC");

        $obj_select->execute();
        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $products;
    }

    public function getAllBrands($param = []){
        $obj_select = $this->connection->prepare("SELECT * FROM brands");

        $obj_select->execute();
        $brands = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $brands;
    }

    public function getAllPagination($arr_params)
    {
        $limit = $arr_params['limit'];
        $page = $arr_params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name 
                        FROM products INNER JOIN categories ON categories.id = products.category_id 
                        INNER JOIN brands ON brands.id = products.brand_id 
                        WHERE TRUE $this->str_search
                        ORDER BY products.created_at ASC 
                        LIMIT $start, $limit");

        $obj_select->execute();
        $products = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $products;
    }

    public function countTotal()
    {
        $obj_select = $this->connection->prepare("SELECT COUNT(id) FROM products WHERE TRUE $this->str_search");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }

    public function insert()
    {
        $obj_insert_product = $this->connection
            ->prepare("INSERT INTO products(category_id, brand_id, `name`, avatar, price, summary, description, status) 
                                VALUES (:category_id, :brand_id, :name, :avatar, :price, :summary, :description, :status)");
        $arr_insert_product = [
            ':category_id' => $this->category_id,
            ':brand_id' => $this->brand_id,
            ':name' => $this->name,
            ':avatar' => $this->avatar,
            ':price' => $this->price,
            ':summary' => $this->summary,
            ':description' => $this->description,
            ':status' => $this->status,
        ];
        $is_insert_product = $obj_insert_product->execute($arr_insert_product);

        if($is_insert_product){
            $product_id = $this->connection->lastInsertId();
            return $product_id;
        }
    }

    public function getById($id)
    {
        $obj_select = $this->connection
            ->prepare("SELECT products.*, categories.name AS category_name, brands.name AS brand_name
                                FROM products INNER JOIN categories ON products.category_id = categories.id 
                                INNER JOIN brands ON products.brand_id = brands.id
                                WHERE products.id = $id");

        $obj_select->execute();
        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function update($id)
    {
        $obj_update = $this->connection
            ->prepare("UPDATE products SET category_id=:category_id, brand_id=:brand_id, `name`=:name, avatar=:avatar, price=:price, 
            summary=:summary, description=:description, status=:status, updated_at=:updated_at WHERE id = $id");

        $arr_update = [
            ':category_id' => $this->category_id,
            ':brand_id' => $this->brand_id,
            ':name' => $this->name,
            ':avatar' => $this->avatar,
            ':price' => $this->price,
            ':summary' => $this->summary,
            ':description' => $this->description,
            ':status' => $this->status,
            ':updated_at' => $this->updated_at,
        ];
        return $obj_update->execute($arr_update);
    }

    public function delete($id)
    {
        $obj_delete = $this->connection
            ->prepare("DELETE FROM products WHERE id = $id");
        return $obj_delete->execute();
    }

    public function getVariantName($variant_name){
        $obj_select = $this->connection->prepare("SELECT * FROM variants WHERE `name` = '$variant_name'");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function insertVariantName($variant_name){
        $obj_insert_variant_name = $this->connection->prepare("INSERT INTO variants(`name`) VALUES ('$variant_name')");

        $is_insert_variant_name = $obj_insert_variant_name->execute();

        if($is_insert_variant_name){
            $variant_id = $this->connection->lastInsertId();
            return $variant_id;
        }
    }

    public function getVariantValue($variant_value){
        $obj_select = $this->connection->prepare("SELECT * FROM variants_value WHERE `value` = '$variant_value'");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function insertVariantValue($variant_id, $variant_value){
        $obj_insert_variant_value = $this->connection
            ->prepare("INSERT INTO variants_value(variant_id, `value`) VALUES ($variant_id, '$variant_value')");

        $is_insert_variant_value = $obj_insert_variant_value->execute();

        if($is_insert_variant_value){
            $variant_value_id = $this->connection->lastInsertId();
            return $variant_value_id;
        }
    }

    public function insertProductVariants($product_id, $variant_value_id){
        $obj_insert_product_variant = $this->connection
            ->prepare("INSERT INTO product_variant(product_id, variant_value_id) VALUES ($product_id, $variant_value_id)");

        return $obj_insert_product_variant->execute();
    }

    public function getProductVariants($product_id){
        $obj_select_product_variant = $this->connection
            ->prepare("SELECT product_variant.*, variants.name AS variant_name, variants_value.value AS variant_value
                            FROM variants_value INNER JOIN product_variant ON product_variant.variant_value_id = variants_value.id
                            INNER JOIN variants ON variants.id = variants_value.variant_id
                            WHERE product_variant.product_id = $product_id");

        $obj_select_product_variant->execute();
        return $obj_select_product_variant->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getBrandName($brand_name){
        $obj_select = $this->connection->prepare("SELECT * FROM brands WHERE `name` = '$brand_name'");

        $obj_select->execute();
        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function insertBrand($brand_name){
        $obj_insert = $this->connection->prepare("INSERT INTO brands(`name`) VALUES ('$brand_name')");

        return $obj_insert->execute();
    }

    public function deleteBrand($brand_id){
        $obj_delete = $this->connection
            ->prepare("DELETE FROM brands WHERE id = $brand_id");
        return $obj_delete->execute();
    }

    public function deleteVariantValue($product_id, $variant_value_id){
        $obj_delete = $this->connection
            ->prepare("DELETE FROM product_variant WHERE product_id = $product_id AND variant_value_id = $variant_value_id");
        $obj_delete->execute();

        $obj_delete_variant_value = $this->connection
            ->prepare("DELETE FROM variants_value WHERE id = $variant_value_id");
        return $obj_delete_variant_value->execute();
    }
}