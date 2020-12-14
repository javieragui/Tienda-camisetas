<?php
require_once 'models/Producto.php';

class ProductoController{
       
       public function index(){
              
              //Renderizar una vista
              require_once 'views/producto/destacados.html';
       }
       
       public function gestion() {
              Utils::isAdmin();
              
              $producto = new Producto();
              $productos = $producto->getAll();
              
              require_once 'views/producto/gestion.phtml';
       }
       
        public function crear() {
               Utils::isAdmin();
               require_once 'views/producto/crear.phtml';
        }
        
        public function save() {
               Utils::isAdmin();
               if(isset($_POST)) {
                      var_dump($_POST);
               }
        }
}

