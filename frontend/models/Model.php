<?php
require_once 'configs/database.php';

class Model {
    public $connection;

    public function __construct()
    {
        $this->connection = $this->getConnection();
    }

    public function getConnection(){
        try {
            $connection = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
        } catch (PDOException $exception) {
            die("Kết nối CSDL thất bại: " . $exception->getMessage());
        }

        return $connection;
    }

    public function closeConnection(){
        $this->connection = null;
    }
}