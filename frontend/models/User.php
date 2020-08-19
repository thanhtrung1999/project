<?php
require_once 'models/Model.php';

class User extends Model {
    public $username;
    public $password;
    public $full_name;
    public $avatar;
    public $phone_number;
    public $address;
    public $email;

    public function getLogin($username, $password){
        $obj_select_username = $this->getLoginByUsernameOrEmail($username);

        if(empty($obj_select_username)){
            return false;
        } else {
            $hashed_pwd_check = password_verify($password, $obj_select_username['password']);
            if ($hashed_pwd_check) {
                return $obj_select_username;
            } else {
                return false;
            }
        }
    }

    public function insertRegister(){
        $obj_insert = $this->connection
            ->prepare("INSERT INTO members(username, password, fullname, phone_number, address, email) 
                            VALUES (:username, :password, :full_name, :phone_number, :address, :email)");

        $arr_insert = [
            ':username' => $this->username,
            ':password' => $this->password,
            ':full_name' => $this->full_name,
            ':phone_number' => $this->phone_number,
            ':address' => $this->address,
            ':email' => $this->email
        ];

        return $obj_insert->execute($arr_insert);
    }

    public function getUserByUsername($username){
        $obj_select = $this->connection->prepare("SELECT * FROM members WHERE username = '$username'");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }

    public function getLoginByUsernameOrEmail($username){
        $obj_select = $this->connection->prepare("SELECT * FROM members WHERE username = '$username' OR email = '$username'");
        $obj_select->execute();

        return $obj_select->fetch(PDO::FETCH_ASSOC);
    }
}