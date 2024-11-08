<?php
require_once '../models/Producto.php';

$prod = new Producto();

if (isset($_GET['operation'])) {
  switch($_GET['operation']){
    case 'getAll':
      echo json_encode($prod->listProducto());
      break;
  }
}

if (isset($_POST['operation'])) {
  switch($_POST['operation']){
    case 'add':
      $resp=['respuesta'=>-1];
      $dataEnviar = [
        'nombre'=>$_POST['nombre'],
        'tipo'=>$_POST['tipo'],
        'precio'=>$_POST['precio']
      ];
      $status = $prod->add($dataEnviar);

      if($status){
        $resp['respuesta']=1;
      }
      echo json_encode($resp);
      break;
  }
}
