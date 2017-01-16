/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : naval

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2017-01-16 11:03:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividad_docencia
-- ----------------------------
DROP TABLE IF EXISTS `actividad_docencia`;
CREATE TABLE `actividad_docencia` (
  `idactividad_docencia` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `asignatura_idasignatura` int(11) NOT NULL,
  `curso_idcurso` int(11) NOT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idactividad_docencia`),
  KEY `fk_actividad_docencia_asignatura1_idx` (`asignatura_idasignatura`),
  KEY `fk_actividad_docencia_curso1_idx` (`curso_idcurso`),
  KEY `fk_actividad_docencia_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_actividad_docencia_asignatura1` FOREIGN KEY (`asignatura_idasignatura`) REFERENCES `asignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_docencia_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_docencia_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividad_docencia
-- ----------------------------

-- ----------------------------
-- Table structure for actividad_extension
-- ----------------------------
DROP TABLE IF EXISTS `actividad_extension`;
CREATE TABLE `actividad_extension` (
  `idactividad_extension` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `actividad` varchar(2000) DEFAULT NULL,
  `responsabilidad` varchar(2000) DEFAULT NULL,
  `programa o beneficiario` varchar(2000) DEFAULT NULL,
  `horas_prog` int(11) DEFAULT NULL,
  `horas_ejec` int(11) DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idactividad_extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividad_extension
-- ----------------------------

-- ----------------------------
-- Table structure for actividad_investigacion
-- ----------------------------
DROP TABLE IF EXISTS `actividad_investigacion`;
CREATE TABLE `actividad_investigacion` (
  `idactividad_investigacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `id_proyecto` varchar(255) DEFAULT NULL,
  `responsabilidad` varchar(2000) DEFAULT NULL,
  `horas_semanales` varchar(45) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idactividad_investigacion`),
  KEY `fk_actividad_investigacion_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_actividad_investigacion_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividad_investigacion
-- ----------------------------

-- ----------------------------
-- Table structure for administracion_academica
-- ----------------------------
DROP TABLE IF EXISTS `administracion_academica`;
CREATE TABLE `administracion_academica` (
  `idadministracion_academica` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_administrativo` varchar(255) DEFAULT NULL,
  `actividades_administrativas` varchar(2000) DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idadministracion_academica`),
  KEY `fk_administracion_academica_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_administracion_academica_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administracion_academica
-- ----------------------------

-- ----------------------------
-- Table structure for asignatura
-- ----------------------------
DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE `asignatura` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `ubicacion` int(11) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  PRIMARY KEY (`idasignatura`),
  KEY `fk_asignatura_programa1_idx` (`programa_idprograma`),
  CONSTRAINT `fk_asignatura_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignatura
-- ----------------------------
INSERT INTO `asignatura` VALUES ('1', 'ORIENTACIÓN NAVAL', 'ON1', '1', '1', null, '2');
INSERT INTO `asignatura` VALUES ('2', 'MARINERÍA', 'MA1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('3', 'COMUNICACIONES BÁSICAS', 'CB1', '1', '1', null, '2');
INSERT INTO `asignatura` VALUES ('4', 'FUNDAMENTOS DE SISTEMAS DE ARMAS', 'FSA1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('5', 'FUNDAMENTOS DE MATEMÁTICAS', 'FM1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('6', 'NAVEGACIÓN COSTERA', 'NC2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('7', 'NOCIONES DE TÁCTICA', 'NT2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('8', 'CÁLCULO DIFERENCIAL', 'CD2', '4', '2', null, '2');
INSERT INTO `asignatura` VALUES ('9', 'ALGEBRA LINEAL', 'AL2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('10', 'INFORMÁTICA', 'IN2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('12', 'CÁLCULO INTEGRAL', 'CI3', '4', '3', null, '2');
INSERT INTO `asignatura` VALUES ('13', 'ESTADISTICA DESCRIPTIVA Y PROBABILIDAD', 'EDP3', '3', '3', null, '2');
INSERT INTO `asignatura` VALUES ('14', 'FISICA MECANICA - LABORATORIO', 'FML3', '4', '3', null, '2');
INSERT INTO `asignatura` VALUES ('15', 'DERECHO PENAL MILITAR', 'DPM3', '1', '3', null, '2');
INSERT INTO `asignatura` VALUES ('16', 'INVESTIGACIÓN FORMATIVA I', 'IF1', '1', '3', null, '2');
INSERT INTO `asignatura` VALUES ('17', 'IDIOMAS II', 'ID2', '2', '3', null, '2');
INSERT INTO `asignatura` VALUES ('18', 'DERECHO DEL MAR Y FLUVIAL', 'DMF2', '2', '3', null, '2');
INSERT INTO `asignatura` VALUES ('19', 'DERECHO CONSTITUCIONAL', 'DC1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('20', 'DERECHOS HUMANOS Y DERECHO INTERNACIONAL', 'DHDI1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('21', 'FUNDAMENTOS DE LIDERAZGO', 'FL1', '1', '1', null, '2');
INSERT INTO `asignatura` VALUES ('22', 'ÉTICA BÁSICA', 'EB1', '1', '1', null, '2');
INSERT INTO `asignatura` VALUES ('23', 'ARMAMENTO IM I', 'AIM1', '2', '1', null, '2');
INSERT INTO `asignatura` VALUES ('24', 'HISTORIA NAVAL', 'HN2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('25', 'TÉCNICAS DE EXPRESIÓN ORAL Y ESCRITA', 'TEO2', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('26', 'IDIOMAS I', 'ID1', '2', '2', null, '2');
INSERT INTO `asignatura` VALUES ('27', 'OPERACIONES FLUVIALES', 'OF2', '1', '2', null, '2');
INSERT INTO `asignatura` VALUES ('28', 'PRINCIPIOS DE CONTABILIDAD', 'PC3', '2', '3', null, '2');
INSERT INTO `asignatura` VALUES ('29', 'SISTEMAS DE ARMAS SENSORICAS', 'SAS4', '2', '4', null, '2');
INSERT INTO `asignatura` VALUES ('30', 'ESTADISTICA INFERENCIAL', 'EI4', '3', '4', null, '2');
INSERT INTO `asignatura` VALUES ('31', 'INVESTIGACIÓN FORMATICA II', 'IF4', '1', '4', null, '2');
INSERT INTO `asignatura` VALUES ('32', 'IDIOMAS III', 'ID4', '2', '4', null, '2');
INSERT INTO `asignatura` VALUES ('33', 'OCEANOGRAFÍA GENERAL', 'OG4', '1', '4', null, '2');
INSERT INTO `asignatura` VALUES ('34', 'PROCESOS ADMINISTRATIVOS', 'PA4', '2', '4', null, '2');
INSERT INTO `asignatura` VALUES ('35', 'SISTEMAS DE ARMAS ELECTRÓNICAS', 'SAE4', '2', '5', null, '2');
INSERT INTO `asignatura` VALUES ('36', 'INVESTIGACIÓN FORMATIVA III', 'IF5', '2', '5', null, '2');
INSERT INTO `asignatura` VALUES ('37', 'IDIOMAS IV', 'ID5', '2', '5', null, '2');
INSERT INTO `asignatura` VALUES ('38', 'FUNDAMENTO DE MOTORES', 'FM5', '1', '5', null, '2');
INSERT INTO `asignatura` VALUES ('39', 'OPTATIVA I', 'OP1', '2', '5', null, '2');
INSERT INTO `asignatura` VALUES ('40', 'OPTATIVA II', 'OP2', '2', '5', null, '2');
INSERT INTO `asignatura` VALUES ('41', 'COMUNICACIONES ELECTROMAGNÉTICAS', 'CE6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('42', 'MANIOBRAS', 'MA6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('43', 'NAVEGACIÓN ASTRONÓMICA', 'NA6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('44', 'NAVEGACIÓN ELECTRÓNICA', 'NE6', '3', '6', null, '2');
INSERT INTO `asignatura` VALUES ('45', 'ÉTICA PROFESIONAL', 'EP6', '1', '6', null, '2');
INSERT INTO `asignatura` VALUES ('46', 'INTELIGENCIA BÁSICA, CONTRAINTELIGENCIA Y SEGURIDAD MILITAR', 'IBCSM6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('47', 'CONTROL DE AVERIAS Y PRACTICAS', 'CAP6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('48', 'MAQUINARIA NAVAL', 'MN6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('49', 'METEOROLOGÍA GENERAL', 'MG6', '1', '6', null, '2');
INSERT INTO `asignatura` VALUES ('50', 'LOGÍSTICA GENERAL', 'LG6', '2', '6', null, '2');
INSERT INTO `asignatura` VALUES ('51', 'TÁCTICA NAVAL I', 'TN1', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('52', 'TÁCTICA NAVAL II', 'TN2', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('53', 'IDIOMAS V', 'ID7', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('54', 'FUNDAMENTOS DE ESTABILIDAD', 'FE7', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('55', 'REGIMEN FISCAL Y CONTROL INTERNO', 'RFCI', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('56', 'OPTATIVA III', 'OP3', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('57', 'OPTATIVA IV', 'OP4', '2', '7', null, '2');
INSERT INTO `asignatura` VALUES ('58', 'OPERACIONES NAVALES', 'OP8', '1', '8', null, '2');
INSERT INTO `asignatura` VALUES ('59', 'PROCEDIMIENTOS DISCIPLINARIOS Y ADMINISTRATIVOS', 'PDA', '1', '8', null, '2');
INSERT INTO `asignatura` VALUES ('60', 'IDIOMAS VI', 'ID6', '2', '8', null, '2');
INSERT INTO `asignatura` VALUES ('61', 'LIDERAZGO MILITAR', 'LM', '1', '8', null, '2');
INSERT INTO `asignatura` VALUES ('62', 'ACCIÓN INTEGRAL', 'AI', '2', '8', null, '2');
INSERT INTO `asignatura` VALUES ('63', 'PRESUPUESTO Y TESORERÍA', 'PT', '2', '8', null, '2');
INSERT INTO `asignatura` VALUES ('64', 'OPTATIVA V', 'OP5', '3', '8', null, '2');

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
  `piso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idaula`),
  KEY `fk_aula_edificio_idx` (`edificio_idedificio`),
  CONSTRAINT `fk_aula_edificio` FOREIGN KEY (`edificio_idedificio`) REFERENCES `edificio` (`idedificio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO `aula` VALUES ('1', '1', 'Aula', '21', 'Activa', '0', '1', '1', '0', '1', '1');
INSERT INTO `aula` VALUES ('2', '2', 'Aula', '24', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('3', '3', 'Aula', '7', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('4', '4', 'Aula', '17', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('5', '5', 'Aula', '13', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('6', '6', 'Aula', '13', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('7', '7', 'Aula', '20', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('8', '8', 'Aula', '15', 'Activa', '0', '1', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('9', '9', 'Aula', '22', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('10', '10', 'Aula', '23', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('11', '11', 'Aula', '25', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('12', '12', 'Aula', '25', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('13', '13', 'Aula', '23', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('14', '14', 'Aula', '14', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('15', '15', 'Aula', '16', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('16', '16', 'Aula', '16', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('17', '17', 'Aula', '22', 'Activa', '0', '2', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('18', '18', 'Aula', '20', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('19', '19', 'Aula', '23', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('20', '20', 'Aula', '20', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('21', '21', 'Aula', '23', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('22', '22', 'Aula', '15', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('23', '23', 'Aula', '12', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('24', '24', 'Aula', '21', 'Activa', '0', '3', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('25', 'C-02', 'Aula', '17', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('26', 'C-03', 'Aula', '17', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('27', 'C-04', 'Aula', '16', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('28', 'C-05', 'Aula', '22', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('29', 'C-06', 'Aula', '23', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('30', 'C-07', 'Aula', '28', 'Activa', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('31', 'C-08', 'Aula', '0', 'Inactiva', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('32', 'C-09', 'Aula', '0', 'Inactiva', '0', '4', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('33', 'A. ING NAVAL', 'Aula', '10', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('34', 'LAB. COMUNICACIONES', 'Aula', '5', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('35', 'CCPIN', 'Aula', '8', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('36', 'A. MAESTRIA ING', 'Aula', '24', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('37', 'A. SIG', 'Aula', '12', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('38', 'A. CRISIS', 'Aula', '29', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('39', 'A. 209', 'Aula', '7', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('40', 'A. 208', 'Aula', '7', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('41', 'LAB. LOGISTICA', 'Aula', '10', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('42', 'A. 206', 'Aula', '12', 'Activa', '0', '5', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('43', 'A. ROJA', 'Aula', '0', 'Inactiva', '0', '6', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('44', 'A. AZUL', 'Aula', '21', 'Activa', '0', '6', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('45', 'A. TACTICA', 'Aula', '32', 'Activa', '0', '7', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('46', 'A. NAVEGACION', 'Aula', '29', 'Activa', '0', '7', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('47', 'A. ARQUITECTURA NAVAL', 'Aula', '0', 'Inactiva', '0', '8', '0', '0', '0', '1');
INSERT INTO `aula` VALUES ('48', 'LAB. ELECTRICIDAD', 'Aula', '0', 'Inactiva', '0', '8', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for curso
-- ----------------------------
DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `codigo` varchar(45) NOT NULL,
  `aula_idaula` int(11) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `comandante` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_curso_aula1_idx` (`aula_idaula`),
  KEY `fk_curso_programa1_idx` (`programa_idprograma`),
  CONSTRAINT `fk_curso_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('1', '2017', '1', 'IN1', '1', '2', null);
INSERT INTO `curso` VALUES ('2', '2017', '1', 'CCPCN', '40', '2', '28');

-- ----------------------------
-- Table structure for curso_has_estudiante
-- ----------------------------
DROP TABLE IF EXISTS `curso_has_estudiante`;
CREATE TABLE `curso_has_estudiante` (
  `curso_idcurso` int(11) NOT NULL,
  `estudiante_codigo` int(11) NOT NULL,
  PRIMARY KEY (`curso_idcurso`,`estudiante_codigo`),
  KEY `fk_curso_has_estudiante_estudiante1_idx` (`estudiante_codigo`),
  KEY `fk_curso_has_estudiante_curso1_idx` (`curso_idcurso`),
  CONSTRAINT `fk_curso_has_estudiante_curso1` FOREIGN KEY (`curso_idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_estudiante_estudiante1` FOREIGN KEY (`estudiante_codigo`) REFERENCES `estudiante` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curso_has_estudiante
-- ----------------------------
INSERT INTO `curso_has_estudiante` VALUES ('1', '1');
INSERT INTO `curso_has_estudiante` VALUES ('2', '2');
INSERT INTO `curso_has_estudiante` VALUES ('2', '3');
INSERT INTO `curso_has_estudiante` VALUES ('2', '5');
INSERT INTO `curso_has_estudiante` VALUES ('2', '6');
INSERT INTO `curso_has_estudiante` VALUES ('2', '10');
INSERT INTO `curso_has_estudiante` VALUES ('2', '23');
INSERT INTO `curso_has_estudiante` VALUES ('2', '24');
INSERT INTO `curso_has_estudiante` VALUES ('2', '25');
INSERT INTO `curso_has_estudiante` VALUES ('2', '26');
INSERT INTO `curso_has_estudiante` VALUES ('2', '27');
INSERT INTO `curso_has_estudiante` VALUES ('2', '28');

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
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudiante
-- ----------------------------
INSERT INTO `estudiante` VALUES ('1', 'JUAN', 'PEREZ MARTINEZ');
INSERT INTO `estudiante` VALUES ('2', 'EDGAR ORLANDO', 'HERRERA BORRAEZ');
INSERT INTO `estudiante` VALUES ('3', 'SERGIO KERMIT', 'JACKSON TESSIER');
INSERT INTO `estudiante` VALUES ('4', 'RAFAEL ANDRES', 'SALCEDO BARRETO');
INSERT INTO `estudiante` VALUES ('5', 'FRANCISCO JAVIER', 'SCHOLBORGH QUINTERO');
INSERT INTO `estudiante` VALUES ('6', 'SALOMON', 'UEJBE  LOPEZ');
INSERT INTO `estudiante` VALUES ('7', 'ELKIN DAVID', 'TORRES VENERA');
INSERT INTO `estudiante` VALUES ('8', 'KEVIN DANIEL', 'MARTINEZ ACEVEDO');
INSERT INTO `estudiante` VALUES ('9', 'NEDER MIGUEL', 'LEON GONZALEZ');
INSERT INTO `estudiante` VALUES ('10', 'CRISTIAN', 'JIMÉNEZ CARABALLO');
INSERT INTO `estudiante` VALUES ('11', 'KEVEN JOEL', 'JARABA BAZA');
INSERT INTO `estudiante` VALUES ('12', 'JOSE GREGORIO', 'HERNANDEZ ARIAS');
INSERT INTO `estudiante` VALUES ('13', 'MIGUEL ANGEL', 'PEREZ ORTEGA');
INSERT INTO `estudiante` VALUES ('14', 'SEBASTIAN', 'PERALTA OLIVERA');
INSERT INTO `estudiante` VALUES ('15', 'RONALD', 'PATERNINA CASTRO');
INSERT INTO `estudiante` VALUES ('16', 'CARLOS MANUEL', 'GUTIERREZ PEREIRA');
INSERT INTO `estudiante` VALUES ('17', 'EDWIN ALBERTO', 'GUERRERO ACOSTA');
INSERT INTO `estudiante` VALUES ('18', 'ANTONIO CARLOS', 'GIL PARRA');
INSERT INTO `estudiante` VALUES ('19', 'SIXTO MANUEL', 'FIGUEROA REYES');
INSERT INTO `estudiante` VALUES ('20', 'MARIA ISABEL', 'FAWCETT SALCEDO');
INSERT INTO `estudiante` VALUES ('21', 'VALERIA DEL CARMEN', 'DEL CAMPO MUÑOZ');
INSERT INTO `estudiante` VALUES ('22', 'ELOY JOSE', 'BANQUET VASQUEZ');
INSERT INTO `estudiante` VALUES ('23', 'DANIEL DAVID', 'YEPES GONZALEZ');
INSERT INTO `estudiante` VALUES ('24', 'RAFAEL ENRIQUE', 'BUELVAS ZÚÑIGA');
INSERT INTO `estudiante` VALUES ('25', 'ANDRES IVAN', 'MARTINEZ PADILLA');
INSERT INTO `estudiante` VALUES ('26', 'DIANA PATRICIA', 'PADILLA TORRES');
INSERT INTO `estudiante` VALUES ('27', 'CARLOS', 'CASTELLAR BARRETO');
INSERT INTO `estudiante` VALUES ('28', 'ARTURO', 'GONZALEZ VILLAMIZAR');

-- ----------------------------
-- Table structure for estudios_realizados_docente
-- ----------------------------
DROP TABLE IF EXISTS `estudios_realizados_docente`;
CREATE TABLE `estudios_realizados_docente` (
  `idestudios_realizados_docente` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `institucion_otorga` varchar(255) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idestudios_realizados_docente`),
  KEY `fk_estudios_realizados_docente_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_estudios_realizados_docente_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudios_realizados_docente
-- ----------------------------

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
-- Table structure for graduado
-- ----------------------------
DROP TABLE IF EXISTS `graduado`;
CREATE TABLE `graduado` (
  `idgraduado` int(11) NOT NULL,
  `primer_nombre` varchar(45) DEFAULT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `tipo_id` varchar(45) DEFAULT NULL,
  `numero_id` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `fecha_grado` date DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `empresa_donde_labora` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgraduado`),
  KEY `fk_graduado_programa1_idx` (`programa_idprograma`),
  CONSTRAINT `fk_graduado_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graduado
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of horario
-- ----------------------------

-- ----------------------------
-- Table structure for mantenimiento
-- ----------------------------
DROP TABLE IF EXISTS `mantenimiento`;
CREATE TABLE `mantenimiento` (
  `idmantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `aula_idaula` int(11) NOT NULL,
  `trabajador` varchar(255) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `fuera_servicio` tinyint(1) DEFAULT NULL,
  `aprobado_por` varchar(255) DEFAULT NULL,
  `solicitud_idsolicitud` int(11) DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idmantenimiento`),
  KEY `fk_mantenimiento_aula1_idx` (`aula_idaula`),
  KEY `fk_mantenimiento_usuario2_idx` (`trabajador`),
  KEY `fk_mantenimiento_usuario3_idx` (`aprobado_por`),
  KEY `fk_mantenimiento_solicitud1_idx` (`solicitud_idsolicitud`),
  CONSTRAINT `fk_mantenimiento_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_solicitud1` FOREIGN KEY (`solicitud_idsolicitud`) REFERENCES `solicitud` (`idsolicitud`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_usuario2` FOREIGN KEY (`trabajador`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mantenimiento_usuario3` FOREIGN KEY (`aprobado_por`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mantenimiento
-- ----------------------------
INSERT INTO `mantenimiento` VALUES ('1', '2016-01-06 11:30:00', '2016-01-07 11:30:10', 'Un mantenimiento preventivo1', 'preventivo', '1', null, null, null, null, null, null);
INSERT INTO `mantenimiento` VALUES ('2', '2016-01-06 13:30:00', '2016-01-06 16:00:00', 'Un mantenimiento preventivo2', 'preventivo', '2', null, null, null, null, null, null);

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
-- Table structure for notificacion
-- ----------------------------
DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `idnotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `usuario_realizador` varchar(255) NOT NULL,
  PRIMARY KEY (`idnotificacion`),
  KEY `fk_notificacion_usuario1_idx` (`usuario_realizador`),
  CONSTRAINT `fk_notificacion_usuario1` FOREIGN KEY (`usuario_realizador`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notificacion
-- ----------------------------

-- ----------------------------
-- Table structure for notificacion_has_usuario
-- ----------------------------
DROP TABLE IF EXISTS `notificacion_has_usuario`;
CREATE TABLE `notificacion_has_usuario` (
  `notificacion_idnotificacion` int(11) NOT NULL,
  `usuario_lector` varchar(255) NOT NULL,
  PRIMARY KEY (`notificacion_idnotificacion`,`usuario_lector`),
  KEY `fk_notificacion_has_usuario_usuario1_idx` (`usuario_lector`),
  KEY `fk_notificacion_has_usuario_notificacion1_idx` (`notificacion_idnotificacion`),
  CONSTRAINT `fk_notificacion_has_usuario_notificacion1` FOREIGN KEY (`notificacion_idnotificacion`) REFERENCES `notificacion` (`idnotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notificacion_has_usuario_usuario1` FOREIGN KEY (`usuario_lector`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notificacion_has_usuario
-- ----------------------------

-- ----------------------------
-- Table structure for observaciones_generales
-- ----------------------------
DROP TABLE IF EXISTS `observaciones_generales`;
CREATE TABLE `observaciones_generales` (
  `idobservaciones_generales` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `observaciones` varchar(2500) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idobservaciones_generales`),
  KEY `fk_observaciones_generales_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_observaciones_generales_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of observaciones_generales
-- ----------------------------

-- ----------------------------
-- Table structure for otras_actividades
-- ----------------------------
DROP TABLE IF EXISTS `otras_actividades`;
CREATE TABLE `otras_actividades` (
  `idotras_actividades` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `id_actividad` varchar(255) DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idotras_actividades`),
  KEY `fk_otras_actividades_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_otras_actividades_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of otras_actividades
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
INSERT INTO `permisos` VALUES ('1', 'Listar Aulas');
INSERT INTO `permisos` VALUES ('2', 'Listar Edificios');
INSERT INTO `permisos` VALUES ('3', 'Listar Profesores');
INSERT INTO `permisos` VALUES ('4', 'Listar Cursos');
INSERT INTO `permisos` VALUES ('5', 'Listar Horarios');
INSERT INTO `permisos` VALUES ('6', 'Listar Mantenimientos');
INSERT INTO `permisos` VALUES ('7', 'Listar Usuarios');
INSERT INTO `permisos` VALUES ('8', 'Listar Roles');
INSERT INTO `permisos` VALUES ('9', 'Crear Aulas');
INSERT INTO `permisos` VALUES ('10', 'Crear Edificios');
INSERT INTO `permisos` VALUES ('11', 'Crear Profesores');
INSERT INTO `permisos` VALUES ('12', 'Crear Cursos');
INSERT INTO `permisos` VALUES ('13', 'Crear Horarios');
INSERT INTO `permisos` VALUES ('14', 'Crear Mantenimientos');
INSERT INTO `permisos` VALUES ('15', 'Crear Usuarios');
INSERT INTO `permisos` VALUES ('16', 'Crear Roles');
INSERT INTO `permisos` VALUES ('17', 'Editar Aulas');
INSERT INTO `permisos` VALUES ('18', 'Editar Edificios');
INSERT INTO `permisos` VALUES ('19', 'Editar Profesores');
INSERT INTO `permisos` VALUES ('20', 'Editar Cursos');
INSERT INTO `permisos` VALUES ('21', 'Editar Horarios');
INSERT INTO `permisos` VALUES ('22', 'Editar Mantenimientos');
INSERT INTO `permisos` VALUES ('23', 'Editar Usuarios');
INSERT INTO `permisos` VALUES ('24', 'Editar Roles');
INSERT INTO `permisos` VALUES ('25', 'Listar Facultades');
INSERT INTO `permisos` VALUES ('26', 'Crear Facultades');
INSERT INTO `permisos` VALUES ('27', 'Editar Facultades');
INSERT INTO `permisos` VALUES ('28', 'Listar Programas');
INSERT INTO `permisos` VALUES ('29', 'Crear Programas');
INSERT INTO `permisos` VALUES ('30', 'Editar Programas');
INSERT INTO `permisos` VALUES ('31', 'Listar Asignaturas');
INSERT INTO `permisos` VALUES ('32', 'Crear Asignaturas');
INSERT INTO `permisos` VALUES ('33', 'Editar Asignaturas');
INSERT INTO `permisos` VALUES ('34', 'Listar Estudiantes');
INSERT INTO `permisos` VALUES ('35', 'Crear Estudiantes');
INSERT INTO `permisos` VALUES ('36', 'Editar Estudiantes');

-- ----------------------------
-- Table structure for profesor
-- ----------------------------
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `tipo_id` varchar(45) NOT NULL,
  `numero_id` varchar(45) DEFAULT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo apellido` varchar(45) DEFAULT NULL,
  `nivel_max_formacion` varchar(45) DEFAULT NULL,
  `fecha_ingreso` varchar(45) DEFAULT NULL,
  `grado` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `dedicacion_docente` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `tipo_contrato` varchar(45) DEFAULT NULL,
  `duracion_horas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprofesor`),
  KEY `fk_profesor_facultad1_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_profesor_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profesor
-- ----------------------------

-- ----------------------------
-- Table structure for profesor_h
-- ----------------------------
DROP TABLE IF EXISTS `profesor_h`;
CREATE TABLE `profesor_h` (
  `idprofesor_h` int(11) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `grado` varchar(45) DEFAULT NULL,
  `dedicacion_docente` varchar(45) DEFAULT NULL,
  `tipo_contrato` varchar(45) DEFAULT NULL,
  `duracion_horas` varchar(45) DEFAULT NULL,
  `nivel_max_formacion` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  `porcentaje_docencia` int(11) DEFAULT NULL,
  `porcentaje_investigacion` int(11) DEFAULT NULL,
  `porcentaje_administrativo` int(11) DEFAULT NULL,
  `porcentaje_bienestar_estudiantil` int(11) DEFAULT NULL,
  `porcentaje_edu_no_formal_continua` int(11) DEFAULT NULL,
  `porcentaje_ppextension_norem` int(11) DEFAULT NULL,
  `porcentaje_ppextension_remu` int(11) DEFAULT NULL,
  `porcentaje_otras_actividades` int(11) DEFAULT NULL,
  `num_libros_publicados` int(11) DEFAULT NULL,
  `num_textos_publicados` int(11) DEFAULT NULL,
  `num_textos_calif_colciencias` int(11) DEFAULT NULL,
  `num_reportes_investigacion` int(11) DEFAULT NULL,
  `num_patentes` int(11) DEFAULT NULL,
  `premios_nivel_nacional` int(11) DEFAULT NULL,
  `premios_nivel_internacional` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprofesor_h`),
  KEY `fk_profesor_h_facultad1_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_profesor_h_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profesor_h
-- ----------------------------

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `idprograma` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `nivel_formacion` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`),
  KEY `fk_programa_facultad1_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_programa_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('1', 'OCEANOGRAFÍA FÍSICA', 'Presencial', 'Universitaria', '7');
INSERT INTO `programa` VALUES ('2', 'CIENCIAS NAVALES PARA OFICIALES NAVALES', 'Presencial', 'Universitaria', '4');

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Administrador');
INSERT INTO `rol` VALUES ('2', 'SAC');
INSERT INTO `rol` VALUES ('3', 'Mirón');

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
INSERT INTO `rol_has_permisos` VALUES ('1', '1');
INSERT INTO `rol_has_permisos` VALUES ('2', '1');
INSERT INTO `rol_has_permisos` VALUES ('3', '1');
INSERT INTO `rol_has_permisos` VALUES ('1', '2');
INSERT INTO `rol_has_permisos` VALUES ('2', '2');
INSERT INTO `rol_has_permisos` VALUES ('3', '2');
INSERT INTO `rol_has_permisos` VALUES ('1', '3');
INSERT INTO `rol_has_permisos` VALUES ('3', '3');
INSERT INTO `rol_has_permisos` VALUES ('1', '4');
INSERT INTO `rol_has_permisos` VALUES ('2', '4');
INSERT INTO `rol_has_permisos` VALUES ('3', '4');
INSERT INTO `rol_has_permisos` VALUES ('1', '5');
INSERT INTO `rol_has_permisos` VALUES ('2', '5');
INSERT INTO `rol_has_permisos` VALUES ('3', '5');
INSERT INTO `rol_has_permisos` VALUES ('1', '6');
INSERT INTO `rol_has_permisos` VALUES ('3', '6');
INSERT INTO `rol_has_permisos` VALUES ('1', '7');
INSERT INTO `rol_has_permisos` VALUES ('3', '7');
INSERT INTO `rol_has_permisos` VALUES ('1', '8');
INSERT INTO `rol_has_permisos` VALUES ('3', '8');
INSERT INTO `rol_has_permisos` VALUES ('1', '9');
INSERT INTO `rol_has_permisos` VALUES ('1', '10');
INSERT INTO `rol_has_permisos` VALUES ('1', '11');
INSERT INTO `rol_has_permisos` VALUES ('1', '12');
INSERT INTO `rol_has_permisos` VALUES ('1', '13');
INSERT INTO `rol_has_permisos` VALUES ('1', '14');
INSERT INTO `rol_has_permisos` VALUES ('1', '15');
INSERT INTO `rol_has_permisos` VALUES ('1', '16');
INSERT INTO `rol_has_permisos` VALUES ('1', '17');
INSERT INTO `rol_has_permisos` VALUES ('1', '18');
INSERT INTO `rol_has_permisos` VALUES ('1', '19');
INSERT INTO `rol_has_permisos` VALUES ('1', '20');
INSERT INTO `rol_has_permisos` VALUES ('1', '21');
INSERT INTO `rol_has_permisos` VALUES ('1', '22');
INSERT INTO `rol_has_permisos` VALUES ('1', '23');
INSERT INTO `rol_has_permisos` VALUES ('1', '24');
INSERT INTO `rol_has_permisos` VALUES ('1', '25');
INSERT INTO `rol_has_permisos` VALUES ('2', '25');
INSERT INTO `rol_has_permisos` VALUES ('1', '26');
INSERT INTO `rol_has_permisos` VALUES ('1', '27');
INSERT INTO `rol_has_permisos` VALUES ('1', '28');
INSERT INTO `rol_has_permisos` VALUES ('1', '29');
INSERT INTO `rol_has_permisos` VALUES ('1', '30');
INSERT INTO `rol_has_permisos` VALUES ('1', '31');
INSERT INTO `rol_has_permisos` VALUES ('1', '32');
INSERT INTO `rol_has_permisos` VALUES ('1', '33');
INSERT INTO `rol_has_permisos` VALUES ('1', '34');
INSERT INTO `rol_has_permisos` VALUES ('1', '35');
INSERT INTO `rol_has_permisos` VALUES ('1', '36');

-- ----------------------------
-- Table structure for seguimiento_actividades
-- ----------------------------
DROP TABLE IF EXISTS `seguimiento_actividades`;
CREATE TABLE `seguimiento_actividades` (
  `idseguimiento_actividades` int(11) NOT NULL AUTO_INCREMENT,
  `anio` int(11) DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `identificacion_actividad` varchar(255) DEFAULT NULL,
  `fecha_informes` date DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `profesor_idprofesor` int(11) NOT NULL,
  PRIMARY KEY (`idseguimiento_actividades`),
  KEY `fk_seguimiento_actividades_profesor1_idx` (`profesor_idprofesor`),
  CONSTRAINT `fk_seguimiento_actividades_profesor1` FOREIGN KEY (`profesor_idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seguimiento_actividades
-- ----------------------------

-- ----------------------------
-- Table structure for solicitud
-- ----------------------------
DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE `solicitud` (
  `idsolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` varchar(255) NOT NULL,
  `solicitud` varchar(2000) NOT NULL,
  `aula_idaula` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idsolicitud`),
  KEY `fk_solicitud_usuario1_idx` (`solicitante`),
  KEY `fk_solicitud_aula1_idx` (`aula_idaula`),
  CONSTRAINT `fk_solicitud_aula1` FOREIGN KEY (`aula_idaula`) REFERENCES `aula` (`idaula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_usuario1` FOREIGN KEY (`solicitante`) REFERENCES `usuario` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of solicitud
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
INSERT INTO `usuario` VALUES ('acortez', 'Andres', 'Cortez', '123456', 'Activo', '2');
INSERT INTO `usuario` VALUES ('oscar7685', 'Oscar', 'Ballestero', '123456', 'Activo', '1');
