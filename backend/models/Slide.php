<?php
require_once 'models/Model.php';

class Slide extends Model {
    public $id;
    public $image;
    public $heading;
    public $text;
    public $updated_at;

    public function getAllSlides(){
        $obj_select = $this->connection->prepare("SELECT * FROM slides");
        $obj_select->execute();

        return $obj_select->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getSlideById($id){
        $obj_select = $this->connection->prepare("SELECT * FROM slides WHERE id = $id");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function insertSlide(){
        $obj_insert = $this->connection
            ->prepare("INSERT INTO slides(image, heading, text) VALUES (:image, :heading, :text)");
        $arr_insert = [
            ':image' => $this->image,
            ':heading' => $this->heading,
            ':text' => $this->text
        ];

        return $obj_insert->execute($arr_insert);
    }

    public function updateSlide($id){
        $obj_update = $this->connection
            ->prepare("UPDATE slides SET image = :image, heading = :heading, text = :text, updated_at = :updated_at WHERE id = $id");
        $arr_update = [
            ':image' => $this->image,
            ':heading' => $this->heading,
            ':text' => $this->text,
            ':updated_at' => $this->updated_at
        ];

        return $obj_update->execute($arr_update);
    }

    public function deleteSlide($id){
        $obj_delete = $this->connection->prepare("DELETE FROM slides WHERE id = $id");
        return $obj_delete->execute();
    }
}