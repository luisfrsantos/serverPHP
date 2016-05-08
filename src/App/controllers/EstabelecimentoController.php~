<?php
namespace App\controllers;

use App\entidades\Estabelecimento;
use App\Dao\EstabelecimentoDAO;

class EstabelecimentoController 
{	
    public function __construct($id, $nome, $tipo, $telefone, $imagem, $endereco, $descricao, $ativo, $indice)
    {
	$estabelecimentoDAO = new EstabelecimentoDAO();
	
	$rs = $estabelecimentoDAO->select($id, $nome,$tipo, $telefone, $imagem, $endereco , $descricao, $ativo , $indice);
	$obj = null;
	$i = 0;
	  
	while ($row = mysqli_fetch_array($rs)) 
        {
	    $estabelecimento = new Estabelecimento(
                $row['pkCodEstabelecimento'], 
                $row['nomeFantazia'], 
                $row['tipo'], 
                $row['telefone'], 
                $row['imagem'], 
                $row['endereco'],
                $row['descricao'], 
                $row['ativo']
	    );		
     	    $obj[$i] = $estabelecimento;
  	    $i++;
	}
	return $obj;
    }	
}

