-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 02-Jul-2014 às 17:25
-- Versão do servidor: 5.5.37-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `TelePixel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_cep`
--

CREATE TABLE IF NOT EXISTS `base_cep` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cep` int(9) NOT NULL,
  `logradouro` varchar(90) COLLATE latin1_bin NOT NULL,
  `bairro` varchar(50) COLLATE latin1_bin NOT NULL,
  `cidade` varchar(50) COLLATE latin1_bin NOT NULL,
  `estado` char(2) COLLATE latin1_bin NOT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cardapio`
--

CREATE TABLE IF NOT EXISTS `cardapio` (
  `pkCodCardapio` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` int(11) DEFAULT '1',
  `estabelecimento_pkCodEstabelecimento` bigint(20) NOT NULL,
  PRIMARY KEY (`pkCodCardapio`),
  KEY `fk_cardapio_estabelecimento1` (`estabelecimento_pkCodEstabelecimento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinatarios`
--

CREATE TABLE IF NOT EXISTS `destinatarios` (
  `pkCodDestinatarios` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `mensagem` text COLLATE latin1_bin,
  `observacao` text COLLATE latin1_bin,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`pkCodDestinatarios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE IF NOT EXISTS `endereco` (
  `pkCodEndereco` bigint(20) NOT NULL AUTO_INCREMENT,
  `rua` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `bairro` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `cidade` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `estado` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `usuario_pkCodUsuario` bigint(20) NOT NULL,
  `ativo` int(11) DEFAULT '1',
  `cep` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`pkCodEndereco`),
  KEY `fk_endereco_usuario_idx` (`usuario_pkCodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estabelecimento`
--

CREATE TABLE IF NOT EXISTS `estabelecimento` (
  `pkCodEstabelecimento` bigint(20) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `tipo` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `descricao` text COLLATE latin1_bin,
  `regiao` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `nomeFantazia` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `imagem` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  `telefone` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`pkCodEstabelecimento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `estabelecimento`
--

INSERT INTO `estabelecimento` (`pkCodEstabelecimento`, `cnpj`, `tipo`, `descricao`, `regiao`, `nomeFantazia`, `imagem`, `ativo`, `telefone`) VALUES
(1, 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 1, '999999'),
(2, 'teste2', 'teste', 'teste2', 'teste', 'teste2', 'teste', 1, '999999'),
(3, 'teste3', 'teste3', 'teste3', 'teste3', 'teste3', 'teste', 1, '999999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estabelecimento_has_cep`
--

CREATE TABLE IF NOT EXISTS `estabelecimento_has_cep` (
  `estabelecimento_pkCodEstabelecimento` bigint(20) NOT NULL,
  `base_cep_id` int(10) NOT NULL,
  KEY `fk_estabelecimento_has_ce_estabelecimento1_idx` (`estabelecimento_pkCodEstabelecimento`),
  KEY `fk_estabelecimento_has_ce_base_cep1_idx` (`base_cep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `expedicao`
--

CREATE TABLE IF NOT EXISTS `expedicao` (
  `pkCodEsxpedicao` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataEnvio` date DEFAULT NULL,
  `horaEnvio` date DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `horaEntrega` date DEFAULT NULL,
  `status` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  `pedido_pkCodPedido` bigint(20) NOT NULL,
  PRIMARY KEY (`pkCodEsxpedicao`),
  KEY `fk_expedicao_pedido1_idx` (`pedido_pkCodPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `interacao`
--

CREATE TABLE IF NOT EXISTS `interacao` (
  `pkcodInteracao` bigint(20) NOT NULL AUTO_INCREMENT,
  `interacao` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `descricao` text COLLATE latin1_bin,
  `data` date DEFAULT NULL,
  `fkCodInteracao` bigint(20) DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`pkcodInteracao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logErros`
--

CREATE TABLE IF NOT EXISTS `logErros` (
  `pkCodLogErros` bigint(20) NOT NULL AUTO_INCREMENT,
  `erro` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `data` date DEFAULT NULL,
  `interacao_pkcodInteracao` bigint(20) NOT NULL,
  PRIMARY KEY (`pkCodLogErros`),
  KEY `fk_logErros_interacao1_idx` (`interacao_pkcodInteracao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `parcela`
--

CREATE TABLE IF NOT EXISTS `parcela` (
  `pkCodParcela` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` date DEFAULT NULL,
  `valorUnitario` decimal(10,0) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `pedido_pkCodPedido` bigint(20) NOT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`pkCodParcela`),
  KEY `fk_parcela_pedido1_idx` (`pedido_pkCodPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `pkCodPedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `formaPagamento` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `quantVezes` int(11) DEFAULT NULL,
  `Pessoa_pkCodPessoa` int(11) NOT NULL,
  `ativo` int(11) DEFAULT '1',
  `estabelecimento_pkCodEstabelecimento` bigint(20) NOT NULL,
  `status` char(2) COLLATE latin1_bin DEFAULT 'a',
  PRIMARY KEY (`pkCodPedido`),
  KEY `fk_pedido_Pessoa1_idx` (`Pessoa_pkCodPessoa`),
  KEY `fk_pedido_estabelecimento1_idx` (`estabelecimento_pkCodEstabelecimento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_has_produtos`
--

CREATE TABLE IF NOT EXISTS `pedido_has_produtos` (
  `pedido_pkCodPedido` bigint(20) NOT NULL,
  `produtos_pkCodProdutos` bigint(20) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `observacao` text COLLATE latin1_bin,
  KEY `fk_pedido_has_produtos_produtos1_idx` (`produtos_pkCodProdutos`),
  KEY `fk_pedido_has_produtos_pedido1_idx` (`pedido_pkCodPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pessoa`
--

CREATE TABLE IF NOT EXISTS `Pessoa` (
  `pkCodPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_pkCodUsuario` bigint(20) NOT NULL,
  PRIMARY KEY (`pkCodPessoa`),
  KEY `fk_Pessoa_usuario1_idx` (`usuario_pkCodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `preferencia`
--

CREATE TABLE IF NOT EXISTS `preferencia` (
  `pkCodPreferencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` date DEFAULT NULL,
  `Pessoa_pkCodPessoa` int(11) NOT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`pkCodPreferencia`),
  KEY `fk_preferencia_Pessoa1_idx` (`Pessoa_pkCodPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `pkCodProdutos` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '	',
  `nome` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `marca` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `valorUnitario` decimal(10,2) DEFAULT NULL,
  `tipo` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `descricao` text COLLATE latin1_bin,
  `observacao` text COLLATE latin1_bin,
  `ativo` int(11) DEFAULT '1',
  `cardapio_pkCodCardapio` int(11) NOT NULL,
  `tamanho` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `imagem` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`pkCodProdutos`),
  KEY `fk_produtos_cardapio1` (`cardapio_pkCodCardapio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `pkCodUsuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `telCelular` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `telFixo` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `rg` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `cpf` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `dataEntrada` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `dataSaida` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `senha` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`pkCodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_estabelecimento`
--

CREATE TABLE IF NOT EXISTS `usuario_has_estabelecimento` (
  `usuario_pkCodUsuario` bigint(20) NOT NULL,
  `estabelecimento_pkCodEstabelecimento` bigint(20) NOT NULL,
  PRIMARY KEY (`usuario_pkCodUsuario`,`estabelecimento_pkCodEstabelecimento`),
  KEY `fk_usuario_has_estabelecimento_estabelecimento1_idx` (`estabelecimento_pkCodEstabelecimento`),
  KEY `fk_usuario_has_estabelecimento_usuario1_idx` (`usuario_pkCodUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD CONSTRAINT `fk_cardapio_estabelecimento1` FOREIGN KEY (`estabelecimento_pkCodEstabelecimento`) REFERENCES `estabelecimento` (`pkCodEstabelecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`usuario_pkCodUsuario`) REFERENCES `usuario` (`pkCodUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estabelecimento_has_cep`
--
ALTER TABLE `estabelecimento_has_cep`
  ADD CONSTRAINT `fk_estabelecimento_has_ce_base_cep1` FOREIGN KEY (`base_cep_id`) REFERENCES `base_cep` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estabelecimento_has_ce_estabelecimento1` FOREIGN KEY (`estabelecimento_pkCodEstabelecimento`) REFERENCES `estabelecimento` (`pkCodEstabelecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `expedicao`
--
ALTER TABLE `expedicao`
  ADD CONSTRAINT `fk_expedicao_pedido1` FOREIGN KEY (`pedido_pkCodPedido`) REFERENCES `pedido` (`pkCodPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `logErros`
--
ALTER TABLE `logErros`
  ADD CONSTRAINT `fk_logErros_interacao1` FOREIGN KEY (`interacao_pkcodInteracao`) REFERENCES `interacao` (`pkcodInteracao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `fk_parcela_pedido1` FOREIGN KEY (`pedido_pkCodPedido`) REFERENCES `pedido` (`pkCodPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_estabelecimento1` FOREIGN KEY (`estabelecimento_pkCodEstabelecimento`) REFERENCES `estabelecimento` (`pkCodEstabelecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_Pessoa1` FOREIGN KEY (`Pessoa_pkCodPessoa`) REFERENCES `Pessoa` (`pkCodPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedido_has_produtos`
--
ALTER TABLE `pedido_has_produtos`
  ADD CONSTRAINT `fk_pedido_has_produtos_pedido1` FOREIGN KEY (`pedido_pkCodPedido`) REFERENCES `pedido` (`pkCodPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_has_produtos_produtos1` FOREIGN KEY (`produtos_pkCodProdutos`) REFERENCES `produtos` (`pkCodProdutos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  ADD CONSTRAINT `fk_Pessoa_usuario1` FOREIGN KEY (`usuario_pkCodUsuario`) REFERENCES `usuario` (`pkCodUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `preferencia`
--
ALTER TABLE `preferencia`
  ADD CONSTRAINT `fk_preferencia_Pessoa1` FOREIGN KEY (`Pessoa_pkCodPessoa`) REFERENCES `Pessoa` (`pkCodPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_cardapio1` FOREIGN KEY (`cardapio_pkCodCardapio`) REFERENCES `cardapio` (`pkCodCardapio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario_has_estabelecimento`
--
ALTER TABLE `usuario_has_estabelecimento`
  ADD CONSTRAINT `fk_usuario_has_estabelecimento_estabelecimento1` FOREIGN KEY (`estabelecimento_pkCodEstabelecimento`) REFERENCES `estabelecimento` (`pkCodEstabelecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_estabelecimento_usuario1` FOREIGN KEY (`usuario_pkCodUsuario`) REFERENCES `usuario` (`pkCodUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
