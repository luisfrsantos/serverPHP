<?php
use App\entidades\Estabelecimento;
use App\entidades\EstabelecimentoController;
 
$estabelecimentoController = new EstabelecimentoController();
 
if (isset ($_POST["indice"])) {
    $obj = $estabelecimentoController -> carregaEstabelecumentos(null, null, null, null, null,null, null, 1, $_POST["indice"]);
} else{
    $obj = $estabelecimentoController -> carregaEstabelecumentos(null, null, null, null, null,null, null, 1, 20);
}
 
for ($i = 0; $i < count($obj); $i++) {
         $aux = $obj[$i] -> getId();
	$return[] = array("id"=> $obj[$i]->getId() , "nome" => $obj[$i] -> getNome(), "telefone" => $obj[$i] -> getTelefone(), 
	                               "tipo" => $obj[$i] -> getTipo(),"endereco" => $obj[$i]->getEndereco(),
	                               "descricao" => $obj[$i]->getDescricao(), "imagem" => $obj[$i] -> getImagem());

}
echo json_encode($return);


