<?php

class Database {
       public static function connect() {
              $db = new mysqli('localhost:3306', 'root', 'javi1234', 'tienda_camisetas');
              $db->query("SET NAMES 'utf8'");
              return $db;
       }
}
?>

