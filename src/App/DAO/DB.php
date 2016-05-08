<?php 
namespace App\Dao;

class DB 
{
    public function conectaDB()
    {
	$hots = "localhost";
        $base = "TelePixel";
        $user = "root";
        $senha = "123456";
			
	try{
	    $conecta = mysqli_connect($hots, $user, $senha, $base) or die ("Erro: ".mysqli_error($execute));
			
      	    $conecta->set_charset('utf8'); 
	}catch(Exception $e){
   	    echo $e->getMessage("Erro de conexão com mysql");
	}
	return  $conecta;
    }
	
    public function closeDB()
    {
	mysqli_close();
    }	
}
