-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 03-Jul-2014 às 17:06
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
-- Estrutura da tabela `estabelecimento`
--


delete from `estabelecimento` ;
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
  `endereco` text COLLATE latin1_bin,
  PRIMARY KEY (`pkCodEstabelecimento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `estabelecimento`
--

INSERT INTO `estabelecimento` (`pkCodEstabelecimento`, `cnpj`, `tipo`, `descricao`, `regiao`, `nomeFantazia`, `imagem`, `ativo`, `telefone`, `endereco`) VALUES
(1, 'teste', 'teste', 'A Pizza Hut está presente em 88 países, a rede conta com mais de 12.000 restaurantes ao redor do mundo e emprega mais de 250.000 funcionários apenas nos Estados Unidos. No Brasil, são diversos restaurantes distribuídos na maioria dos estados. Por dia, 11,5 milhões de pizzas são vendidas para mais de 4 milhões de consumidores da Pizza Hut no mundo.', 'teste', 'teste', '/serverPHP/img/pizza-hut-logopromo.jpg', 1, '999999', 'Rua teste, bairro teste , larari '),
(2, 'teste2', 'teste', 'A Pizza Hut está presente em 88 países, a rede conta com mais de 12.000 restaurantes ao redor do mundo e emprega mais de 250.000 funcionários apenas nos Estados Unidos. No Brasil, são diversos restaurantes distribuídos na maioria dos estados. Por dia, 11,5 milhões de pizzas são vendidas para mais de 4 milhões de consumidores da Pizza Hut no mundo.', 'teste', 'teste2', '/serverPHP/img/pizza-hut-logopromo.jpg', 1, '999999', 'Rua teste, bairro teste , larari '),
(3, 'teste3', 'teste3', 'A Pizza Hut está presente em 88 países, a rede conta com mais de 12.000 restaurantes ao redor do mundo e emprega mais de 250.000 funcionários apenas nos Estados Unidos. No Brasil, são diversos restaurantes distribuídos na maioria dos estados. Por dia, 11,5 milhões de pizzas são vendidas para mais de 4 milhões de consumidores da Pizza Hut no mundo.', 'teste3', 'teste3', '/serverPHP/img/pizza-hut-logopromo.jpg', 1, '999999', 'Rua teste, bairro teste , larari ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
