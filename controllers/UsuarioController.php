<?php

require_once 'models/usuario.php';

class UsuarioController {

       public function index() {
              echo "Controlador Usuarios, Acción, index";
       }

       public function registro() {
              require_once 'views/usuario/registro.phtml';
       }

       public function save() {

              if (isset($_POST)) {
                     $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
                     $apellidos = isset($_POST['apellidos']) ? $_POST['apellidos'] : false;
                     $email = isset($_POST['email']) ? $_POST['email'] : false;
                     $password = isset($_POST['password']) ? $_POST['password'] : false;

                     // Validar los datos antes de guardarlos en la base de datos
                     //Validar campo nombre
                     if (!empty($nombre) && !is_numeric($nombre) && !preg_match('/[0-9]/', $nombre)) {
                            $nombre_validado = true;
                     } else {
                            $nombre_validado = false;
                     }
                     //Validar campo apellidos
                     if (!empty($apellidos) && !is_numeric($apellidos) && !preg_match('/[0-9]/', $apellidos)) {
                            $apellidos_validado = true;
                     } else {
                            $apellidos_validado = false;
                     }
                     //Validar campo email
                     if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                            $email_validado = true;
                     } else {
                            $email_validado = false;
                     }
                     //Validar campo contraseña
                     if (!empty($password)) {
                            $password_validado = true;
                     } else {
                            $password_validado = false;
                     }

                     if ($nombre_validado && $apellidos_validado && $email_validado && $password_validado) {
                            $usuario = new Usuario();
                            $usuario->setNombre($nombre);
                            $usuario->setApellidos($apellidos);
                            $usuario->setEmail($email);
                            $usuario->setPassword($password);

                            $save = $usuario->save();
                            if ($save) {
                                   $_SESSION['register'] = "complete";
                            } else {
                                   $_SESSION['register'] = "failed";
                            }
                     } else {
                            $_SESSION['register'] = "failed";
                     }
              } else {
                     $_SESSION['register'] = "failed";
              }
              header("Location: " . base_url . 'usuario/registro');
       }

       public function login() {
              if (isset($_POST)) {
                     //Identificar al usuario
                     //Consulta a la base de datos
                     $usuario = new Usuario();
                     $usuario->setEmail($_POST['email']);
                     $usuario->setPassword($_POST['password']);

                     $identity = $usuario->login();

                     if ($identity && is_object($identity)) {
                            $_SESSION['identity'] = $identity;

                            if ($identity->rol == 'admin') {
                                   $_SESSION['admin'] = true;
                            }
                     } else {
                            $_SESSION['error_login'] = 'Identificación fallida!!';
                     }
              }
              header("Location:" . base_url);
       }

       public function logout() {
              if (isset($_SESSION['identity'])) {
                     unset($_SESSION['identity']);
              }

              if (isset($_SESSION['admin'])) {
                     unset($_SESSION['admin']);
              }

              header("Location:" . base_url);
       }

}
