<?php 
namespace App\entidades;

class Estabelecimento 
{
    private $id;
    private $nome;
    private $tipo;
    private $telefone;
    private $imagem;
    private $endereco;
    private $descricao;
    private $ativo;
	
    public function __construct($id, $nome, $tipo, $telefone, $imagem, $endereco, $descicao, $ativo)
    {
        $this->id = (int) $id;
	$this->nome = $nome;
	$this->tipo = $tipo;
	$this->telefone = $telefone;
	$this->imagem = $imagem;
	$this->endereco = $endereco;
	$this->descricao = $descicao;
	$this->ativo = $ativo;
    }
	
    public function getId()
    {
	return $this->id;
    }
	
    public function getNome()
    {
	return $this->nome;
    }
	
    public function getTipo ()
    {
	return $this->tipo;
    }
	
    public function getTelefone()
    {
	return $this->telefone;
    }
	
    public function getImagem ()
    {
	return $this->imagem;
    }	
	
    public function getDescricao()
    {
	return $this->descricao;
    }
	
    public function getAtivo ()
    {
 	return $this->ativo;
    }	
	
    public function getEndereco()
    {
	return $this->endereco;
    }
}
