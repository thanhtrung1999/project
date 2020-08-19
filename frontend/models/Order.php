<?php
require_once 'models/Model.php';

class Order extends Model {
    public $full_name;
    public $address;
    public $phone_number;
    public $email;
    public $note;
    public $price_total;
    public $order_status;
    public $payment_method;

    public function insert(){
        $obj_insert_customer = $this->connection
            ->prepare("INSERT INTO customers(`fullname`, `address`, `phone_number`, `email`) 
                                VALUES (:fullname, :address, :phone_number, :email)");
        $arr_insert_customer = [
            ':fullname' => $this->full_name,
            ':address' => $this->address,
            ':phone_number' => $this->phone_number,
            ':email' => $this->email
        ];

        $is_insert_customer = $obj_insert_customer->execute($arr_insert_customer);

        if($is_insert_customer){
            $customer_id = $this->connection->lastInsertId();

            $obj_insert_order = $this->connection
                ->prepare("INSERT INTO orders(`customer_id`, `price_total`, `order_status`, `note`, `payment_methods`)
                                    VALUES (:customer_id, :price_total, :order_status, :note, :payment_method)");

            $arr_insert_order = [
                ':customer_id' => $customer_id,
                ':price_total' => $this->price_total,
                ':order_status' => $this->order_status,
                ':note' => $this->note,
                ':payment_method' => $this->payment_method
            ];

            $is_insert_order = $obj_insert_order->execute($arr_insert_order);

            if($is_insert_order){
                $order_id = $this->connection->lastInsertId();
                return $order_id;
            }

            return false;
        }
    }
}