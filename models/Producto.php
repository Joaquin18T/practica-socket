<?php

require_once 'Conexion.php';

class Producto extends Conexion
{

  public function listProducto(): array {
    return parent::getData("sp_list_products");
  }

  public function add($params=[]):bool{
    $pdo = parent::getConexion();

    $status = false;
    $cmd = $pdo->prepare("CALL sp_add_prod(?,?,?)");

    $status=$cmd->execute(
      array(
        $params['nombre'],
        $params['tipo'],
        $params['precio']
      )
    );
    return $status;
  }
}
//  $prod = new Producto();
// $isAdd = $prod->add([
//   'nombre'=>'Zapatos Fer',
//   'tipo'=>'Zapatos',
//   'precio'=>90.6
// ]);

// echo $isAdd;
// echo json_encode($prod->listProducto());
