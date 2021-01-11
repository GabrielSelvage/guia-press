# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Base de Dados: guiapress
# Tempo de Geração: 2021-01-11 07:01:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slug` varchar(255) CHARACTER SET latin1 NOT NULL,
  `body` text CHARACTER SET latin1 NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;

INSERT INTO `articles` (`id`, `title`, `slug`, `body`, `createdAt`, `updatedAt`, `categoryId`)
VALUES
	(2,'Criando artigo novo','Criando-artigo-novo','<p>vamos la</p>','2020-12-29 11:11:09','2020-12-29 11:11:09',1),
	(3,'mais um','mais-um','<p>agora vai</p>','2020-12-29 11:11:23','2020-12-29 11:11:23',1),
	(4,'criando outro','criando-outro','<p>novo artigo</p>','2020-12-29 11:11:35','2020-12-29 11:11:35',1),
	(5,'resolvendo linha','resolvendo-linha','<p>e agora?</p>','2020-12-29 11:11:54','2020-12-29 11:11:54',1),
	(6,'Aula 2 - Escalas','Aula-2-Escalas','<p>hoje vamos aprender escalas maiores</p>','2020-12-29 11:12:26','2020-12-29 11:12:26',1),
	(7,'Aula 6 - Campo Harmonico e Cadencia','Aula-6-Campo-Harmonico-e-Cadencia','<p>olha que bacana</p>','2020-12-29 11:12:40','2020-12-29 11:12:40',1),
	(8,'Assistente','Assistente','<p>vamos testar de novo</p>','2020-12-29 11:12:53','2021-01-04 10:18:31',1),
	(9,'Nome novo','Nome-novo','<div class=\"wpb_text_column vc_col-sm-7 content\">\r\n<h1>GABRIEL SELVAGE</h1>\r\n<h1><sup>RIO GRANDE DO SUL</sup></h1>\r\n</div>\r\n<div class=\"wpb_text_column vc_col-sm-5 content\">&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div class=\"wpb_text_column vc_col-sm-7 content\">\r\n<p>M&uacute;sico, arranjador, compositor e produtor musical ga&uacute;cho, Gabriel Selvage iniciou seus estudos ainda na adolesc&ecirc;ncia com seu mestre L&uacute;cio Yanel, e desde muito jovem obteve reconhecimento e visibilidade no meio art&iacute;stico regional ga&uacute;cho. J&aacute; levou sua m&uacute;sica marcante para v&aacute;rios pa&iacute;ses no exterior como Argentina, Uruguai, Paraguai, Portugal, Espanha, Fran&ccedil;a, Inglaterra, Luxemburgo, Holanda, Alemanha e China. Em parceria com a cantora Alana Moraes, lan&ccedil;a &ldquo;Amor &amp; Som&rdquo; em 2012. Em 2015, foi indicado a melhor instrumentista regional no Pr&ecirc;mio A&ccedil;orianos de M&uacute;sica. O primeiro trabalho solo nasceu em 2016, &ldquo;Flor y Truco &ndash; Gabriel Selvage interpreta obras de Lucio Yonel&rdquo;, que contempla um DVD, um CD gravado ao vivo e um songbook com partituras. Em 2017 lan&ccedil;a o &aacute;lbum &ldquo;Balaio de Sons&rdquo;, duo com o acordeonista Luciano Maia e, em 2018, o &ldquo;Alma de Interior&rdquo;, com o violonista Rafael Schimidt. Atualmente vive no Rio de Janeiro, onde prepara seu segundo &aacute;lbum solo &ldquo;Ga&uacute;cho&rdquo;. Em fase de mixagem, tem previs&atilde;o de lan&ccedil;amento para novembro.</p>\r\n<ul class=\"links\">\r\n<li><a href=\"https://www.facebook.com/gabrielselvage/\" target=\"_blank\" rel=\"noopener\">HTTPS://WWW.FACEBOOK.COM/GABRIELSELVAGE/</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"wpb_text_column vc_col-sm-5 content\"><img class=\"destaque\" src=\"https://mimofestival.com/brasil/wp-content/uploads/GabrielSelvage_Florianopolis-SC.jpg\" alt=\"GABRIEL SELVAGE\" /></div>','2020-12-29 11:16:34','2021-01-04 10:20:08',3),
	(10,'TESTE DE SELEÇÃO','TESTE-DE-SELECAO','<p>Vamos de novo</p>','2021-01-04 06:59:32','2021-01-04 10:17:58',4);

/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `slug` varchar(255) CHARACTER SET latin1 NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `title`, `slug`, `createdAt`, `updatedAt`)
VALUES
	(1,'Desenvolvimento Web','Desenvolvimento-Web','2020-12-20 07:18:06','2020-12-20 07:18:06'),
	(3,'Mais uma Categoria nova','Mais-uma-Categoria-nova','2020-12-26 06:26:34','2020-12-27 06:08:15'),
	(4,'Nova categoria','Nova-categoria','2020-12-26 07:10:28','2020-12-26 07:10:28');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `password`, `createdAt`, `updatedAt`)
VALUES
	(1,'gabri@aham.com','$2a$10$Pztom7akcNRwUfq8doYGyemjUL4omUpboXEUEbh4BzwK7xyqjQGHC','2021-01-06 07:21:37','2021-01-06 07:21:37'),
	(2,'gabri@aham.com','$2a$10$CGH20u6OvdFkHxyNIguEVe9w4OiEWCtbRdjxiIUvnqVEoopW1kgBi','2021-01-06 07:22:01','2021-01-06 07:22:01'),
	(3,'gabriel.selvage@hotmail.com','$2a$10$cu05SKJD6unFzT0xEPg.o.69pl.0H00DuqcKrQUiRN.wq1NVG.Rza','2021-01-07 06:26:56','2021-01-07 06:26:56'),
	(4,'aeoaejfoeijdfe@eifep.com','$2a$10$MWZ9l1fcE/eckpS4UJ2xJeEBSvWQS13s2olyAdjDkb2CIkIHXE2P6','2021-01-07 10:25:19','2021-01-07 10:25:19'),
	(5,'ijijeijfeij@gmail.com','$2a$10$NwsvpsgTojmX2P/NIQVED.gvB9U1lklwYBPSQ6Z7AXgS369A1Tu3.','2021-01-07 10:25:51','2021-01-07 10:25:51');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
