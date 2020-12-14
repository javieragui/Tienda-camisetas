<?php

require_once 'models/categoria.php';

class CategoriaController {

       public function index() {
              Utils::isAdmin();
              $categoria = new Categoria();
              $categorias = $categoria->getAll();

              require_once 'views/categoria/index.phtml';
       }

       public function crear() {
              Utils::isAdmin();
              require_once 'views/categoria/crear.phtml';
       }

       public function save() {
             Utils::isAdmin();
             if(isset($_POST) && isset($_POST['nombre'])) {
                     //Guardar la categoria
                    $categoria = new Categoria();
                    $categoria->setNombre($_POST['nombre']);
                    $save = $categoria->save();
             }
             header("Location:".base_url."categoria/index");
       }

}
