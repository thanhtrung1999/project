<?php
require_once 'Model.php';

class Slide extends Model {
    public function getSlides(){
        $obj_select = $this->connection->prepare("SELECT * FROM slides ORDER BY id DESC");
        $obj_select->execute();

        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }
}