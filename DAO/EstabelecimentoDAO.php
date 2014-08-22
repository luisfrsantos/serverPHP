


<?php 


include_once 'DB.php';

class EstabelecimentoDAO {
	
	
	
	public function __construct(){
		
	}
	
	
	
	public function select($id , $nome ,$tipo ,$telefone , $imagem, $endereco ,$descricao, $ativo, $indice){
		
		$db = new DB();
		
		$execute = $db->conectaDB();
		
		$sql = "SELECT * FROM estabelecimento where ativo = ".$ativo;
		
		if($id) $sql .=" and id = ". $id;
		if($nome) $sql .=" and nome like '". $nome ."'";
		if ($tipo) $sql .= " and tipo like '". $tipo ."'";
		if ($telefone) $sql.= " and telefone like '". $telefone ."'";
		if($imagem) $sql .= " and imagem like '" .$descricao. "'";
		if($endereco) $sql .= " and endereco like '" .$endereco ."'";
		if($descricao) $sql .= " and descricao like '" .$descricao. "'";
		if($indice)	$sql .=  " and pkCodEstabelecimento >= ". $indice; 
		
		$sql .= " limit 5";
		
		$rs = $execute->query($sql);
		
		return $rs;
	}

	
	
	
	
}




?>