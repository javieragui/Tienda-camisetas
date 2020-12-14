<?php

class Producto {
       //Variables
       private $id;
       private $categoria_id;
       private $nombre;
       private $descripcion;
       private $precio;
       private $stock;
       private $oferta;
       private $fecha;
       private $imagen;
       private $db;
       
       //Constructor
       function __construct() {
              $this->db = Database::connect();
       }
       
       //Getters and Setters
       function getId() {
              return $this->id;
       }

       function getCategoria_id() {
              return $this->categoria_id;
       }

       function getNombre() {
              return $this->nombre;
       }

       function getDescripcion() {
              return $this->descripcion;
       }

       function getPrecio() {
              return $this->precio;
       }

       function getStock() {
              return $this->stock;
       }

       function getOferta() {
              return $this->oferta;
       }

       function getFecha() {
              return $this->fecha;
       }

       function getImagen() {
              return $this->imagen;
       }

       function setId($id): void {
              $this->id = $id;
       }

       function setCategoria_id($categoria_id): void {
              $this->categoria_id = $categoria_id;
       }

       function setNombre($nombre): void {
              $this->nombre = $nombre;
       }

       function setDescripcion($descripcion): void {
              $this->descripcion = $descripcion;
       }

       function setPrecio($precio): void {
              $this->precio = $precio;
       }

       function setStock($stock): void {
              $this->stock = $stock;
       }

       function setOferta($oferta): void {
              $this->oferta = $oferta;
       }

       function setFecha($fecha): void {
              $this->fecha = $fecha;
       }

       function setImagen($imagen): void {
              $this->imagen = $imagen;
       }

       //Metodos
       public function getAll() {
              $productos = $this->db->query("SELECT *FROM productos ORDER BY id DESC;");
              return $productos;
       }

       
}
