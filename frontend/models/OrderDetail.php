<?php
require_once 'models/Model.php';

class OrderDetail extends Model {
    public $order_id;
    public $product_id;
    public $variant_value_id;
    public $amount;

    public function insert() {
        $sql_insert = "INSERT INTO orders_detail(`order_id`, `product_id`, `variant_value_id`, `amount`) 
                   VALUES(:order_id, :product_id, :variant_value_id, :amount) ";
        $obj_insert = $this->connection->prepare($sql_insert);
        $arr_insert = [
            ':order_id' => $this->order_id,
            ':product_id' => $this->product_id,
            ':variant_value_id' => $this->variant_value_id,
            ':amount' => $this->amount
        ];

        return $obj_insert->execute($arr_insert);
    }
}