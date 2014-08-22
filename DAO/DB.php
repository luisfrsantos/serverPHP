<?php 




class DB {

	
	
	
	
	
	public function conectaDB(){
		
		 $hots = "localhost";
       $base = "TelePixel";
        $user = "root";
      $senha = "123456";
			
				try{
			
			 $conecta = mysqli_connect($hots , $user, $senha, $base) or die ("Erro: ".mysqli_error($execute));
			
			 $conecta->set_charset('utf8'); 
		     //mysqli_select_db($base, $conecta) or print(mysqli_error()); 	
			}catch(Exception $e){
				return "Erro de conexão com mysql";
			}
			
			
			return  $conecta;
	
	}
	
	
	
	public function closeDB(){
		mysqli_close();
	}
	
	
}





?>