<?php
require_once "models/Model.php";

class Category extends Model {
    public function getAllCategories(){
        $obj_select = $this->connection->prepare("SELECT * FROM categories");
        $obj_select->execute();

        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getCategoryById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM categories WHERE id = $id");
        $obj_select->execute();

        $category = $obj_select->fetch(PDO::FETCH_ASSOC);
        return $category;
    }

    public function countCategories(){
        $obj_select = $this->connection->prepare("SELECT COUNT(id) FROM categories");
        $obj_select->execute();

        return $obj_select->fetchColumn();
    }
}