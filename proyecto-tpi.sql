DROP DATABASE IF EXISTS `biblioteca`;
CREATE DATABASE `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `biblioteca`;

#
# Source for table libro
#

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` int(11) NOT NULL DEFAULT '0',
  `titulo` varchar(255) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'titulo',
  `autor` varchar(255) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'autor',
  `editorial` varchar(255) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'editorial',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9819 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

#
# Dumping data for table libro
#

INSERT INTO `libro` VALUES (100,1080,'Enfoque de Sistemas','Carlos Garcia','GWgrand');
INSERT INTO `libro` VALUES (101,1081,'Dinamica de Fluidos','Anna Fatima','Real');
INSERT INTO `libro` VALUES (102,1082,'Ecuaciones transcendentales','Resnick','Real');
INSERT INTO `libro` VALUES (103,1083,'Movimiento simple','Fatima Zaravia','Mejor');
INSERT INTO `libro` VALUES (105,1084,'Ecuaciones Diferenciales','Tomas Manuel', 'Crack');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(12) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Anonimo',
  `password` varchar(255) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'm1sm4',
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Anonimo Anonimo',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `users` VALUES (1,'Admin','4bw1n','Florinda Meza',7);
INSERT INTO `users` VALUES (2,'Registrador','m1sm4','Maria Sol',1);
INSERT INTO `users` VALUES (3,'Corrector','m1sm4','CasimiroBuenavista',2);
INSERT INTO `users` VALUES (4,'Borrador','m1sm4','Juana Perez',3);
