<?php
require_once 'models/Model.php';

class Order extends Model
{

    public $str_search;

    public function __construct() {
        parent::__construct();
        if (isset($_GET['product_name']) && !empty($_GET['product_name'])) {
            $this->str_search .= " AND products.name LIKE '%{$_GET['product_name']}%'";
        }
        if (isset($_GET['order_id']) && !empty($_GET['order_id'])) {
            $this->str_search .= " AND orders.id = {$_GET['order_id']}";
        }
        if (isset($_GET['customer_name']) && !empty($_GET['customer_name'])) {
            $this->str_search .= " AND customers.fullname LIKE '%{$_GET['customer_name']}%'";
        }
    }

    public function getAll() {
        $obj_select = $this->connection
            ->prepare("SELECT orders.*, orders_detail.*, customers.*, products.name AS 'product_name', variants_value.value 
                                FROM ( 
                                (orders INNER JOIN customers ON orders.customer_id = customers.id) 
                                INNER JOIN orders_detail ON orders.id = orders_detail.order_id 
                                INNER JOIN products ON orders_detail.product_id = products.id 
                                INNER JOIN variants_value ON orders_detail.variant_value_id = variants_value.id) 
                                WHERE TRUE $this->str_search");
        $obj_select->execute();
        $orders = $obj_select->fetchAll(PDO::FETCH_ASSOC);
        return $orders;
    }

    public function getAllPagination($params = []) {
        $limit = $params['limit'];
        $page = $params['page'];
        $start = ($page - 1) * $limit;
        $obj_select = $this->connection
            ->prepare("SELECT orders.*, orders_detail.*, customers.*, products.name AS 'product_name', variants_value.value 
                                FROM ( 
                                (orders INNER JOIN customers ON orders.customer_id = customers.id) 
                                INNER JOIN orders_detail ON orders.id = orders_detail.order_id 
                                INNER JOIN products ON orders_detail.product_id = products.id 
                                INNER JOIN variants_value ON orders_detail.variant_value_id = variants_value.id) 
                                WHERE TRUE $this->str_search
                                LIMIT $start, $limit");

        $obj_select->execute();
        $orders = $obj_select->fetchAll(PDO::FETCH_ASSOC);

        return $orders;
    }

    public function getTotal() {
        $obj_select = $this->connection->prepare("SELECT COUNT(order_id) FROM orders_detail WHERE TRUE $this->str_search");
        $obj_select->execute();
        return $obj_select->fetchColumn();
    }

    public function getOrderById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM orders WHERE id = $id");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function handleOrders($id){
        $date = date('Y-m-d H:i:s');

        $obj_update = $this->connection->prepare("UPDATE orders SET order_status = 1, updated_at = '$date' WHERE id = $id");
        return $obj_update->execute();
    }

    public function deleteOrders($id){
        $obj_select_orders = $this->connection->prepare("SELECT * FROM orders WHERE id = $id");
        $obj_select_orders->execute();
        $orders = $obj_select_orders->fetch(PDO::FETCH_ASSOC);
        $customer_id = $orders['customer_id'];

        $obj_delete_customer = $this->connection->prepare("DELETE FROM customers WHERE id = $customer_id");
        $obj_delete_customer->execute();

        $obj_delete = $this->connection->prepare("DELETE FROM orders WHERE id = $id");
        return $obj_delete->execute();
    }
}