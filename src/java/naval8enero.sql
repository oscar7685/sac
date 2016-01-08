/*
Navicat MySQL Data Transfer

Source Server         : sac
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : naval

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-01-08 16:29:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aula
-- ----------------------------
DROP TABLE IF EXISTS `aula`;
CREATE TABLE `aula` (
  `idaula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `tipo` varchar(500) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `estado` varchar(500) DEFAULT NULL,
  `capacidad_audiovisual` tinyint(1) DEFAULT NULL,
  `edificio_idedificio` int(11) NOT NULL,
  `tablero` tinyint(1) DEFAULT NULL,
  `video_beam` tinyint(1) DEFAULT NULL,
  `tv` tinyint(1) DEFAULT NULL,
  `responsable` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idaula`),
  KEY `fk_aula_edificio_idx` (`edificio_idedificio`),
  KEY `fk_aula_curso1_idx` (`responsable`),
  CONSTRAINT `fk_aula_curso1` FOREIGN KEY (`responsable`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aula_edificio` FOREIGN KEY (`edificio_idedificio`) REFERENCES `edificio` (`idedificio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO `aula` VALUES ('1', '1', 'Aula', '21', 'Activa', '0', '1', '0', '0', '0', null, '1');
INSERT INTO `aula` VALUES ('2', '2', 'Aula', '24', 'Activa', '0', '1', '0', '0', '0', '2', '1');
INSERT INTO `aula` VALUES ('3', '3', 'Aula', '7', 'Activa', '0', '1', '0', '0', '0', '3', '1');
INSERT INTO `aula` VALUES ('4', '4', 'Aula', '17', 'Activa', '0', '1', '0', '0', '0', '4', '1');
INSERT INTO `aula` VALUES ('5', '5', 'Aula', '13', 'Activa', '0', '1', '0', '0', '0', '5', '1');
INSERT INTO `aula` VALUES ('6', '6', 'Aula', '13', 'Activa', '0', '1', '0', '0', '0', '6', '1');
INSERT INTO `aula` VALUES ('7', '7', 'Aula', '20', 'Activa', '0', '1', '0', '0', '0', '7', '1');
INSERT INTO `aula` VALUES ('8', '8', 'Aula', '15', 'Activa', '0', '1', '0', '0', '0', '8', '1');
INSERT INTO `aula` VALUES ('9', '9', 'Aula', '22', 'Activa', '0', '2', '0', '0', '0', '9', '1');
INSERT INTO `aula` VALUES ('10', '10', 'Aula', '23', 'Activa', '0', '2', '0', '0', '0', '10', '1');
INSERT INTO `aula` VALUES ('11', '11', 'Aula', '25', 'Activa', '0', '2', '0', '0', '0', '11', '1');
INSERT INTO `aula` VALUES ('12', '12', 'Aula', '25', 'Activa', '0', '2', '0', '0', '0', '12', '1');
INSERT INTO `aula` VALUES ('13', '13', 'Aula', '23', 'Activa', '0', '2', '0', '0', '0', '13', '1');
INSERT INTO `aula` VALUES ('14', '14', 'Aula', '14', 'Activa', '0', '2', '0', '0', '0', '14', '1');
INSERT INTO `aula` VALUES ('15', '15', 'Aula', '16', 'Activa', '0', '2', '0', '0', '0', '15', '1');
INSERT INTO `aula` VALUES ('16', '16', 'Aula', '16', 'Activa', '0', '2', '0', '0', '0', '16', '1');
INSERT INTO `aula` VALUES ('17', '17', 'Aula', '22', 'Activa', '0', '2', '0', '0', '0', '17', '1');
INSERT INTO `aula` VALUES ('18', '18', 'Aula', '20', 'Activa', '0', '3', '0', '0', '0', '18', '1');
INSERT INTO `aula` VALUES ('19', '19', 'Aula', '23', 'Activa', '0', '3', '0', '0', '0', '19', '1');
INSERT INTO `aula` VALUES ('20', '20', 'Aula', '20', 'Activa', '0', '3', '0', '0', '0', '20', '1');
INSERT INTO `aula` VALUES ('21', '21', 'Aula', '23', 'Activa', '0', '3', '0', '0', '0', '21', '1');
INSERT INTO `aula` VALUES ('22', '22', 'Aula', '15', 'Activa', '0', '3', '0', '0', '0', '22', '1');
INSERT INTO `aula` VALUES ('23', '23', 'Aula', '12', 'Activa', '0', '3', '0', '0', '0', '23', '1');
INSERT INTO `aula` VALUES ('24', '24', 'Aula', '21', 'Activa', '0', '3', '0', '0', '0', '24', '1');
INSERT INTO `aula` VALUES ('25', 'C-02', 'Aula', '17', 'Activa', '0', '4', '0', '0', '0', '25', '1');
INSERT INTO `aula` VALUES ('26', 'C-03', 'Aula', '17', 'Activa', '0', '4', '0', '0', '0', '26', '1');
INSERT INTO `aula` VALUES ('27', 'C-04', 'Aula', '16', 'Activa', '0', '4', '0', '0', '0', '27', '1');
INSERT INTO `aula` VALUES ('28', 'C-05', 'Aula', '22', 'Activa', '0', '4', '0', '0', '0', '28', '1');
INSERT INTO `aula` VALUES ('29', 'C-06', 'Aula', '23', 'Activa', '0', '4', '0', '0', '0', '29', '1');
INSERT INTO `aula` VALUES ('30', 'C-07', 'Aula', '28', 'Activa', '0', '4', '0', '0', '0', '30', '1');
INSERT INTO `aula` VALUES ('31', 'C-08', 'Aula', '0', 'Inactiva', '0', '4', '0', '0', '0', null, '1');
INSERT INTO `aula` VALUES ('32', 'C-09', 'Aula', '0', 'Inactiva', '0', '4', '0', '0', '0', null, '1');
INSERT INTO `aula` VALUES ('33', 'A. ING NAVAL', 'Aula', '10', 'Activa', '0', '5', '0', '0', '0', '33', '1');
INSERT INTO `aula` VALUES ('34', 'LAB. COMUNICACIONES', 'Aula', '5', 'Activa', '0', '5', '0', '0', '0', '34', '1');
INSERT INTO `aula` VALUES ('35', 'CCPIN', 'Aula', '8', 'Activa', '0', '5', '0', '0', '0', '35', '1');
INSERT INTO `aula` VALUES ('36', 'A. MAESTRIA ING', 'Aula', '24', 'Activa', '0', '5', '0', '0', '0', '36', '1');
INSERT INTO `aula` VALUES ('37', 'A. SIG', 'Aula', '12', 'Activa', '0', '5', '0', '0', '0', '37', '1');
INSERT INTO `aula` VALUES ('38', 'A. CRISIS', 'Aula', '29', 'Activa', '0', '5', '0', '0', '0', '38', '1');
INSERT INTO `aula` VALUES ('39', 'A. 209', 'Aula', '7', 'Activa', '0', '5', '0', '0', '0', '39', '1');
INSERT INTO `aula` VALUES ('40', 'A. 208', 'Aula', '7', 'Activa', '0', '5', '0', '0', '0', '40', '1');
INSERT INTO `aula` VALUES ('41', 'LAB. LOGISTICA', 'Aula', '10', 'Activa', '0', '5', '0', '0', '0', '41', '1');
INSERT INTO `aula` VALUES ('42', 'A. 206', 'Aula', '12', 'Activa', '0', '5', '0', '0', '0', '42', '1');
INSERT INTO `aula` VALUES ('43', 'A. ROJA', 'Aula', '0', 'Inactiva', '0', '6', '0', '0', '0', null, '1');
INSERT INTO `aula` VALUES ('44', 'A. AZUL', 'Aula', '21', 'Activa', '0', '6', '0', '0', '0', '44', '1');
INSERT INTO `aula` VALUES ('45', 'A. TACTICA', 'Aula', '32', 'Activa', '0', '7', '0', '0', '0', '45', '1');
INSERT INTO `aula` VALUES ('46', 'A. NAVEGACION', 'Aula', '29', 'Activa', '0', '7', '0', '0', '0', '46', '1');
INSERT INTO `aula` VALUES ('47', 'A. ARQUITECTURA NAVAL', 'Aula', '0', 'Inactiva', '0', '8', '0', '0', '0', null, '1');
INSERT INTO `aula` VALUES ('48', 'LAB. ELECTRICIDAD', 'Aula', '0', 'Inactiva', '0', '8', '0', '0', '0', null, '1');

-- ----------------------------
-- Table structure for curso
-- ----------------------------
DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `numero_estudiantes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('1', '4.1 ING', '9');
INSERT INTO `curso` VALUES ('2', '4.2 LA', '15');
INSERT INTO `curso` VALUES ('3', '3.2 MC', '7');
INSERT INTO `curso` VALUES ('4', '2.2 IM', '17');
INSERT INTO `curso` VALUES ('5', '3.1 SPO', '18');
INSERT INTO `curso` VALUES ('6', '2.2 SPA', '13');
INSERT INTO `curso` VALUES ('7', '3.1 IM', '10');
INSERT INTO `curso` VALUES ('8', '3.1 ING', '18');
INSERT INTO `curso` VALUES ('9', '4.1 IM', '23');
INSERT INTO `curso` VALUES ('10', '4.1 SPA', '14');
INSERT INTO `curso` VALUES ('11', '2.2 SPO', '11');
INSERT INTO `curso` VALUES ('12', '2.2 SPE', '11');
INSERT INTO `curso` VALUES ('13', '2.2 ING', '9');
INSERT INTO `curso` VALUES ('14', '2.2 LA', '14');
INSERT INTO `curso` VALUES ('15', '2.2 MC', '9');
INSERT INTO `curso` VALUES ('16', '2.1 IM', '22');
INSERT INTO `curso` VALUES ('17', '4.2 SPO', '14');
INSERT INTO `curso` VALUES ('18', '4.2 SPE', '11');
INSERT INTO `curso` VALUES ('19', '1.2 A', '22');
INSERT INTO `curso` VALUES ('20', '1.2 B', '18');
INSERT INTO `curso` VALUES ('21', '1.2 C', '25');
INSERT INTO `curso` VALUES ('22', '1.2 D', '15');
INSERT INTO `curso` VALUES ('23', '1.2 MC', '12');
INSERT INTO `curso` VALUES ('24', '1.2 IM', '22');
INSERT INTO `curso` VALUES ('25', '1.1 A', '0');
INSERT INTO `curso` VALUES ('26', '1.1 B', '0');
INSERT INTO `curso` VALUES ('27', '1.1 C', '0');
INSERT INTO `curso` VALUES ('28', '1.1 IM', '21');
INSERT INTO `curso` VALUES ('29', 'CDPRON', '24');
INSERT INTO `curso` VALUES ('30', 'PR-49', '33');
INSERT INTO `curso` VALUES ('33', '4.2 ING', '10');
INSERT INTO `curso` VALUES ('34', 'CCPELE', '0');
INSERT INTO `curso` VALUES ('35', 'CCPIN', '8');
INSERT INTO `curso` VALUES ('36', 'BASICO 59', '0');
INSERT INTO `curso` VALUES ('37', '4.1 SPO', '12');
INSERT INTO `curso` VALUES ('38', '2.1 B', '31');
INSERT INTO `curso` VALUES ('39', 'CCPOF', '0');
INSERT INTO `curso` VALUES ('40', 'CCPCN', '0');
INSERT INTO `curso` VALUES ('41', 'CCPAM-31', '0');
INSERT INTO `curso` VALUES ('42', 'CCPAD', '0');
INSERT INTO `curso` VALUES ('44', '4.2 IM', '20');
INSERT INTO `curso` VALUES ('45', 'COMANDO 84', '0');
INSERT INTO `curso` VALUES ('46', '2.1 A', '30');

-- ----------------------------
-- Table structure for detalle_parte_diario
-- ----------------------------
DROP TABLE IF EXISTS `detalle_parte_diario`;
CREATE TABLE `detalle_parte_diario` (
  `iddetalle_parte_diario` int(11) NOT NULL AUTO_INCREMENT,
  `parte_diario_idparte_diario` int(11) NOT NULL,
  `hora_clase` int(11) DEFAULT NULL,
  `codigo_nombre_asignatura` varchar(1000) DEFAULT NULL,
  `hora_inicio` date DEFAULT NULL,
  `hora_final` date DEFAULT NULL,
  `estudiantes_faltantes` varchar(45) DEFAULT NULL,
  `motivo_inasistencia_estudiante_idmotivo_inasistencia` int(11) DEFAULT NULL,
  `tema` varchar(2000) DEFAULT NULL,
  `dinamicas_empleadas_iddinamicas_empleadas` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle_parte_diario`),
  KEY `fk_detalle_parte_diario_parte_diario1_idx` (`parte_diario_idparte_diario`),
  KEY `fk_detalle_parte_diario_motivo_inasistencia_estudiante1_idx` (`motivo_inasistencia_estudiante_idmotivo_inasistencia`),
  KEY `fk_detalle_parte_diario_dinamicas_empleadas1_idx` (`dinamicas_empleadas_iddinamicas_empleadas`),
  CONSTRAINT `fk_detalle_parte_diario_dinamicas_empleadas1` FOREIGN KEY (`dinamicas_empleadas_iddinamicas_empleadas`) REFERENCES `dinamicas_empleadas` (`iddinamicas_empleadas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_parte_diario_motivo_inasistencia_estudiante1` FOREIGN KEY (`motivo_inasistencia_estudiante_idmotivo_inasistencia`) REFERENCES `motivo_inasistencia_estudiante` (`idmotivo_inasistencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_parte_diario_parte_diario1` FOREIGN KEY (`parte_diario_idparte_diario`) REFERENCES `parte_diario` (`idparte_diario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalle_parte_diario
-- ----------------------------

-- ----------------------------
-- Table structure for dias
-- ----------------------------
DROP TABLE IF EXISTS `dias`;
CREATE TABLE `dias` (
  `iddias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`iddias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dias
-- ----------------------------
INSERT INTO `dias` VALUES ('1', 'LUNES');
INSERT INTO `dias` VALUES ('2', 'MARTES');
INSERT INTO `dias` VALUES ('3', 'MIERCOLES');
INSERT INTO `dias` VALUES ('4', 'JUEVES');
INSERT INTO `dias` VALUES ('5', 'VIERNES');
INSERT INTO `dias` VALUES ('6', 'SABADO');

-- ----------------------------
-- Table structure for dinamicas_empleadas
-- ----------------------------
DROP TABLE IF EXISTS `dinamicas_empleadas`;
CREATE TABLE `dinamicas_empleadas` (
  `iddinamicas_empleadas` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`iddinamicas_empleadas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dinamicas_empleadas
-- ----------------------------
INSERT INTO `dinamicas_empleadas` VALUES ('1', 'TI', 'TRABAJO INDIVIDUAL');
INSERT INTO `dinamicas_empleadas` VALUES ('2', 'CM', 'CLASE MAGISTRAL');
INSERT INTO `dinamicas_empleadas` VALUES ('3', 'QR', 'QUIZ INICIO DE CLASE');
INSERT INTO `dinamicas_empleadas` VALUES ('4', 'PT', 'PASADA A TABLERO');
INSERT INTO `dinamicas_empleadas` VALUES ('5', 'EP', 'EVALUACION PARCIAL');
INSERT INTO `dinamicas_empleadas` VALUES ('6', 'EFP', 'EVALUACION DEL PERIODO');
INSERT INTO `dinamicas_empleadas` VALUES ('7', 'STG', 'SOCIALIZACION TRABAJO EN GRUPO');
INSERT INTO `dinamicas_empleadas` VALUES ('8', 'OBG', 'OBSERVACION GENERAL - AL RESPALDO');
INSERT INTO `dinamicas_empleadas` VALUES ('9', 'PL', 'PLENARIA EN CLASE DE TEMA FINAL');
INSERT INTO `dinamicas_empleadas` VALUES ('10', 'TGR', 'TRABAJO EN GRUPO SUPERVISADO');

-- ----------------------------
-- Table structure for edificio
-- ----------------------------
DROP TABLE IF EXISTS `edificio`;
CREATE TABLE `edificio` (
  `idedificio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `pisos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idedificio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edificio
-- ----------------------------
INSERT INTO `edificio` VALUES ('1', 'TRINQUETE', '5');
INSERT INTO `edificio` VALUES ('2', 'MAYOR', '5');
INSERT INTO `edificio` VALUES ('3', 'MESANA', '5');
INSERT INTO `edificio` VALUES ('4', 'BRION', '4');
INSERT INTO `edificio` VALUES ('5', 'REYES', '5');
INSERT INTO `edificio` VALUES ('6', 'INFORMATICA', '5');
INSERT INTO `edificio` VALUES ('7', 'PLANETARIO', '5');
INSERT INTO `edificio` VALUES ('8', 'CASA BLANCA', '5');
INSERT INTO `edificio` VALUES ('9', 'COMANDO', '5');
INSERT INTO `edificio` VALUES ('10', 'ALFA SEXTANTIS', '5');

-- ----------------------------
-- Table structure for facultad
-- ----------------------------
DROP TABLE IF EXISTS `facultad`;
CREATE TABLE `facultad` (
  `idfacultad` int(11) NOT NULL AUTO_INCREMENT,
  `facultad` varchar(255) NOT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES ('1', 'CIENCIAS SOCIALES');
INSERT INTO `facultad` VALUES ('2', 'ADMINISTRACION MARITIMA');
INSERT INTO `facultad` VALUES ('3', 'ING. NAVAL');
INSERT INTO `facultad` VALUES ('4', 'CIENCIAS NAVALES');
INSERT INTO `facultad` VALUES ('5', 'CIENCIAS BASICAS');
INSERT INTO `facultad` VALUES ('6', 'INFANTERIA DE MARINA');
INSERT INTO `facultad` VALUES ('7', 'OCEANOGRAFIA FISICA');
INSERT INTO `facultad` VALUES ('8', 'DECANATURA');

-- ----------------------------
-- Table structure for hora
-- ----------------------------
DROP TABLE IF EXISTS `hora`;
CREATE TABLE `hora` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `horainicio` datetime DEFAULT NULL,
  `horafinal` datetime DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hora
-- ----------------------------
INSERT INTO `hora` VALUES ('1', '1', '2015-12-27 06:55:00', '2015-12-27 07:45:00');
INSERT INTO `hora` VALUES ('2', '2', '2015-12-27 08:10:00', '2015-12-27 09:00:00');
INSERT INTO `hora` VALUES ('3', '3', '2015-12-27 09:00:00', '2015-12-27 09:50:00');
INSERT INTO `hora` VALUES ('4', '4', '2015-12-27 10:10:00', '2015-12-27 11:00:00');
INSERT INTO `hora` VALUES ('5', '5', '2015-12-27 11:00:00', '2015-12-27 11:50:00');
INSERT INTO `hora` VALUES ('6', '6', '2015-12-27 11:50:00', '2015-12-27 12:40:00');
INSERT INTO `hora` VALUES ('7', '7', '2015-12-27 14:00:00', '2015-12-27 15:00:00');
INSERT INTO `hora` VALUES ('8', '8', '2015-12-27 15:00:00', '2015-12-27 16:00:00');
INSERT INTO `hora` VALUES ('9', '9', '2015-12-27 16:00:00', '2015-12-27 17:00:00');
INSERT INTO `hora` VALUES ('10', '10', '2015-12-27 17:00:00', '2015-12-27 18:00:00');
INSERT INTO `hora` VALUES ('11', '11', '2015-12-27 18:00:00', '2015-12-27 19:30:00');
INSERT INTO `hora` VALUES ('12', '12', '2015-12-27 19:30:00', '2015-12-27 20:00:00');
INSERT INTO `hora` VALUES ('13', '13', '2015-12-27 20:00:00', '2015-12-27 21:30:00');
INSERT INTO `hora` VALUES ('14', '14', '2015-12-27 21:30:00', '2015-12-27 22:00:00');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `profesor_idprofesor` int(11) NOT NULL,
  `aula_idaula` int(11) NOT NULL,
  `dias_iddias` int(11) NOT NULL,
  `hora_idhorario` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idhorario`),
  KEY `fk_horario_aula_profesor1_idx` (`profesor_idprofesor`),
  KEY `fk_horario_aula_aula1_idx` (`aula_idaula`),
  KEY `fk_horario_aula_dias1_idx` (`dias_iddias`),
  KEY `fk_horario_aula_hora1_idx` (`hora_idhorario`),
  KEY `fk_horario_aula_curso1_idx` (`curso_idcurso`),
  CONSTRAINT `fk_horario_aula_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_aula_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_aula_dias1` FOREIGN KEY (`dias_iddias`) REFERENCES `dias` (`iddias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_aula_hora1` FOREIGN KEY (`hora_idhorario`) REFERENCES `hora` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_aula_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', '20', '1', '1', '1', '1');
INSERT INTO `horario` VALUES ('2', '28', '1', '1', '2', '1');
INSERT INTO `horario` VALUES ('3', '28', '1', '1', '3', '1');
INSERT INTO `horario` VALUES ('4', '27', '1', '1', '4', '1');
INSERT INTO `horario` VALUES ('5', '27', '1', '1', '5', '1');
INSERT INTO `horario` VALUES ('6', '193', '1', '1', '6', '1');
INSERT INTO `horario` VALUES ('7', '194', '1', '1', '7', '1');
INSERT INTO `horario` VALUES ('8', '194', '1', '1', '8', '1');
INSERT INTO `horario` VALUES ('9', '194', '1', '1', '9', '1');
INSERT INTO `horario` VALUES ('10', '194', '1', '1', '10', '1');
INSERT INTO `horario` VALUES ('11', '194', '1', '1', '11', '1');
INSERT INTO `horario` VALUES ('12', '193', '1', '1', '12', '1');
INSERT INTO `horario` VALUES ('13', '193', '1', '1', '13', '1');
INSERT INTO `horario` VALUES ('14', '194', '1', '1', '14', '1');
INSERT INTO `horario` VALUES ('15', '21', '2', '2', '1', '2');
INSERT INTO `horario` VALUES ('16', '21', '2', '2', '2', '2');
INSERT INTO `horario` VALUES ('17', '1', '2', '2', '3', '2');
INSERT INTO `horario` VALUES ('18', '1', '2', '2', '4', '2');
INSERT INTO `horario` VALUES ('19', '1', '2', '2', '5', '2');
INSERT INTO `horario` VALUES ('20', '1', '2', '2', '6', '2');
INSERT INTO `horario` VALUES ('21', '194', '2', '2', '7', '2');
INSERT INTO `horario` VALUES ('22', '194', '2', '2', '8', '2');
INSERT INTO `horario` VALUES ('23', '194', '2', '2', '9', '2');
INSERT INTO `horario` VALUES ('24', '194', '2', '2', '10', '2');
INSERT INTO `horario` VALUES ('25', '194', '2', '2', '11', '2');
INSERT INTO `horario` VALUES ('26', '193', '2', '2', '12', '2');
INSERT INTO `horario` VALUES ('27', '193', '2', '2', '13', '2');
INSERT INTO `horario` VALUES ('28', '194', '2', '2', '14', '2');

-- ----------------------------
-- Table structure for mantenimiento
-- ----------------------------
DROP TABLE IF EXISTS `mantenimiento`;
CREATE TABLE `mantenimiento` (
  `idmantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `solicitud` varchar(2000) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `aula_idaula` int(11) NOT NULL,
  `solicitante` varchar(255) DEFAULT NULL,
  `trabajador` varchar(255) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `fuera_servicio` tinyint(1) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT NULL,
  `aprobado_por` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmantenimiento`),
  KEY `fk_mantenimiento_aula1_idx` (`aula_idaula`),
  KEY `fk_mantenimiento_usuario1_idx` (`solicitante`),
  KEY `fk_mantenimiento_usuario2_idx` (`trabajador`),
  KEY `fk_mantenimiento_usuario3_idx` (`aprobado_por`),
  CONSTRAINT `fk_mantenimiento_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_usuario1` FOREIGN KEY (`solicitante`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_usuario2` FOREIGN KEY (`trabajador`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_usuario3` FOREIGN KEY (`aprobado_por`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mantenimiento
-- ----------------------------
INSERT INTO `mantenimiento` VALUES ('1', '2016-01-06 11:30:00', '2016-01-07 11:30:10', 'Un mantenimiento preventivo1', '1', 'preventivo', '1', null, 'oscar7685', null, null, null, null);
INSERT INTO `mantenimiento` VALUES ('2', '2016-01-06 13:30:00', '2016-01-06 16:00:00', 'Un mantenimiento preventivo2', '1', 'preventivo', '2', null, 'oscar7685', null, null, null, null);
INSERT INTO `mantenimiento` VALUES ('3', '2016-01-18 13:30:00', '2016-01-20 16:00:00', 'Un mantenimiento correctivo3', '1', 'correctivo', '2', null, 'oscar7685', null, null, null, null);

-- ----------------------------
-- Table structure for motivo_inasistencia_estudiante
-- ----------------------------
DROP TABLE IF EXISTS `motivo_inasistencia_estudiante`;
CREATE TABLE `motivo_inasistencia_estudiante` (
  `idmotivo_inasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idmotivo_inasistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of motivo_inasistencia_estudiante
-- ----------------------------

-- ----------------------------
-- Table structure for parte_diario
-- ----------------------------
DROP TABLE IF EXISTS `parte_diario`;
CREATE TABLE `parte_diario` (
  `idparte_diario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `dias_iddias` int(11) NOT NULL,
  `aula_idaula` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idparte_diario`),
  KEY `fk_parte_diario_dias1_idx` (`dias_iddias`),
  KEY `fk_parte_diario_aula1_idx` (`aula_idaula`),
  KEY `fk_parte_diario_curso1_idx` (`curso_idcurso`),
  CONSTRAINT `fk_parte_diario_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parte_diario_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parte_diario_dias1` FOREIGN KEY (`dias_iddias`) REFERENCES `dias` (`iddias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parte_diario
-- ----------------------------

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `idpermisos` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idpermisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permisos
-- ----------------------------

-- ----------------------------
-- Table structure for profesor
-- ----------------------------
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idprofesor`),
  KEY `fk_profesor_facultad1_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_profesor_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profesor
-- ----------------------------
INSERT INTO `profesor` VALUES ('1', 'INGLES', 'INGLES', '1');
INSERT INTO `profesor` VALUES ('2', 'AM-1', 'PF. GARCES GABRIEL', '2');
INSERT INTO `profesor` VALUES ('3', 'AM-2', 'PF. GRACIA ACERO LUIS DANIEL', '2');
INSERT INTO `profesor` VALUES ('4', 'AM-3', 'PF. MORENO GALVIS ANDRES JUVENAL', '2');
INSERT INTO `profesor` VALUES ('5', 'AM-4', 'PF. GARCES LUIS GUILLERMO', '2');
INSERT INTO `profesor` VALUES ('6', 'AM-5', 'CC. URREGO NIÃ‘O DIANA', '2');
INSERT INTO `profesor` VALUES ('7', 'AM-6', 'CF. BERNAL MARIO', '2');
INSERT INTO `profesor` VALUES ('8', 'AM-7', 'PF. PAUTT JUAN', '2');
INSERT INTO `profesor` VALUES ('9', 'AM-8', 'PF. OSORIO DIANA', '2');
INSERT INTO `profesor` VALUES ('10', 'AM-9', 'PF. UGARRIZA RAFAEL', '2');
INSERT INTO `profesor` VALUES ('11', 'AM-10', 'PF. OSORIO RICO ALFONSO', '2');
INSERT INTO `profesor` VALUES ('12', 'AM-11', 'CF. CHAPARRO ORTIZ ALEJANDRO', '2');
INSERT INTO `profesor` VALUES ('13', 'AM-12', 'PR. PARDO RAMOS PATRICIA', '2');
INSERT INTO `profesor` VALUES ('14', 'AM-13', 'PF. TORRES  YAZAGARAY OSCAR', '2');
INSERT INTO `profesor` VALUES ('15', 'AM-14', 'PF. JACOME PEÃ‘ARANDA INGRID', '2');
INSERT INTO `profesor` VALUES ('16', 'AM-15', 'PF. ZAPATEIRO ORLANDO', '2');
INSERT INTO `profesor` VALUES ('17', 'AM-16', 'PF. RODRIGUEZ MARRUGO JENNY', '2');
INSERT INTO `profesor` VALUES ('18', 'AM-17', 'TF.MORENO MARCELA', '2');
INSERT INTO `profesor` VALUES ('19', 'AM-18', 'PF. BETANCOUR PEREZ LUCERO', '2');
INSERT INTO `profesor` VALUES ('20', 'AM-19', 'PF . BECHARA LOPERA ALBINA', '2');
INSERT INTO `profesor` VALUES ('21', 'AM-20', 'PF. RODRIGUEZ NORIEGA GABRIEL', '2');
INSERT INTO `profesor` VALUES ('22', 'AM-21', 'PF. ESPINOSA BALLESTA NICANOR', '2');
INSERT INTO `profesor` VALUES ('23', 'AM-23', 'PF. MARTINEZ CARRASCAL CARLOS', '2');
INSERT INTO `profesor` VALUES ('24', 'AM-24', 'PF. LORA JIMENEZ JUAN CARLOS', '2');
INSERT INTO `profesor` VALUES ('25', 'AM-25', 'TN. GARCIA MEJIA LISETH', '2');
INSERT INTO `profesor` VALUES ('26', 'AM-26', 'CC. CORDERO PARDO KELLY', '2');
INSERT INTO `profesor` VALUES ('27', 'IN-1', 'PF. VERGAR EDGAR', '3');
INSERT INTO `profesor` VALUES ('28', 'IN-2', 'PF. CUADRADO WILLIAM', '3');
INSERT INTO `profesor` VALUES ('29', 'IN-3', 'PF. YACUB BASHIR', '3');
INSERT INTO `profesor` VALUES ('30', 'IN-4', 'CC. MEJIA CHAPARRO ELKIN', '3');
INSERT INTO `profesor` VALUES ('31', 'IN-5', 'PF. IMITOLA COLEY ELIAS GUILLERMO', '3');
INSERT INTO `profesor` VALUES ('32', 'IN-6', 'PF. CALI MARCELO', '3');
INSERT INTO `profesor` VALUES ('33', 'IN-7', 'PF. GUTIERREZ MARTINEZ CARLOS ANDRES', '3');
INSERT INTO `profesor` VALUES ('34', 'IN-8', 'TF. ROJAS REYES GONZALO', '3');
INSERT INTO `profesor` VALUES ('35', 'IN-9', 'PF. TRESPALACIO EDUARDO', '3');
INSERT INTO `profesor` VALUES ('36', 'IN-10', 'PF. AREVALO ROGER', '3');
INSERT INTO `profesor` VALUES ('37', 'IN-11', 'CF. APONTE SUAREZ WITER', '3');
INSERT INTO `profesor` VALUES ('38', 'IN-12', 'PF. CARRILLO SANDRA', '3');
INSERT INTO `profesor` VALUES ('39', 'IN-13', 'PF. RAMOS ALCIDES', '3');
INSERT INTO `profesor` VALUES ('40', 'IN-14', 'PF. CARDENAS LUIS', '3');
INSERT INTO `profesor` VALUES ('41', 'IN-15', 'CF. CALLAMAND RAFAEL', '3');
INSERT INTO `profesor` VALUES ('42', 'IN-16', 'TN. PARRA MONTAÃ‘EZ DIEGO ENRIQUE', '3');
INSERT INTO `profesor` VALUES ('43', 'IN-17', 'PF. CAJAL BARRIOS JUAN VICENTE', '3');
INSERT INTO `profesor` VALUES ('44', 'IN-18', 'PF. CANTILLO INGRID', '3');
INSERT INTO `profesor` VALUES ('45', 'IN-20', 'PF. PEREZ HARVEY', '3');
INSERT INTO `profesor` VALUES ('46', 'IN-21', 'PF. ARDILA JUAN', '3');
INSERT INTO `profesor` VALUES ('47', 'IN-22', 'PF. CONTRERA JUAN', '3');
INSERT INTO `profesor` VALUES ('48', 'IN-23', 'TN. TORO MACHUCA RAFAEL', '3');
INSERT INTO `profesor` VALUES ('49', 'IN-25', 'PF. DIAZ DIAZ ELY RAFAEL', '3');
INSERT INTO `profesor` VALUES ('50', 'CN-1', 'PF. PRADA MARIO', '4');
INSERT INTO `profesor` VALUES ('51', 'CN-2', 'TN. VARGAS CARDENAS GUSTAVO', '4');
INSERT INTO `profesor` VALUES ('52', 'CN-3', 'BERBEO CALDERON LUIS', '4');
INSERT INTO `profesor` VALUES ('53', 'CN-4', 'TF. RIVERA VARGAS MARIO', '4');
INSERT INTO `profesor` VALUES ('54', 'CN-5', 'PF. PINZON JUAN CARLOS', '4');
INSERT INTO `profesor` VALUES ('55', 'CN-7', 'PF. LONDOÃ‘O SERGIO', '4');
INSERT INTO `profesor` VALUES ('56', 'CN-8', 'PF. SAENZ MARCO', '4');
INSERT INTO `profesor` VALUES ('57', 'CN-9', 'TN. SALGUERO LONDOÃ‘O DIEGO', '4');
INSERT INTO `profesor` VALUES ('58', 'CN-10', 'SJT. GUTIERREZ GUTIERREZ ANDRES', '4');
INSERT INTO `profesor` VALUES ('59', 'CN-11', 'SJ. VILLAREAL VELAZCO OSWALDO', '4');
INSERT INTO `profesor` VALUES ('60', 'CN-12', 'TF. MEJIA ANDRES MAURICIO', '4');
INSERT INTO `profesor` VALUES ('61', 'CN-13', 'PF. JIMENEZ JOSE', '4');
INSERT INTO `profesor` VALUES ('62', 'CN-14', 'PF. HOYOS PARDO FRANCISCO JAVIER', '4');
INSERT INTO `profesor` VALUES ('63', 'CN-15', 'PF. ORTIZ LEONEL', '4');
INSERT INTO `profesor` VALUES ('64', 'CN-16', 'SJ. VELAZCO POLO HUGO', '4');
INSERT INTO `profesor` VALUES ('65', 'CN-17', 'TF. GARCES LALO', '4');
INSERT INTO `profesor` VALUES ('66', 'CN-18', 'PF. LORDUY EDUARDO', '4');
INSERT INTO `profesor` VALUES ('67', 'CN-19', 'PF. DIAZ ELVIN', '4');
INSERT INTO `profesor` VALUES ('68', 'CN-20', 'TF. QUIROGA NOVA LINA MARIA', '4');
INSERT INTO `profesor` VALUES ('69', 'CN-21', 'PF. RODRIGUEZ LEONARDO', '4');
INSERT INTO `profesor` VALUES ('70', 'CN-22', 'SJ. SARMIENTO JOSE', '4');
INSERT INTO `profesor` VALUES ('71', 'CN-23', 'TF. ROBLEDO LEAL EDGAR LIBARDO', '4');
INSERT INTO `profesor` VALUES ('72', 'CN-24', 'CC. TORRES CABALLERO CASLOS ANDRES', '4');
INSERT INTO `profesor` VALUES ('73', 'CN-25', 'SJ. ANAYA CARMONA JOSE', '4');
INSERT INTO `profesor` VALUES ('74', 'CN-26', 'PF. MOLANO FERNANDO', '4');
INSERT INTO `profesor` VALUES ('75', 'CN-27', 'PF. GIL MANUEL', '4');
INSERT INTO `profesor` VALUES ('76', 'CN-28', 'TN. RODRIGUEZ MURILLO ANDRES', '4');
INSERT INTO `profesor` VALUES ('77', 'CN-29', 'TN. PEREZ TOMAS', '4');
INSERT INTO `profesor` VALUES ('78', 'CN-30', 'PF. CANTOR CARLOS', '4');
INSERT INTO `profesor` VALUES ('79', 'CN-31', 'PF. ARDILA ARMANDO', '4');
INSERT INTO `profesor` VALUES ('80', 'CN-32', 'SJ. BARRAZA RAFAEL', '4');
INSERT INTO `profesor` VALUES ('81', 'CN-33', 'TF. SUAREZ DIEGO', '4');
INSERT INTO `profesor` VALUES ('82', 'CN-34', 'TF. GONZALEZ LUZ PERLA', '4');
INSERT INTO `profesor` VALUES ('83', 'CN-35', 'CC. ESCALANTE ANDRES', '4');
INSERT INTO `profesor` VALUES ('84', 'CN-36', 'CF. ANGEL SANCHEZ CARLOS ROBERTO ', '4');
INSERT INTO `profesor` VALUES ('85', 'CN-37', 'PF. ARRAZOLA GUSTAVO', '4');
INSERT INTO `profesor` VALUES ('86', 'CN-38', 'CF. ARDILA REY HECTOR', '4');
INSERT INTO `profesor` VALUES ('87', 'CN-39', 'PF. BASCO SIMONIDES', '4');
INSERT INTO `profesor` VALUES ('88', 'CN-42', 'SJ. GUTIERREZ ZARCO JAIR', '4');
INSERT INTO `profesor` VALUES ('89', 'CN-43', 'PF. MARTINEZ GONZALEZ JUAN CARLOS', '4');
INSERT INTO `profesor` VALUES ('90', 'CN-45', 'PF. JARAMILLO LUCAS', '4');
INSERT INTO `profesor` VALUES ('91', 'CN-46', 'PF. ARIAS JORGE', '4');
INSERT INTO `profesor` VALUES ('92', 'CN-47', 'TF. GONZALEZ BADRAN VICTOR', '4');
INSERT INTO `profesor` VALUES ('93', 'CN-48', 'SJ. ROLON HENRY', '4');
INSERT INTO `profesor` VALUES ('94', 'CN-49', 'CF.  GOMEZ FAJARDO FELIPE', '4');
INSERT INTO `profesor` VALUES ('95', 'CN-51', 'CF. PULGARIN LUIS HORACIO', '4');
INSERT INTO `profesor` VALUES ('96', 'CB-1', 'PF. MAZA GALOFRE RUBEN', '5');
INSERT INTO `profesor` VALUES ('97', 'CB-2', 'PF. MEDINA FORERO OSCAR', '5');
INSERT INTO `profesor` VALUES ('98', 'CB-3', 'PF. BLANCO EDGAR', '5');
INSERT INTO `profesor` VALUES ('99', 'CB-4', 'PF. BARRIOS ALFONSO', '5');
INSERT INTO `profesor` VALUES ('100', 'CB-5', 'PF. VITOLA MARENA', '5');
INSERT INTO `profesor` VALUES ('101', 'CB-6', 'PF. MERCADO JUAN', '5');
INSERT INTO `profesor` VALUES ('102', 'CB-7', 'PF. BELLO BORIS', '5');
INSERT INTO `profesor` VALUES ('103', 'CB-8', 'PF. MICHAEL GIRON', '5');
INSERT INTO `profesor` VALUES ('104', 'CB-9', 'PF. TORRES ANA MARIA', '5');
INSERT INTO `profesor` VALUES ('105', 'CB-10', 'PF. ACOSTA JUAN CARLOS', '5');
INSERT INTO `profesor` VALUES ('106', 'CB-11', 'PF. MARTINEZ BUENDIA JUAN MIGUEL', '5');
INSERT INTO `profesor` VALUES ('107', 'CB-12', 'PF. PINO JIMENEZ JORGE', '5');
INSERT INTO `profesor` VALUES ('108', 'CB-13', 'PF. COTTIZ NELSON MONTOYA', '5');
INSERT INTO `profesor` VALUES ('109', 'CB-14', 'PF. ARRIETA JULIO', '5');
INSERT INTO `profesor` VALUES ('110', 'CB-15', 'PF. GONZALEZ MANJARREZ HEIDI', '5');
INSERT INTO `profesor` VALUES ('111', 'CB-16', 'PF. LICONA EDGAR', '5');
INSERT INTO `profesor` VALUES ('112', 'CB-17', 'PF. TEJEDOR RONALD', '5');
INSERT INTO `profesor` VALUES ('113', 'CB-18', 'PF. MARRUGO CARDONA MANUEL SIXTO', '5');
INSERT INTO `profesor` VALUES ('114', 'CB-19', 'PF. DE LEON VILLALOBOS PEDRO', '5');
INSERT INTO `profesor` VALUES ('115', 'CB-20', 'PF. CABALLERO WILLIAM', '5');
INSERT INTO `profesor` VALUES ('116', 'CB-21', 'TN. PERDOMO DIANA', '5');
INSERT INTO `profesor` VALUES ('117', 'CB-22', 'PF. ADAMES PRADA ROSANA DEL PILAR', '5');
INSERT INTO `profesor` VALUES ('118', 'CS-1', 'PF. VILLALBA BARBOSA LISARDO', '1');
INSERT INTO `profesor` VALUES ('119', 'CS-2', 'PF. AHUMADA CLAUDIA', '1');
INSERT INTO `profesor` VALUES ('120', 'CS-3', 'PF. ORTIZ OMERIS', '1');
INSERT INTO `profesor` VALUES ('121', 'CS-4', 'PF. ALVEAR ADOLFO', '1');
INSERT INTO `profesor` VALUES ('122', 'CS-5', 'TN. ARROYAVE MANTILLA RAFAEL DAVID', '1');
INSERT INTO `profesor` VALUES ('123', 'CS-6', 'CP. CADENA WILSON', '1');
INSERT INTO `profesor` VALUES ('124', 'CS-7', 'PF. GONZALEZ VIRGILIO', '1');
INSERT INTO `profesor` VALUES ('125', 'CS-8', 'TK. SOLORZANO PINTO LEONARDO', '1');
INSERT INTO `profesor` VALUES ('126', 'CS-10', 'CT. DAZAS SANDOVAL OSCAR HERNAN', '1');
INSERT INTO `profesor` VALUES ('127', 'CS-11', 'PF. MOTTA AURA', '1');
INSERT INTO `profesor` VALUES ('128', 'CS-12', 'PF. HAYDAR JUDITH', '1');
INSERT INTO `profesor` VALUES ('129', 'CS-13', 'MY. USCATEGUI ACEVEDO RONALD FERNANDO', '1');
INSERT INTO `profesor` VALUES ('130', 'CS-14', 'PF. BARRIO HERNANDO', '1');
INSERT INTO `profesor` VALUES ('131', 'CS-15', 'PF. CONTRERAS MARLON', '1');
INSERT INTO `profesor` VALUES ('132', 'CS-16', 'PF. TEOFILO BOYANO OMAR', '1');
INSERT INTO `profesor` VALUES ('133', 'CS-17', 'CALIM. MARTINEZ OLMOS ANTONIO JOSE', '1');
INSERT INTO `profesor` VALUES ('134', 'CS-18', 'PF. DAZA FARID', '1');
INSERT INTO `profesor` VALUES ('135', 'CS-19', 'PF. GUZMAN MARIA MARGARITA', '1');
INSERT INTO `profesor` VALUES ('136', 'CS-20', 'TN. TOLOZA ELLIANA', '1');
INSERT INTO `profesor` VALUES ('137', 'CS-21', 'PF. MIRANDA CARMEN', '1');
INSERT INTO `profesor` VALUES ('138', 'CS-22', 'PF. GUTIERREZ EFRAIN', '1');
INSERT INTO `profesor` VALUES ('139', 'CS-23', 'TN. LOZANO GINA', '1');
INSERT INTO `profesor` VALUES ('140', 'CS-24', 'PF. HERNANDEZ INELSA', '1');
INSERT INTO `profesor` VALUES ('141', 'CS-25', 'PF. SALOM BENJAMIN', '1');
INSERT INTO `profesor` VALUES ('142', 'CS-26', 'CF. PAEZ CECILIA', '1');
INSERT INTO `profesor` VALUES ('143', 'CS-27', 'CF. SANCHEZ PIEDRAITA GLORIA', '1');
INSERT INTO `profesor` VALUES ('144', 'CS-28', 'PF. PASCUALES JOSE', '1');
INSERT INTO `profesor` VALUES ('145', 'CS-29', 'TN. SIERRA IBAÃ‘EZ LUISA JOANNE', '1');
INSERT INTO `profesor` VALUES ('146', 'CS-30', 'PF. MOUTHON PAOLA', '1');
INSERT INTO `profesor` VALUES ('147', 'IM-1', 'CT. CASTRO PARRA CRISTIAN', '6');
INSERT INTO `profesor` VALUES ('148', 'IM-2', 'CT. PEREZ ZAMORA OSCAR', '6');
INSERT INTO `profesor` VALUES ('149', 'IM-3', 'SP. MOSQUERA CUELLAR JEFFERSON', '6');
INSERT INTO `profesor` VALUES ('150', 'IM-4', 'SP. PERILLA MOSQUERA JHON', '6');
INSERT INTO `profesor` VALUES ('151', 'IM-5', 'TE. RIVERA TAPIAS JHON', '6');
INSERT INTO `profesor` VALUES ('152', 'IM-6', 'TE. TORRES BUENO YEISON', '6');
INSERT INTO `profesor` VALUES ('153', 'IM-7', 'SV. JULIO ARROYO LORGIO ANTONIO', '6');
INSERT INTO `profesor` VALUES ('154', 'IM-8', 'SV. HERAZO WALTER JOSE', '6');
INSERT INTO `profesor` VALUES ('155', 'IM-9', 'SV. QUIÃ‘ONEZ PADILLA DARIO', '6');
INSERT INTO `profesor` VALUES ('156', 'IM-10', 'PF. ORTEGA ALGUEDO ANTONIO', '6');
INSERT INTO `profesor` VALUES ('157', 'IM-11', 'TC. RODRIGUEZ PRIETO GERMAN ANDRES', '6');
INSERT INTO `profesor` VALUES ('158', 'IM-12', 'PF. TOVAR VARGAS JUAN MANUEL', '6');
INSERT INTO `profesor` VALUES ('159', 'IM-13', 'TECIM. FLOREZ HILDEBRANDO', '6');
INSERT INTO `profesor` VALUES ('160', 'IM-15', 'CT. USME OSCAR', '6');
INSERT INTO `profesor` VALUES ('161', 'IM-16', 'TE. BARRIOS WILSON', '6');
INSERT INTO `profesor` VALUES ('162', 'IM-17', 'CT. MUÃ‘OZ DONALDO', '6');
INSERT INTO `profesor` VALUES ('163', 'IM-18', 'MY. QUIJANO YOHANNY', '6');
INSERT INTO `profesor` VALUES ('164', 'IM-19', 'PF. ROJAS RODRIGUEZ ANGEL', '6');
INSERT INTO `profesor` VALUES ('165', 'IM-20', 'MY. LLANOS RENDON JHON FREDY', '6');
INSERT INTO `profesor` VALUES ('166', 'IM-21', 'SV. CAEDONA QUICENO JHON', '6');
INSERT INTO `profesor` VALUES ('167', 'IM-22', 'TF. RODRIGUEZ TORRES JAVIER ENRIQUE', '6');
INSERT INTO `profesor` VALUES ('168', 'IM-23', 'TE. PATERNINA MIROÃ‘A OSCAR JAVIER', '6');
INSERT INTO `profesor` VALUES ('169', 'IM-24', 'PF. PINZON MORA EDWIN FERNEY', '6');
INSERT INTO `profesor` VALUES ('170', 'IM-25', 'S3. BERTEL ALVIS ARNOVIS', '6');
INSERT INTO `profesor` VALUES ('171', 'IM-26', 'SS. LARA GOMEZ JOSE LUIS', '6');
INSERT INTO `profesor` VALUES ('172', 'IM-27', 'CP. SATIZABAL HANNER', '6');
INSERT INTO `profesor` VALUES ('173', 'IM-28', 'C3. MARTINEZ ILIAS JAIR JOSE', '6');
INSERT INTO `profesor` VALUES ('174', 'OF-2', 'CC. PLAZA MORENO JOSE MANUEL', '7');
INSERT INTO `profesor` VALUES ('175', 'OF-3', 'PF. CABARCAS ANGELICA', '7');
INSERT INTO `profesor` VALUES ('176', 'OF-4', 'PF. PAYARES JOSE LUIS', '7');
INSERT INTO `profesor` VALUES ('177', 'OF-5', 'PF. URBANO LA TORRE CLAUDIA', '7');
INSERT INTO `profesor` VALUES ('178', 'OF-6', 'PF. MAYO GISELA', '7');
INSERT INTO `profesor` VALUES ('179', 'OF-7', 'PF. BENITO BARRERA NELSON', '7');
INSERT INTO `profesor` VALUES ('180', 'OF-8', 'PF. ORTIZ JUAN CARLOS', '7');
INSERT INTO `profesor` VALUES ('181', 'OF-9', 'PF. DAGUA CLAUDIA', '7');
INSERT INTO `profesor` VALUES ('182', 'OF-10', 'PF. ESTRADA BUSTAMANTE HERNAN', '7');
INSERT INTO `profesor` VALUES ('183', 'OF-11', 'CF. MURILLO NELSON', '7');
INSERT INTO `profesor` VALUES ('184', 'OF-12', 'PF. PUELLO ADRIANA', '7');
INSERT INTO `profesor` VALUES ('185', 'OF-13', 'PF. LONIN SERGUEI', '7');
INSERT INTO `profesor` VALUES ('186', 'OF-14', 'PF. DEVIS ANDREA', '7');
INSERT INTO `profesor` VALUES ('187', 'OF-15', 'PF. CARMONA HENRY', '7');
INSERT INTO `profesor` VALUES ('188', 'OF- 16', 'PF. TOUS GUSTAVO', '7');
INSERT INTO `profesor` VALUES ('189', 'OF-17', 'PF. PLATZ CAMILO', '7');
INSERT INTO `profesor` VALUES ('190', 'OF-18', 'CF. TORRES PARRA RICARDO RAFAEL', '7');
INSERT INTO `profesor` VALUES ('191', 'OF-19', 'TF. GRISALES CESAR', '7');
INSERT INTO `profesor` VALUES ('192', 'OF-20 ', 'TF. OTALORA NATALIA', '7');
INSERT INTO `profesor` VALUES ('193', 'D-1', 'ESTUDIO', '8');
INSERT INTO `profesor` VALUES ('194', 'D-2', 'LIBRE', '8');

-- ----------------------------
-- Table structure for responsable_curso
-- ----------------------------
DROP TABLE IF EXISTS `responsable_curso`;
CREATE TABLE `responsable_curso` (
  `idresponsable_curso` int(11) NOT NULL AUTO_INCREMENT,
  `curso_idcurso` int(11) NOT NULL,
  `usuario_usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`idresponsable_curso`),
  KEY `fk_responsable_curso_curso1_idx` (`curso_idcurso`),
  KEY `fk_responsable_curso_usuario1_idx` (`usuario_usuario`),
  CONSTRAINT `fk_responsable_curso_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_responsable_curso_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of responsable_curso
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Administrador');

-- ----------------------------
-- Table structure for rol_has_permisos
-- ----------------------------
DROP TABLE IF EXISTS `rol_has_permisos`;
CREATE TABLE `rol_has_permisos` (
  `rol_codigo` int(11) NOT NULL,
  `permisos_idpermisos` int(11) NOT NULL,
  PRIMARY KEY (`rol_codigo`,`permisos_idpermisos`),
  KEY `fk_rol_has_permisos_permisos1_idx` (`permisos_idpermisos`),
  KEY `fk_rol_has_permisos_rol1_idx` (`rol_codigo`),
  CONSTRAINT `fk_rol_has_permisos_permisos1` FOREIGN KEY (`permisos_idpermisos`) REFERENCES `permisos` (`idpermisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_permisos_rol1` FOREIGN KEY (`rol_codigo`) REFERENCES `rol` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol_has_permisos
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usuario` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `rol_codigo` int(11) NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_usuario_rol1_idx` (`rol_codigo`),
  CONSTRAINT `fk_usuario_rol1` FOREIGN KEY (`rol_codigo`) REFERENCES `rol` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('oscar7685', 'Oscar', 'Ballestero', '123456', 'Activo', '1');
