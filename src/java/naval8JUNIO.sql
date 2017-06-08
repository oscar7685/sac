/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : naval

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-08 16:28:10
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
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `ubicacion` int(11) DEFAULT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `programa_especialidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idasignatura`),
  KEY `fk_asignatura_programa1_idx` (`programa_idprograma`),
  KEY `fk_asignatura_programa2_idx` (`programa_especialidad`),
  CONSTRAINT `fk_asignatura_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_programa2` FOREIGN KEY (`programa_especialidad`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignatura
-- ----------------------------
INSERT INTO `asignatura` VALUES ('1', 'ORIENTACIÓN NAVAL', 'ON1', '1', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('2', 'MARINERÍA', 'MA1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('3', 'COMUNICACIONES BÁSICAS', 'CB1', '1', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('4', 'FUNDAMENTOS DE SISTEMAS DE ARMAS', 'FSA1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('5', 'FUNDAMENTOS DE MATEMÁTICAS', 'FM1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('6', 'NAVEGACIÓN COSTERA', 'NC2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('7', 'NOCIONES DE TÁCTICA', 'NT2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('8', 'CÁLCULO DIFERENCIAL', 'CD2', '4', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('9', 'ALGEBRA LINEAL', 'AL2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('10', 'INFORMÁTICA', 'IN2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('12', 'CÁLCULO INTEGRAL', 'CI3', '4', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('13', 'ESTADISTICA DESCRIPTIVA Y PROBABILIDAD', 'EDP3', '3', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('14', 'FISICA MECANICA - LABORATORIO', 'FML3', '4', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('15', 'DERECHO PENAL MILITAR', 'DPM3', '1', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('16', 'INVESTIGACIÓN FORMATIVA I', 'IF1', '1', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('17', 'IDIOMAS II', 'ID2', '2', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('18', 'DERECHO DEL MAR Y FLUVIAL', 'DMF2', '2', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('19', 'DERECHO CONSTITUCIONAL', 'DC1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('20', 'DERECHOS HUMANOS Y DERECHO INTERNACIONAL', 'DHDI1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('21', 'FUNDAMENTOS DE LIDERAZGO', 'FL1', '1', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('22', 'ÉTICA BÁSICA', 'EB1', '1', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('23', 'ARMAMENTO IM I', 'AIM1', '2', '1', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('24', 'HISTORIA NAVAL', 'HN2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('25', 'TÉCNICAS DE EXPRESIÓN ORAL Y ESCRITA', 'TEO2', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('26', 'IDIOMAS I', 'ID1', '2', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('27', 'OPERACIONES FLUVIALES', 'OF2', '1', '2', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('28', 'PRINCIPIOS DE CONTABILIDAD', 'PC3', '2', '3', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('29', 'SISTEMAS DE ARMAS SENSORICAS', 'SAS4', '2', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('30', 'ESTADISTICA INFERENCIAL', 'EI4', '3', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('31', 'INVESTIGACIÓN FORMATICA II', 'IF4', '1', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('32', 'IDIOMAS III', 'ID4', '2', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('33', 'OCEANOGRAFÍA GENERAL', 'OG4', '1', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('34', 'PROCESOS ADMINISTRATIVOS', 'PA4', '2', '4', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('35', 'SISTEMAS DE ARMAS ELECTRÓNICAS', 'SAE4', '2', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('36', 'INVESTIGACIÓN FORMATIVA III', 'IF5', '2', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('37', 'IDIOMAS IV', 'ID5', '2', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('38', 'FUNDAMENTO DE MOTORES', 'FM5', '1', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('39', 'OPTATIVA I', 'OP1', '2', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('40', 'OPTATIVA II', 'OP2', '2', '5', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('41', 'COMUNICACIONES ELECTROMAGNÉTICAS', 'CE6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('42', 'MANIOBRAS', 'MA6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('43', 'NAVEGACIÓN ASTRONÓMICA', 'NA6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('44', 'NAVEGACIÓN ELECTRÓNICA', 'NE6', '3', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('45', 'ÉTICA PROFESIONAL', 'EP6', '1', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('46', 'INTELIGENCIA BÁSICA, CONTRAINTELIGENCIA Y SEGURIDAD MILITAR', 'IBCSM6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('47', 'CONTROL DE AVERIAS Y PRACTICAS', 'CAP6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('48', 'MAQUINARIA NAVAL', 'MN6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('49', 'METEOROLOGÍA GENERAL', 'MG6', '1', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('50', 'LOGÍSTICA GENERAL', 'LG6', '2', '6', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('51', 'TÁCTICA NAVAL I', 'TN1', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('52', 'TÁCTICA NAVAL II', 'TN2', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('53', 'IDIOMAS V', 'ID7', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('54', 'FUNDAMENTOS DE ESTABILIDAD', 'FE7', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('55', 'REGIMEN FISCAL Y CONTROL INTERNO', 'RFCI', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('56', 'OPTATIVA III', 'OP3', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('57', 'OPTATIVA IV', 'OP4', '2', '7', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('58', 'OPERACIONES NAVALES', 'OP8', '1', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('59', 'PROCEDIMIENTOS DISCIPLINARIOS Y ADMINISTRATIVOS', 'PDA', '1', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('60', 'IDIOMAS VI', 'ID6', '2', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('61', 'LIDERAZGO MILITAR', 'LM', '1', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('62', 'ACCIÓN INTEGRAL', 'AI', '2', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('63', 'PRESUPUESTO Y TESORERÍA', 'PT', '2', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('64', 'OPTATIVA V', 'OP5', '3', '8', null, '2', 'NORMAL', null);
INSERT INTO `asignatura` VALUES ('66', 'METEOROLOGÍA MARINA', 'METMAR', '2', null, null, '2', 'OPTATIVA', '1');
INSERT INTO `asignatura` VALUES ('67', 'OCEANOGRAFÍA BIOLÓGICA', 'OCEBIO', '3', null, null, '2', 'OPTATIVA', '1');
INSERT INTO `asignatura` VALUES ('68', 'HIDROGRAFÍA', 'HIDR', '2', null, null, '2', 'OPTATIVA', '1');
INSERT INTO `asignatura` VALUES ('69', 'LEGISLACIÓN AMBIENTAL Y MARINA', 'LEGAM', '2', null, null, '2', 'OPTATIVA', '1');
INSERT INTO `asignatura` VALUES ('70', 'INSTRUMENTACIÓN OCEANOGRÁFICA', 'INSTOC', '2', null, null, '2', 'OPTATIVA', '1');
INSERT INTO `asignatura` VALUES ('71', 'ELECTRICIDAD I CIRCUITOS DE CORRIENTE DIRECTA Y LABORATORIO', 'ELECT1', '4', null, null, '2', 'OPTATIVA', '4');
INSERT INTO `asignatura` VALUES ('72', 'ELECTRICIDAD II CIRCUITOS DE CORRIENTE ALTERNA Y LABORATORIO', 'ELECT2', '4', null, null, '2', 'OPTATIVA', '4');
INSERT INTO `asignatura` VALUES ('73', 'INTRODUCCIÓN A LA ELECTRÓNICA', 'INTROE', '3', null, null, '2', 'OPTATIVA', '4');
INSERT INTO `asignatura` VALUES ('74', 'FUNDAMENTOS DE NORMATIVIDAD MARÍTIMA COLOMBIANA', 'FUNDMAR', '3', null, null, '2', 'OPTATIVA', '6');
INSERT INTO `asignatura` VALUES ('75', 'ECOLOGÍA Y CONTAMINACIÓN', 'ECOL', '2', null, null, '2', 'OPTATIVA', '6');
INSERT INTO `asignatura` VALUES ('76', 'PROCESOS JUDICIALES Y DISCIPLINARIOS', 'PROCJUD', '2', null, null, '2', 'OPTATIVA', '6');
INSERT INTO `asignatura` VALUES ('77', 'FUNDAMENTOS DE LA GESTIÓN POR PROCESOS', 'FUNGES', '2', null, null, '2', 'OPTATIVA', '6');
INSERT INTO `asignatura` VALUES ('78', 'FUNDAMENTOS DE SALUD Y SEGURIDAD OCUPACIONAL', 'FUNSYSO', '2', null, null, '2', 'OPTATIVA', '6');
INSERT INTO `asignatura` VALUES ('79', 'MATERIALES DE INGENIERÍA Y LABORATORIO', 'MATING', '4', null, null, '2', 'OPTATIVA', '3');
INSERT INTO `asignatura` VALUES ('80', 'MÁQUINAS ELÉCTRICAS Y LABORATORIO', 'MAQELEC', '4', null, null, '2', 'OPTATIVA', '3');
INSERT INTO `asignatura` VALUES ('81', 'PRINCIPIOS DE MANTENIMIENTO', 'PRINMAN', '3', null, null, '2', 'OPTATIVA', '3');
INSERT INTO `asignatura` VALUES ('82', 'PRINCIPIOS DE ECONOMÍA', 'PRINECO', '2', null, null, '2', 'OPTATIVA', '5');
INSERT INTO `asignatura` VALUES ('83', 'ADMINISTRACIÓN, PLANEACIÓN Y ORGANIZACIÓN', 'ADMPLAN', '3', null, null, '2', 'OPTATIVA', '5');
INSERT INTO `asignatura` VALUES ('84', 'CONTRATACIÓN ESTATAL', 'CONTEST', '3', null, null, '2', 'OPTATIVA', '5');
INSERT INTO `asignatura` VALUES ('85', 'GESTIÓN DEL TALENTO HUMANO', 'GESTH', '3', null, null, '2', 'OPTATIVA', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('2', '2017', '1', 'CCPCN', '40', '2', '26');
INSERT INTO `curso` VALUES ('3', '2017', '1', '1.1 A', '25', '2', null);
INSERT INTO `curso` VALUES ('4', '2017', '1', '1.1 B', '26', '2', null);
INSERT INTO `curso` VALUES ('5', '2017', '1', '1.1 C', '27', '2', null);
INSERT INTO `curso` VALUES ('7', '2017', '1', '1.1 IM', '28', '2', null);
INSERT INTO `curso` VALUES ('8', '2017', '1', '1.2 A', '19', '2', null);
INSERT INTO `curso` VALUES ('9', '2017', '1', '1.2 B', '20', '2', null);
INSERT INTO `curso` VALUES ('10', '2017', '1', '1.2 C', '21', '2', null);
INSERT INTO `curso` VALUES ('11', '2017', '1', '1.2 D', '22', '2', null);
INSERT INTO `curso` VALUES ('12', '2017', '1', '1.2 MC', '23', '2', null);
INSERT INTO `curso` VALUES ('13', '2017', '1', '1.2 IM', '24', '2', null);
INSERT INTO `curso` VALUES ('14', '2017', '1', '4.1 ING', '1', '2', null);
INSERT INTO `curso` VALUES ('15', '2017', '1', '4.2 LA', '2', '2', null);
INSERT INTO `curso` VALUES ('16', '2017', '1', '3.2 MC', '3', '2', null);
INSERT INTO `curso` VALUES ('17', '2017', '1', '2.2 IM', '4', '2', null);
INSERT INTO `curso` VALUES ('18', '2017', '1', '3.1 SPO', '5', '2', null);
INSERT INTO `curso` VALUES ('19', '2017', '1', '2.2 SPA', '6', '2', null);
INSERT INTO `curso` VALUES ('20', '2017', '1', '3.1 IM', '7', '2', null);
INSERT INTO `curso` VALUES ('21', '2017', '1', '3.1 ING', '8', '2', null);
INSERT INTO `curso` VALUES ('22', '2017', '1', '4.1 IM', '9', '2', null);
INSERT INTO `curso` VALUES ('23', '2017', '1', '4.1 SPA', '10', '2', null);
INSERT INTO `curso` VALUES ('24', '2017', '1', '2.2 SPO', '11', '2', null);
INSERT INTO `curso` VALUES ('25', '2017', '1', '2.2 SPE', '12', '2', null);
INSERT INTO `curso` VALUES ('26', '2017', '1', '2.2 ING', '13', '2', null);
INSERT INTO `curso` VALUES ('27', '2017', '1', '2.2 LA', '14', '2', null);
INSERT INTO `curso` VALUES ('28', '2017', '1', '2.2 MC', '15', '2', null);
INSERT INTO `curso` VALUES ('29', '2017', '1', '2.1 IM', '16', '2', null);
INSERT INTO `curso` VALUES ('30', '2017', '1', '4.2 SPO', '17', '2', null);
INSERT INTO `curso` VALUES ('31', '2017', '1', '4.2 SPE', '18', '2', null);
INSERT INTO `curso` VALUES ('32', '2017', '1', 'CDPRON', '29', '2', null);
INSERT INTO `curso` VALUES ('33', '2017', '1', 'PR-49', '30', '2', null);
INSERT INTO `curso` VALUES ('34', '2017', '1', '4.2 ING', '33', '2', null);
INSERT INTO `curso` VALUES ('35', '2017', '1', 'CCPELE', '34', '2', null);
INSERT INTO `curso` VALUES ('36', '2017', '1', 'CCPIN', '35', '2', null);
INSERT INTO `curso` VALUES ('37', '2017', '1', 'BASICO 59', '36', '2', null);
INSERT INTO `curso` VALUES ('38', '2017', '1', '4.1 SPO', '37', '2', null);
INSERT INTO `curso` VALUES ('39', '2017', '1', '2.1 B', '38', '2', null);
INSERT INTO `curso` VALUES ('40', '2017', '1', 'CCPOF', '39', '2', null);
INSERT INTO `curso` VALUES ('42', '2017', '1', 'CCPAM-31', '41', '2', null);
INSERT INTO `curso` VALUES ('43', '2017', '1', 'CCPAD', '42', '2', null);
INSERT INTO `curso` VALUES ('44', '2017', '1', '4.2 IM', '44', '2', null);
INSERT INTO `curso` VALUES ('45', '2017', '1', 'COMANDO 84', '45', '2', null);
INSERT INTO `curso` VALUES ('46', '2017', '1', '2.1 A', '46', '2', null);

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
INSERT INTO `curso_has_estudiante` VALUES ('2', '3');
INSERT INTO `curso_has_estudiante` VALUES ('2', '5');
INSERT INTO `curso_has_estudiante` VALUES ('2', '6');
INSERT INTO `curso_has_estudiante` VALUES ('2', '10');
INSERT INTO `curso_has_estudiante` VALUES ('2', '23');
INSERT INTO `curso_has_estudiante` VALUES ('2', '24');
INSERT INTO `curso_has_estudiante` VALUES ('2', '25');
INSERT INTO `curso_has_estudiante` VALUES ('3', '26');
INSERT INTO `curso_has_estudiante` VALUES ('3', '27');
INSERT INTO `curso_has_estudiante` VALUES ('3', '28');
INSERT INTO `curso_has_estudiante` VALUES ('3', '29');
INSERT INTO `curso_has_estudiante` VALUES ('3', '120');
INSERT INTO `curso_has_estudiante` VALUES ('4', '121');
INSERT INTO `curso_has_estudiante` VALUES ('5', '122');
INSERT INTO `curso_has_estudiante` VALUES ('7', '123');
INSERT INTO `curso_has_estudiante` VALUES ('8', '124');
INSERT INTO `curso_has_estudiante` VALUES ('9', '125');
INSERT INTO `curso_has_estudiante` VALUES ('10', '126');
INSERT INTO `curso_has_estudiante` VALUES ('11', '127');
INSERT INTO `curso_has_estudiante` VALUES ('12', '128');
INSERT INTO `curso_has_estudiante` VALUES ('13', '129');
INSERT INTO `curso_has_estudiante` VALUES ('14', '130');
INSERT INTO `curso_has_estudiante` VALUES ('15', '131');
INSERT INTO `curso_has_estudiante` VALUES ('16', '132');
INSERT INTO `curso_has_estudiante` VALUES ('17', '133');
INSERT INTO `curso_has_estudiante` VALUES ('18', '134');
INSERT INTO `curso_has_estudiante` VALUES ('19', '135');
INSERT INTO `curso_has_estudiante` VALUES ('20', '136');
INSERT INTO `curso_has_estudiante` VALUES ('21', '137');
INSERT INTO `curso_has_estudiante` VALUES ('22', '138');
INSERT INTO `curso_has_estudiante` VALUES ('23', '139');
INSERT INTO `curso_has_estudiante` VALUES ('24', '140');
INSERT INTO `curso_has_estudiante` VALUES ('25', '141');
INSERT INTO `curso_has_estudiante` VALUES ('26', '142');
INSERT INTO `curso_has_estudiante` VALUES ('27', '143');
INSERT INTO `curso_has_estudiante` VALUES ('28', '144');
INSERT INTO `curso_has_estudiante` VALUES ('29', '145');
INSERT INTO `curso_has_estudiante` VALUES ('30', '146');
INSERT INTO `curso_has_estudiante` VALUES ('31', '147');
INSERT INTO `curso_has_estudiante` VALUES ('32', '148');
INSERT INTO `curso_has_estudiante` VALUES ('33', '149');
INSERT INTO `curso_has_estudiante` VALUES ('34', '150');
INSERT INTO `curso_has_estudiante` VALUES ('35', '151');
INSERT INTO `curso_has_estudiante` VALUES ('36', '152');
INSERT INTO `curso_has_estudiante` VALUES ('37', '153');
INSERT INTO `curso_has_estudiante` VALUES ('38', '154');
INSERT INTO `curso_has_estudiante` VALUES ('39', '155');
INSERT INTO `curso_has_estudiante` VALUES ('40', '156');
INSERT INTO `curso_has_estudiante` VALUES ('42', '157');
INSERT INTO `curso_has_estudiante` VALUES ('43', '158');
INSERT INTO `curso_has_estudiante` VALUES ('44', '159');
INSERT INTO `curso_has_estudiante` VALUES ('45', '160');
INSERT INTO `curso_has_estudiante` VALUES ('46', '161');
INSERT INTO `curso_has_estudiante` VALUES ('3', '162');
INSERT INTO `curso_has_estudiante` VALUES ('4', '163');
INSERT INTO `curso_has_estudiante` VALUES ('5', '164');
INSERT INTO `curso_has_estudiante` VALUES ('7', '165');
INSERT INTO `curso_has_estudiante` VALUES ('8', '166');
INSERT INTO `curso_has_estudiante` VALUES ('9', '167');
INSERT INTO `curso_has_estudiante` VALUES ('10', '168');
INSERT INTO `curso_has_estudiante` VALUES ('11', '169');
INSERT INTO `curso_has_estudiante` VALUES ('12', '170');
INSERT INTO `curso_has_estudiante` VALUES ('13', '171');
INSERT INTO `curso_has_estudiante` VALUES ('14', '172');
INSERT INTO `curso_has_estudiante` VALUES ('15', '173');
INSERT INTO `curso_has_estudiante` VALUES ('16', '174');
INSERT INTO `curso_has_estudiante` VALUES ('17', '175');
INSERT INTO `curso_has_estudiante` VALUES ('18', '176');
INSERT INTO `curso_has_estudiante` VALUES ('19', '177');
INSERT INTO `curso_has_estudiante` VALUES ('20', '178');
INSERT INTO `curso_has_estudiante` VALUES ('21', '179');
INSERT INTO `curso_has_estudiante` VALUES ('22', '180');
INSERT INTO `curso_has_estudiante` VALUES ('23', '181');
INSERT INTO `curso_has_estudiante` VALUES ('24', '182');
INSERT INTO `curso_has_estudiante` VALUES ('25', '183');
INSERT INTO `curso_has_estudiante` VALUES ('26', '184');
INSERT INTO `curso_has_estudiante` VALUES ('27', '185');
INSERT INTO `curso_has_estudiante` VALUES ('28', '186');
INSERT INTO `curso_has_estudiante` VALUES ('29', '187');
INSERT INTO `curso_has_estudiante` VALUES ('30', '188');
INSERT INTO `curso_has_estudiante` VALUES ('31', '189');
INSERT INTO `curso_has_estudiante` VALUES ('32', '190');
INSERT INTO `curso_has_estudiante` VALUES ('33', '191');
INSERT INTO `curso_has_estudiante` VALUES ('34', '192');
INSERT INTO `curso_has_estudiante` VALUES ('35', '193');
INSERT INTO `curso_has_estudiante` VALUES ('36', '194');
INSERT INTO `curso_has_estudiante` VALUES ('37', '195');
INSERT INTO `curso_has_estudiante` VALUES ('38', '196');
INSERT INTO `curso_has_estudiante` VALUES ('39', '197');
INSERT INTO `curso_has_estudiante` VALUES ('40', '198');
INSERT INTO `curso_has_estudiante` VALUES ('42', '199');
INSERT INTO `curso_has_estudiante` VALUES ('43', '200');
INSERT INTO `curso_has_estudiante` VALUES ('44', '201');
INSERT INTO `curso_has_estudiante` VALUES ('45', '202');
INSERT INTO `curso_has_estudiante` VALUES ('46', '203');
INSERT INTO `curso_has_estudiante` VALUES ('3', '204');
INSERT INTO `curso_has_estudiante` VALUES ('4', '205');
INSERT INTO `curso_has_estudiante` VALUES ('5', '206');
INSERT INTO `curso_has_estudiante` VALUES ('7', '207');
INSERT INTO `curso_has_estudiante` VALUES ('8', '208');
INSERT INTO `curso_has_estudiante` VALUES ('9', '209');
INSERT INTO `curso_has_estudiante` VALUES ('10', '210');
INSERT INTO `curso_has_estudiante` VALUES ('11', '211');
INSERT INTO `curso_has_estudiante` VALUES ('12', '212');
INSERT INTO `curso_has_estudiante` VALUES ('13', '213');
INSERT INTO `curso_has_estudiante` VALUES ('14', '214');
INSERT INTO `curso_has_estudiante` VALUES ('15', '215');
INSERT INTO `curso_has_estudiante` VALUES ('16', '216');
INSERT INTO `curso_has_estudiante` VALUES ('17', '217');
INSERT INTO `curso_has_estudiante` VALUES ('18', '218');
INSERT INTO `curso_has_estudiante` VALUES ('19', '219');
INSERT INTO `curso_has_estudiante` VALUES ('20', '220');
INSERT INTO `curso_has_estudiante` VALUES ('21', '221');
INSERT INTO `curso_has_estudiante` VALUES ('22', '222');
INSERT INTO `curso_has_estudiante` VALUES ('23', '223');
INSERT INTO `curso_has_estudiante` VALUES ('24', '224');
INSERT INTO `curso_has_estudiante` VALUES ('25', '225');
INSERT INTO `curso_has_estudiante` VALUES ('26', '226');
INSERT INTO `curso_has_estudiante` VALUES ('27', '227');
INSERT INTO `curso_has_estudiante` VALUES ('28', '228');
INSERT INTO `curso_has_estudiante` VALUES ('29', '229');
INSERT INTO `curso_has_estudiante` VALUES ('30', '230');
INSERT INTO `curso_has_estudiante` VALUES ('31', '231');
INSERT INTO `curso_has_estudiante` VALUES ('32', '232');
INSERT INTO `curso_has_estudiante` VALUES ('33', '233');
INSERT INTO `curso_has_estudiante` VALUES ('34', '234');
INSERT INTO `curso_has_estudiante` VALUES ('35', '235');
INSERT INTO `curso_has_estudiante` VALUES ('36', '236');
INSERT INTO `curso_has_estudiante` VALUES ('37', '237');
INSERT INTO `curso_has_estudiante` VALUES ('38', '238');
INSERT INTO `curso_has_estudiante` VALUES ('39', '239');
INSERT INTO `curso_has_estudiante` VALUES ('40', '240');
INSERT INTO `curso_has_estudiante` VALUES ('42', '241');
INSERT INTO `curso_has_estudiante` VALUES ('43', '242');
INSERT INTO `curso_has_estudiante` VALUES ('44', '243');
INSERT INTO `curso_has_estudiante` VALUES ('45', '244');
INSERT INTO `curso_has_estudiante` VALUES ('46', '245');
INSERT INTO `curso_has_estudiante` VALUES ('3', '246');
INSERT INTO `curso_has_estudiante` VALUES ('4', '247');
INSERT INTO `curso_has_estudiante` VALUES ('5', '248');
INSERT INTO `curso_has_estudiante` VALUES ('7', '249');
INSERT INTO `curso_has_estudiante` VALUES ('8', '250');
INSERT INTO `curso_has_estudiante` VALUES ('9', '251');
INSERT INTO `curso_has_estudiante` VALUES ('10', '252');
INSERT INTO `curso_has_estudiante` VALUES ('11', '253');
INSERT INTO `curso_has_estudiante` VALUES ('12', '254');
INSERT INTO `curso_has_estudiante` VALUES ('13', '255');
INSERT INTO `curso_has_estudiante` VALUES ('14', '256');
INSERT INTO `curso_has_estudiante` VALUES ('15', '257');
INSERT INTO `curso_has_estudiante` VALUES ('16', '258');
INSERT INTO `curso_has_estudiante` VALUES ('17', '259');
INSERT INTO `curso_has_estudiante` VALUES ('18', '260');
INSERT INTO `curso_has_estudiante` VALUES ('19', '261');
INSERT INTO `curso_has_estudiante` VALUES ('20', '262');
INSERT INTO `curso_has_estudiante` VALUES ('21', '263');
INSERT INTO `curso_has_estudiante` VALUES ('22', '264');
INSERT INTO `curso_has_estudiante` VALUES ('23', '265');
INSERT INTO `curso_has_estudiante` VALUES ('24', '266');
INSERT INTO `curso_has_estudiante` VALUES ('25', '267');
INSERT INTO `curso_has_estudiante` VALUES ('26', '268');
INSERT INTO `curso_has_estudiante` VALUES ('27', '269');
INSERT INTO `curso_has_estudiante` VALUES ('28', '270');
INSERT INTO `curso_has_estudiante` VALUES ('29', '271');
INSERT INTO `curso_has_estudiante` VALUES ('30', '272');
INSERT INTO `curso_has_estudiante` VALUES ('31', '273');
INSERT INTO `curso_has_estudiante` VALUES ('32', '274');
INSERT INTO `curso_has_estudiante` VALUES ('33', '275');
INSERT INTO `curso_has_estudiante` VALUES ('34', '276');
INSERT INTO `curso_has_estudiante` VALUES ('35', '277');
INSERT INTO `curso_has_estudiante` VALUES ('36', '278');
INSERT INTO `curso_has_estudiante` VALUES ('37', '279');
INSERT INTO `curso_has_estudiante` VALUES ('38', '280');
INSERT INTO `curso_has_estudiante` VALUES ('39', '281');
INSERT INTO `curso_has_estudiante` VALUES ('40', '282');
INSERT INTO `curso_has_estudiante` VALUES ('42', '283');
INSERT INTO `curso_has_estudiante` VALUES ('43', '284');
INSERT INTO `curso_has_estudiante` VALUES ('44', '285');
INSERT INTO `curso_has_estudiante` VALUES ('45', '286');
INSERT INTO `curso_has_estudiante` VALUES ('46', '287');
INSERT INTO `curso_has_estudiante` VALUES ('3', '288');
INSERT INTO `curso_has_estudiante` VALUES ('4', '289');
INSERT INTO `curso_has_estudiante` VALUES ('5', '290');
INSERT INTO `curso_has_estudiante` VALUES ('7', '291');
INSERT INTO `curso_has_estudiante` VALUES ('8', '292');
INSERT INTO `curso_has_estudiante` VALUES ('9', '293');
INSERT INTO `curso_has_estudiante` VALUES ('10', '294');
INSERT INTO `curso_has_estudiante` VALUES ('11', '295');
INSERT INTO `curso_has_estudiante` VALUES ('12', '296');
INSERT INTO `curso_has_estudiante` VALUES ('13', '297');
INSERT INTO `curso_has_estudiante` VALUES ('14', '298');
INSERT INTO `curso_has_estudiante` VALUES ('15', '299');
INSERT INTO `curso_has_estudiante` VALUES ('16', '300');
INSERT INTO `curso_has_estudiante` VALUES ('17', '301');
INSERT INTO `curso_has_estudiante` VALUES ('18', '302');
INSERT INTO `curso_has_estudiante` VALUES ('19', '303');
INSERT INTO `curso_has_estudiante` VALUES ('20', '304');
INSERT INTO `curso_has_estudiante` VALUES ('21', '305');
INSERT INTO `curso_has_estudiante` VALUES ('22', '306');
INSERT INTO `curso_has_estudiante` VALUES ('23', '307');
INSERT INTO `curso_has_estudiante` VALUES ('24', '308');
INSERT INTO `curso_has_estudiante` VALUES ('25', '309');
INSERT INTO `curso_has_estudiante` VALUES ('26', '310');
INSERT INTO `curso_has_estudiante` VALUES ('27', '311');
INSERT INTO `curso_has_estudiante` VALUES ('28', '312');
INSERT INTO `curso_has_estudiante` VALUES ('29', '313');
INSERT INTO `curso_has_estudiante` VALUES ('30', '314');
INSERT INTO `curso_has_estudiante` VALUES ('31', '315');
INSERT INTO `curso_has_estudiante` VALUES ('32', '316');
INSERT INTO `curso_has_estudiante` VALUES ('33', '317');
INSERT INTO `curso_has_estudiante` VALUES ('34', '318');
INSERT INTO `curso_has_estudiante` VALUES ('35', '319');
INSERT INTO `curso_has_estudiante` VALUES ('36', '320');
INSERT INTO `curso_has_estudiante` VALUES ('37', '321');
INSERT INTO `curso_has_estudiante` VALUES ('38', '322');
INSERT INTO `curso_has_estudiante` VALUES ('39', '323');
INSERT INTO `curso_has_estudiante` VALUES ('40', '324');
INSERT INTO `curso_has_estudiante` VALUES ('42', '325');
INSERT INTO `curso_has_estudiante` VALUES ('43', '326');
INSERT INTO `curso_has_estudiante` VALUES ('44', '327');
INSERT INTO `curso_has_estudiante` VALUES ('45', '328');
INSERT INTO `curso_has_estudiante` VALUES ('46', '329');
INSERT INTO `curso_has_estudiante` VALUES ('3', '330');
INSERT INTO `curso_has_estudiante` VALUES ('4', '331');
INSERT INTO `curso_has_estudiante` VALUES ('5', '332');
INSERT INTO `curso_has_estudiante` VALUES ('7', '333');
INSERT INTO `curso_has_estudiante` VALUES ('8', '334');
INSERT INTO `curso_has_estudiante` VALUES ('9', '335');
INSERT INTO `curso_has_estudiante` VALUES ('10', '336');
INSERT INTO `curso_has_estudiante` VALUES ('11', '337');
INSERT INTO `curso_has_estudiante` VALUES ('12', '338');
INSERT INTO `curso_has_estudiante` VALUES ('13', '339');
INSERT INTO `curso_has_estudiante` VALUES ('14', '340');
INSERT INTO `curso_has_estudiante` VALUES ('15', '341');
INSERT INTO `curso_has_estudiante` VALUES ('16', '342');
INSERT INTO `curso_has_estudiante` VALUES ('17', '343');
INSERT INTO `curso_has_estudiante` VALUES ('18', '344');
INSERT INTO `curso_has_estudiante` VALUES ('19', '345');
INSERT INTO `curso_has_estudiante` VALUES ('20', '346');
INSERT INTO `curso_has_estudiante` VALUES ('21', '347');
INSERT INTO `curso_has_estudiante` VALUES ('22', '348');
INSERT INTO `curso_has_estudiante` VALUES ('23', '349');
INSERT INTO `curso_has_estudiante` VALUES ('24', '350');
INSERT INTO `curso_has_estudiante` VALUES ('25', '351');
INSERT INTO `curso_has_estudiante` VALUES ('26', '352');
INSERT INTO `curso_has_estudiante` VALUES ('27', '353');
INSERT INTO `curso_has_estudiante` VALUES ('28', '354');
INSERT INTO `curso_has_estudiante` VALUES ('29', '355');
INSERT INTO `curso_has_estudiante` VALUES ('30', '356');
INSERT INTO `curso_has_estudiante` VALUES ('31', '357');
INSERT INTO `curso_has_estudiante` VALUES ('32', '358');
INSERT INTO `curso_has_estudiante` VALUES ('33', '359');
INSERT INTO `curso_has_estudiante` VALUES ('34', '360');
INSERT INTO `curso_has_estudiante` VALUES ('12', '361');
INSERT INTO `curso_has_estudiante` VALUES ('36', '362');
INSERT INTO `curso_has_estudiante` VALUES ('37', '363');
INSERT INTO `curso_has_estudiante` VALUES ('38', '364');
INSERT INTO `curso_has_estudiante` VALUES ('39', '365');
INSERT INTO `curso_has_estudiante` VALUES ('40', '366');
INSERT INTO `curso_has_estudiante` VALUES ('42', '367');
INSERT INTO `curso_has_estudiante` VALUES ('43', '368');
INSERT INTO `curso_has_estudiante` VALUES ('44', '369');
INSERT INTO `curso_has_estudiante` VALUES ('45', '370');
INSERT INTO `curso_has_estudiante` VALUES ('46', '371');
INSERT INTO `curso_has_estudiante` VALUES ('3', '372');
INSERT INTO `curso_has_estudiante` VALUES ('4', '373');
INSERT INTO `curso_has_estudiante` VALUES ('5', '374');
INSERT INTO `curso_has_estudiante` VALUES ('7', '375');
INSERT INTO `curso_has_estudiante` VALUES ('8', '376');
INSERT INTO `curso_has_estudiante` VALUES ('9', '377');
INSERT INTO `curso_has_estudiante` VALUES ('10', '378');
INSERT INTO `curso_has_estudiante` VALUES ('11', '379');
INSERT INTO `curso_has_estudiante` VALUES ('12', '380');
INSERT INTO `curso_has_estudiante` VALUES ('13', '381');
INSERT INTO `curso_has_estudiante` VALUES ('14', '382');
INSERT INTO `curso_has_estudiante` VALUES ('15', '383');
INSERT INTO `curso_has_estudiante` VALUES ('3', '384');
INSERT INTO `curso_has_estudiante` VALUES ('17', '385');
INSERT INTO `curso_has_estudiante` VALUES ('18', '386');
INSERT INTO `curso_has_estudiante` VALUES ('19', '387');
INSERT INTO `curso_has_estudiante` VALUES ('20', '388');
INSERT INTO `curso_has_estudiante` VALUES ('21', '389');
INSERT INTO `curso_has_estudiante` VALUES ('22', '390');
INSERT INTO `curso_has_estudiante` VALUES ('23', '391');
INSERT INTO `curso_has_estudiante` VALUES ('24', '392');
INSERT INTO `curso_has_estudiante` VALUES ('25', '393');
INSERT INTO `curso_has_estudiante` VALUES ('26', '394');
INSERT INTO `curso_has_estudiante` VALUES ('27', '395');
INSERT INTO `curso_has_estudiante` VALUES ('28', '396');
INSERT INTO `curso_has_estudiante` VALUES ('29', '397');
INSERT INTO `curso_has_estudiante` VALUES ('30', '398');
INSERT INTO `curso_has_estudiante` VALUES ('31', '399');
INSERT INTO `curso_has_estudiante` VALUES ('32', '400');
INSERT INTO `curso_has_estudiante` VALUES ('33', '401');
INSERT INTO `curso_has_estudiante` VALUES ('34', '402');
INSERT INTO `curso_has_estudiante` VALUES ('12', '403');
INSERT INTO `curso_has_estudiante` VALUES ('36', '404');
INSERT INTO `curso_has_estudiante` VALUES ('37', '405');
INSERT INTO `curso_has_estudiante` VALUES ('38', '406');
INSERT INTO `curso_has_estudiante` VALUES ('39', '407');
INSERT INTO `curso_has_estudiante` VALUES ('40', '408');
INSERT INTO `curso_has_estudiante` VALUES ('42', '409');
INSERT INTO `curso_has_estudiante` VALUES ('43', '410');
INSERT INTO `curso_has_estudiante` VALUES ('44', '411');
INSERT INTO `curso_has_estudiante` VALUES ('45', '412');
INSERT INTO `curso_has_estudiante` VALUES ('46', '413');
INSERT INTO `curso_has_estudiante` VALUES ('3', '414');
INSERT INTO `curso_has_estudiante` VALUES ('4', '415');
INSERT INTO `curso_has_estudiante` VALUES ('5', '416');
INSERT INTO `curso_has_estudiante` VALUES ('7', '417');
INSERT INTO `curso_has_estudiante` VALUES ('8', '418');
INSERT INTO `curso_has_estudiante` VALUES ('9', '419');
INSERT INTO `curso_has_estudiante` VALUES ('10', '420');
INSERT INTO `curso_has_estudiante` VALUES ('11', '421');
INSERT INTO `curso_has_estudiante` VALUES ('12', '422');
INSERT INTO `curso_has_estudiante` VALUES ('13', '423');
INSERT INTO `curso_has_estudiante` VALUES ('14', '424');
INSERT INTO `curso_has_estudiante` VALUES ('15', '425');
INSERT INTO `curso_has_estudiante` VALUES ('3', '426');
INSERT INTO `curso_has_estudiante` VALUES ('17', '427');
INSERT INTO `curso_has_estudiante` VALUES ('18', '428');
INSERT INTO `curso_has_estudiante` VALUES ('19', '429');
INSERT INTO `curso_has_estudiante` VALUES ('20', '430');
INSERT INTO `curso_has_estudiante` VALUES ('21', '431');
INSERT INTO `curso_has_estudiante` VALUES ('22', '432');
INSERT INTO `curso_has_estudiante` VALUES ('23', '433');
INSERT INTO `curso_has_estudiante` VALUES ('24', '434');
INSERT INTO `curso_has_estudiante` VALUES ('25', '435');
INSERT INTO `curso_has_estudiante` VALUES ('26', '436');
INSERT INTO `curso_has_estudiante` VALUES ('27', '437');
INSERT INTO `curso_has_estudiante` VALUES ('28', '438');
INSERT INTO `curso_has_estudiante` VALUES ('29', '439');
INSERT INTO `curso_has_estudiante` VALUES ('30', '440');
INSERT INTO `curso_has_estudiante` VALUES ('31', '441');
INSERT INTO `curso_has_estudiante` VALUES ('32', '442');
INSERT INTO `curso_has_estudiante` VALUES ('33', '443');
INSERT INTO `curso_has_estudiante` VALUES ('34', '444');
INSERT INTO `curso_has_estudiante` VALUES ('12', '445');
INSERT INTO `curso_has_estudiante` VALUES ('36', '446');
INSERT INTO `curso_has_estudiante` VALUES ('37', '447');
INSERT INTO `curso_has_estudiante` VALUES ('38', '448');
INSERT INTO `curso_has_estudiante` VALUES ('39', '449');
INSERT INTO `curso_has_estudiante` VALUES ('40', '450');
INSERT INTO `curso_has_estudiante` VALUES ('42', '451');
INSERT INTO `curso_has_estudiante` VALUES ('43', '452');
INSERT INTO `curso_has_estudiante` VALUES ('44', '453');
INSERT INTO `curso_has_estudiante` VALUES ('45', '454');
INSERT INTO `curso_has_estudiante` VALUES ('46', '455');
INSERT INTO `curso_has_estudiante` VALUES ('3', '456');
INSERT INTO `curso_has_estudiante` VALUES ('4', '457');
INSERT INTO `curso_has_estudiante` VALUES ('5', '458');
INSERT INTO `curso_has_estudiante` VALUES ('7', '459');

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
  `estudiantil` varchar(255) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudiante
-- ----------------------------
INSERT INTO `estudiante` VALUES ('3', '221710001', 'SERGIO KERMIT', 'JACKSON TESSIER');
INSERT INTO `estudiante` VALUES ('5', '221710002', 'FRANCISCO JAVIER', 'SCHOLBORGH QUINTERO');
INSERT INTO `estudiante` VALUES ('6', '221710003', 'SALOMON', 'UEJBE  LOPEZ');
INSERT INTO `estudiante` VALUES ('10', '221710004', 'CRISTIAN', 'JIMÉNEZ CARABALLO');
INSERT INTO `estudiante` VALUES ('23', '221710005', 'DANIEL DAVID', 'YEPES GONZALEZ');
INSERT INTO `estudiante` VALUES ('24', '221710006', 'RAFAEL ENRIQUE', 'BUELVAS ZÚÑIGA');
INSERT INTO `estudiante` VALUES ('25', '221710007', 'ANDRES IVAN', 'MARTINEZ PADILLA');
INSERT INTO `estudiante` VALUES ('26', '221710008', 'DIANA PATRICIA', 'PADILLA TORRES');
INSERT INTO `estudiante` VALUES ('27', '221710009', 'CARLOS', 'CASTELLAR BARRETO');
INSERT INTO `estudiante` VALUES ('28', '221710012', 'ARTURO', 'GONZALEZ VILLAMIZAR');
INSERT INTO `estudiante` VALUES ('29', '221710015', 'MERLY', 'LIÑAN JARABA');
INSERT INTO `estudiante` VALUES ('120', '0221220022', 'LUIS EDUARDO', 'VIVAS RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('121', '0221220009', 'BRANDON JOSE', 'MIER ARRIETA');
INSERT INTO `estudiante` VALUES ('122', '0221220019', 'JUAN CAMILO', 'MUÑOZ BURGOS');
INSERT INTO `estudiante` VALUES ('123', '0221220010', 'DANIEL ANTONIO', 'YEPES AHUMEDO');
INSERT INTO `estudiante` VALUES ('124', '0221210025', 'LUIS DAVID', 'SALAS HERNANDEZ');
INSERT INTO `estudiante` VALUES ('125', '0221210021', 'MIGUEL ANGEL', 'MERCADO TIRADO');
INSERT INTO `estudiante` VALUES ('126', '0221210004', 'EDGAR DANIEL', 'CASTRO VILLA');
INSERT INTO `estudiante` VALUES ('127', '0221019001', 'KEVIN ANDRES', 'LEON HERNANDEZ');
INSERT INTO `estudiante` VALUES ('128', '0221010034', 'MARIA VICTORIA', 'DE AVILA MEJIA');
INSERT INTO `estudiante` VALUES ('129', '0221410023', 'JULIAN DAVID', 'MARTINEZ VILLARREAL');
INSERT INTO `estudiante` VALUES ('130', '0221410019', 'JESÚS ANDRÉS', 'ACENDRA MARTÍNEZ');
INSERT INTO `estudiante` VALUES ('131', '0221410004', 'AMAURY RAFAEL', 'ORTEGA CAMARGO');
INSERT INTO `estudiante` VALUES ('132', '0221320051', 'ESTEBAN DARIO', 'BARBOZA PRIMERA');
INSERT INTO `estudiante` VALUES ('133', '0221320022', 'NILSON SENEN', 'NIETO LOPEZ');
INSERT INTO `estudiante` VALUES ('134', '0221310033', 'ZAMIR ANDRES', 'MARTELO BALLESTEROS');
INSERT INTO `estudiante` VALUES ('135', '0221310029', 'RAFAEL GUILLERMO', 'CASTELLAR DEL VALLE');
INSERT INTO `estudiante` VALUES ('136', '0221310005', 'CHARLY', 'CARDEÑO CHAMORRO');
INSERT INTO `estudiante` VALUES ('137', '0221220039', 'CARLOS ANDRES', 'QUEVEDO DIAZ');
INSERT INTO `estudiante` VALUES ('138', '0221220001', 'ALVARO JOSE', 'MEZA HERAZO');
INSERT INTO `estudiante` VALUES ('139', '0221110019', 'PEDRO PABLO', 'ARCE ANAYA');
INSERT INTO `estudiante` VALUES ('140', '0221020018', 'PEDRO JUAN', 'GUERRERO MUÑOZ');
INSERT INTO `estudiante` VALUES ('141', '0221420032', 'AYNEER LUIS', 'GONZALEZ GELES');
INSERT INTO `estudiante` VALUES ('142', '0221410030', 'JAVIER ALBERTO', 'ROA MENDOZA');
INSERT INTO `estudiante` VALUES ('143', '0221410028', 'KAREN JOSÉ', 'BENEDETTI MERLANO');
INSERT INTO `estudiante` VALUES ('144', '0221420031', 'ANDRES FELIPE', 'RODRIGUEZ VELILLA');
INSERT INTO `estudiante` VALUES ('145', '0221420015', 'JOSÉ MAURICIO', 'GUERRERO ESTRADA');
INSERT INTO `estudiante` VALUES ('146', '0221410003', 'JUAN CAMILO', 'REYES ZUÑIGA');
INSERT INTO `estudiante` VALUES ('147', '0221510045', 'ANDY DE JESUS', 'HURTADO LIÑAN');
INSERT INTO `estudiante` VALUES ('148', '0221510009', 'ALVARO DE JESUS', 'ARIZA MACHADO');
INSERT INTO `estudiante` VALUES ('149', '0221420024', 'RAFAEL JOSE', 'MENDOZA RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('150', '0221520039', 'LUIS MIGUEL', 'TORRES BOLAÑO');
INSERT INTO `estudiante` VALUES ('151', '0221520021', 'JUAN PABLO', 'ALBA NAVARRO');
INSERT INTO `estudiante` VALUES ('152', '0221520004', 'ERICK JOSE', 'CANTILLO JIMENEZ');
INSERT INTO `estudiante` VALUES ('153', '0221620033', 'DANIEL DE JESUS', 'TEJEDA PEÑA');
INSERT INTO `estudiante` VALUES ('154', '0221612001', 'ANDRES IVAN', 'MARTINEZ PADILLA');
INSERT INTO `estudiante` VALUES ('155', '0221610058', 'EDWIN ALBERTO', 'GUERRERO ACOSTA');
INSERT INTO `estudiante` VALUES ('156', '0221610039', 'GERARDO ANDRES', 'ESTERILLA ELLES');
INSERT INTO `estudiante` VALUES ('157', '0221610029', 'CAMILO', 'FIGUEROA SUAREZ');
INSERT INTO `estudiante` VALUES ('158', '0221610017', 'CARLOS DANIEL', 'BELLO HERNANDEZ');
INSERT INTO `estudiante` VALUES ('159', '0221610003', 'DANIEL ANDRÉS', 'BOSSIO PÉREZ');
INSERT INTO `estudiante` VALUES ('160', '0221520026', 'LUIS MIGUEL', 'ESPITALETA ALVAREZ');
INSERT INTO `estudiante` VALUES ('161', '0221520019', 'RAFAEL RICARDO', 'CRECIAN RIOS');
INSERT INTO `estudiante` VALUES ('162', '0221420019', 'ALVARO', 'VEGA YANES');
INSERT INTO `estudiante` VALUES ('163', '0221620035', 'JULIO CESAR', 'CARDONA MATURANA');
INSERT INTO `estudiante` VALUES ('164', '0221620034', 'JUAN DIEGO', 'CONTRERAS OLIER');
INSERT INTO `estudiante` VALUES ('165', '0221620032', 'MARCOS RAFAEL', 'PEREZ BETANCOURT');
INSERT INTO `estudiante` VALUES ('166', '0221620023', 'LUIS ANGEL', 'VERTEL SILVA');
INSERT INTO `estudiante` VALUES ('167', '0221620017', 'WUIKLER', 'MARTELO VILLAGRÁN');
INSERT INTO `estudiante` VALUES ('168', '0221620010', 'DEWIN YESID', 'ARRIAGA MENA');
INSERT INTO `estudiante` VALUES ('169', '0221620006', 'DWITH GREGORY', 'NEWBALL DE AVILA');
INSERT INTO `estudiante` VALUES ('170', '0221620002', 'DANNA LUZ', 'MOUTHON  DE LA HOZ');
INSERT INTO `estudiante` VALUES ('171', '0221520041', 'MATEO', 'CARVAJAL JIMENEZ');
INSERT INTO `estudiante` VALUES ('172', '0221520031', 'ROBERTO JOSE', 'RODRIGUEZ FLOREZ');
INSERT INTO `estudiante` VALUES ('173', '0221710049', 'JESUS DAVID', 'MUÑOZ OSORIO');
INSERT INTO `estudiante` VALUES ('174', '0221710047', 'JUAN MARCOS', 'HERNÁNDEZ OROZCO');
INSERT INTO `estudiante` VALUES ('175', '0221710043', 'ARTURO JOSÉ', 'LÓPEZ BARRIOS');
INSERT INTO `estudiante` VALUES ('176', '0221710035', 'GERSON DAVID', 'PEDROZO SALCEDO');
INSERT INTO `estudiante` VALUES ('177', '0221710025', 'JONNATHAN JAVIER', 'AGUDELO VERA');
INSERT INTO `estudiante` VALUES ('178', '0221710023', 'HUMBERTO ENRIQUE', 'LHOESTE CONTRERAS');
INSERT INTO `estudiante` VALUES ('179', '0221010010', 'YEIKARINA', 'CORONELL RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('180', '0221310041', 'LUIS CARLOS', 'HERNANDEZ ORTEGA');
INSERT INTO `estudiante` VALUES ('181', '0221410025', 'JUAN DIEGO', 'BENITEZ ARIAS');
INSERT INTO `estudiante` VALUES ('182', '0221710014', 'MARTIN FELIPE', 'RODRIGUEZ CARABALLO');
INSERT INTO `estudiante` VALUES ('183', '0221520029', 'YOHALCIS', 'PALENCIA PEREIRA');
INSERT INTO `estudiante` VALUES ('184', '0221520030', 'OSCAR ANDRES', 'QUESEDO LOPEZ');
INSERT INTO `estudiante` VALUES ('185', '0221710012', 'LUIS MIGUEL', 'MEJIA MARTINEZ');
INSERT INTO `estudiante` VALUES ('186', '0221620040', 'REYNALDO JOSE', 'DURAN PERTUZ');
INSERT INTO `estudiante` VALUES ('187', '0220720031', 'ONEL', 'ARRIETA ZUÑIGA');
INSERT INTO `estudiante` VALUES ('188', '0220720005', 'YAMID', 'PICO LEAL');
INSERT INTO `estudiante` VALUES ('189', '0221220032', 'ERICK', 'PICO ECHENIQUE');
INSERT INTO `estudiante` VALUES ('190', '0221420042', 'BENJAMIN GABRIEL', 'JIMENEZ LOPEZ');
INSERT INTO `estudiante` VALUES ('191', '0221310044', 'DIEGO ARMANDO', 'GARCIA ALTAMIRANDA');
INSERT INTO `estudiante` VALUES ('192', '0221420009', 'CRISTIAN CAMILO', 'PUENTE FERRER');
INSERT INTO `estudiante` VALUES ('193', '0220910024', 'ORLANDO VICENTE', 'BUSTAMANTE SANTANDER');
INSERT INTO `estudiante` VALUES ('194', '0220910026', 'JAIME DAVID', 'DIAZ ARROYO');
INSERT INTO `estudiante` VALUES ('195', '0221120003', 'JESÚS DAVID', 'PIMIENTA PICO');
INSERT INTO `estudiante` VALUES ('196', '0221510013', 'HUMBERTO ADOLFO', 'LEAL BETANCUR');
INSERT INTO `estudiante` VALUES ('197', '0221410044', 'RICHARD DAVID', 'DE LA ROSA MARTINEZ');
INSERT INTO `estudiante` VALUES ('198', '0221510022', 'WILDER ADOLFO', 'PEREZ AMADOR');
INSERT INTO `estudiante` VALUES ('199', '0221510041', 'RAFAEL ANTONIO', 'HERRERA JURADO');
INSERT INTO `estudiante` VALUES ('200', '0221120044', 'JAVIER EDUARDO', 'SOLANO GUZMAN');
INSERT INTO `estudiante` VALUES ('201', '0221220040', 'RICARDO JOSE', 'DIAZ HERRERA');
INSERT INTO `estudiante` VALUES ('202', '0221520009', 'NICOLAS ALBEIRO', 'TAMAYO CASTILLA');
INSERT INTO `estudiante` VALUES ('203', '0221510035', 'JUAN MAURICIO', 'TORRES PERÉZ');
INSERT INTO `estudiante` VALUES ('204', '0221410052', 'JENNIFFER HELENA', 'ALVAREZ PUELLO');
INSERT INTO `estudiante` VALUES ('205', '0221620015', 'BRAYAN DAVIS', 'BOHORQUEZ GONZALEZ');
INSERT INTO `estudiante` VALUES ('206', '0221020048', 'JHANIO ALFONSO', 'JIMENEZ CARMONA');
INSERT INTO `estudiante` VALUES ('207', '0221020011', 'LUIS PABLO', 'ROJAS HERRERA');
INSERT INTO `estudiante` VALUES ('208', '0221210002', 'JOSIAS DANIEL', 'MONTOYA CAMPO');
INSERT INTO `estudiante` VALUES ('209', '0221210003', 'EDGAR ENRIQUE', 'JIMÉNEZ GARCÍA');
INSERT INTO `estudiante` VALUES ('210', '0221710053', 'EDWIN ENRIQUE', 'MIRANDA PALENCIA');
INSERT INTO `estudiante` VALUES ('211', '0221210041', 'JUAN JOSÉ', 'SARABIA CAFFRONI');
INSERT INTO `estudiante` VALUES ('212', '0221710052', 'DIEGO FERNANDO', 'JARAMILLO ABSIL');
INSERT INTO `estudiante` VALUES ('213', '0221210010', 'DANIEL ANDRES', 'OROZCO MENDEZ');
INSERT INTO `estudiante` VALUES ('214', '0221210017', 'JAVIER DAVID', 'CASTILLO BELTRAN');
INSERT INTO `estudiante` VALUES ('215', '0220820052', 'IVAN JOSE', 'VILLAMIL OCHOA');
INSERT INTO `estudiante` VALUES ('216', '0221220025', 'YEIFER DUVAN', 'GOMEZ GONZALEZ');
INSERT INTO `estudiante` VALUES ('217', '0221220046', 'DANIEL EDUARDO', 'ALVEAR ARTUZ');
INSERT INTO `estudiante` VALUES ('218', '0221520020', 'JESUS ANTONIO', 'MARTINEZ PARRA');
INSERT INTO `estudiante` VALUES ('219', '0221320007', 'ARIEL JOSE', 'ARNEDO CERVANTES');
INSERT INTO `estudiante` VALUES ('220', '0221610070', 'JAVIER CAMILO', 'DELGADO CABALLERO');
INSERT INTO `estudiante` VALUES ('221', '0221110043', 'JUAN DAVID', 'VERGARA DE LEON');
INSERT INTO `estudiante` VALUES ('222', '0221410008', 'RAMIRO JOSE', 'VERBEL DE LA ROSA');
INSERT INTO `estudiante` VALUES ('223', '0221220023', 'JESUS DAVID', 'ESCOBAR LASCARRO');
INSERT INTO `estudiante` VALUES ('224', '0221020042', 'DIUNYS', 'DIAZ ALTAMAR');
INSERT INTO `estudiante` VALUES ('225', '0221210007', 'CARLOS EDUARDO', 'BECERRA MEJÍA');
INSERT INTO `estudiante` VALUES ('226', '0221320038', 'PEDRO ANTONIO', 'ORTIZ MONTIEL');
INSERT INTO `estudiante` VALUES ('227', '0221629001', 'RYAN NICHOLAI', 'FORBES SANTIAGO');
INSERT INTO `estudiante` VALUES ('228', '0221620030', 'RONALDO JOSÉ', 'AGÁMEZ DE HOYOS');
INSERT INTO `estudiante` VALUES ('229', '0221710056', 'JUAN CAMILO', 'GARCIA PEÑA');
INSERT INTO `estudiante` VALUES ('230', '0221520018', 'CAMILO ANDRES', 'PÉREZ JIMÉNEZ');
INSERT INTO `estudiante` VALUES ('231', '0220910030', 'MANUEL ADOLFO', 'OCHOA DIAZ');
INSERT INTO `estudiante` VALUES ('232', '0221110012', 'JORGE LUIS', 'CARBAL YEPES');
INSERT INTO `estudiante` VALUES ('233', '0221620001', 'KENNY FABIAN', 'ALDAVES OCHOA');
INSERT INTO `estudiante` VALUES ('234', '0221310031', 'CARLOS ANDRES', 'ELGUEDO PADILLA');
INSERT INTO `estudiante` VALUES ('235', '0221610037', 'KEVIN DANIEL', 'MARTINEZ ACEVEDO');
INSERT INTO `estudiante` VALUES ('236', '0221210039', 'IVAN DARIO', 'FLOREZ GUERRERO');
INSERT INTO `estudiante` VALUES ('237', '0221210009', 'JESUS MANUEL', 'QUINTANA MARTINEZ');
INSERT INTO `estudiante` VALUES ('238', '0221010028', 'LUIS ALFONSO', 'LENES SALAS');
INSERT INTO `estudiante` VALUES ('239', '0221320040', 'MARTIN ELIAS', 'ECHAVEZ MEZA');
INSERT INTO `estudiante` VALUES ('240', '0221620038', 'LUIS CARLOS', 'BUELVAS MÉNDEZ');
INSERT INTO `estudiante` VALUES ('241', '0221610063', 'ELKIN DAVID', 'TORRES VENERA');
INSERT INTO `estudiante` VALUES ('242', '0220920002', 'CARLOS ARTURO', 'TATIS GORDON');
INSERT INTO `estudiante` VALUES ('243', '0221110031', 'ERICK ELOY', 'WILCHES TRUJILLO');
INSERT INTO `estudiante` VALUES ('244', '0221420022', 'OSCAR DAVID', 'GAMARRA OLASCUAGA');
INSERT INTO `estudiante` VALUES ('245', '0221420037', 'ANA MARIA', 'PRIETO ROMERO');
INSERT INTO `estudiante` VALUES ('246', '0221320017', 'ELIO ANGEL', 'MARRUGO CANTILLO');
INSERT INTO `estudiante` VALUES ('247', '0221210027', 'ESTEBAN RAFAEL', 'TRIVIÑO GUERRA');
INSERT INTO `estudiante` VALUES ('248', '0220910041', 'MELISSA ANDREA', 'OROZCO ACEVEDO');
INSERT INTO `estudiante` VALUES ('249', '0221110037', 'KEVIN ALON', 'YAU LAI');
INSERT INTO `estudiante` VALUES ('250', '0221210012', 'JESUS DAVID', 'MARTINEZ CAUSIL');
INSERT INTO `estudiante` VALUES ('251', '0221220018', 'ALVARO JAVIER', 'MARTINEZ ZULUAGA');
INSERT INTO `estudiante` VALUES ('252', '0221010004', 'DANNA VANESSA', 'DOLUGAR MARRUGO');
INSERT INTO `estudiante` VALUES ('253', '0221510011', 'JESUS ALBERTO', 'AGAMEZ SIERRA');
INSERT INTO `estudiante` VALUES ('254', '0221310022', 'DANIEL ERNESTO', 'REYES BETANCOURT');
INSERT INTO `estudiante` VALUES ('255', '0221620051', 'JESUS DAVID', 'TORRES MARTINEZ');
INSERT INTO `estudiante` VALUES ('256', '0220820035', 'JUAN ALBERTO', 'ACOSTA TORRES');
INSERT INTO `estudiante` VALUES ('257', '0221110001', 'FERNANDO DE JESUS', 'CASTILLA OSPINA');
INSERT INTO `estudiante` VALUES ('258', '0221710026', 'LESLIE LISETH', 'MORALES CÁSSERES');
INSERT INTO `estudiante` VALUES ('259', '0220620334', 'LEIMAN ALFONSO', 'MEJIA MAURY');
INSERT INTO `estudiante` VALUES ('260', '0221220021', 'JESUS DAVID', 'RIONDO HERAZO');
INSERT INTO `estudiante` VALUES ('261', '0221210011', 'JORGE ANTONIO', 'BLANCO HERRERA');
INSERT INTO `estudiante` VALUES ('262', '0221612002', 'DANIEL DAVID', 'YEPES GONZALEZ');
INSERT INTO `estudiante` VALUES ('263', '0221710028', 'CAMILO ENRIQUE', 'VARGAS SALAZAR');
INSERT INTO `estudiante` VALUES ('264', '0221710033', 'LUIS JAVIER', 'VARGAS HERAZO');
INSERT INTO `estudiante` VALUES ('265', '0221710027', 'ROMEL DE JESUS', 'VALVERDE ESPINOSA');
INSERT INTO `estudiante` VALUES ('266', '0221710020', 'JAIDER JAVITH', 'VALLEJO ALVAREZ');
INSERT INTO `estudiante` VALUES ('267', '0221710031', 'ANDRES FELIPE', 'TORRES PADILLA');
INSERT INTO `estudiante` VALUES ('268', '0221620027', 'ELIUD ENRIQUE', 'MATOS CARMONA');
INSERT INTO `estudiante` VALUES ('269', '0221710022', 'ALEJANDRO ENRIQUE', 'SALCEDO CARABALLO');
INSERT INTO `estudiante` VALUES ('270', '0221610064', 'ELOY JOSE', 'BANQUET VASQUEZ');
INSERT INTO `estudiante` VALUES ('271', '0221710055', 'MARIO ALBERTO', 'REYES DE LA ROSA');
INSERT INTO `estudiante` VALUES ('272', '0221710004', 'ELIAN JOSE', 'MORALES ESCORCIA');
INSERT INTO `estudiante` VALUES ('273', '0221710008', 'FABIAN JOSE', 'MONTES FERNANDEZ');
INSERT INTO `estudiante` VALUES ('274', '0221710048', 'AIRYANCE', 'MAZO RUIDIAZ');
INSERT INTO `estudiante` VALUES ('275', '0221710015', 'ALEJANDRO JOSE', 'FONSECA PATERNINA');
INSERT INTO `estudiante` VALUES ('276', '0221710039', 'SEBASTIAN JOSE', 'DIAZ MARTINEZ');
INSERT INTO `estudiante` VALUES ('277', '0221710051', 'ANTONIO JOSE', 'DE LAVALLE OSPINO');
INSERT INTO `estudiante` VALUES ('278', '0221710040', 'ANTONIO JOSE', 'CORTES SAMPAYO');
INSERT INTO `estudiante` VALUES ('279', '0221710029', 'LEONEL JESID', 'CORREA SOLANO');
INSERT INTO `estudiante` VALUES ('280', '0221710030', 'JUAN DIEGO', 'BERDUGO ROMERO');
INSERT INTO `estudiante` VALUES ('281', '0221710041', 'ALEXIS ALEXANDER', 'BEDOYA ARIAS');
INSERT INTO `estudiante` VALUES ('282', '0221710045', 'RAFAEL MIGUEL', 'BARRIOS MORALES');
INSERT INTO `estudiante` VALUES ('283', '0221110021', 'RAFAEL EDUARDO', 'PEDROZA MANGA');
INSERT INTO `estudiante` VALUES ('284', '0221710046', 'ÁLVARO ANDRÉS', 'ÁLVAREZ ALARCÓN');
INSERT INTO `estudiante` VALUES ('285', '0221710006', 'JESUS DAVID', 'ARCINIEGAS MERCADO');
INSERT INTO `estudiante` VALUES ('286', '0221710038', 'RAMIRO ANDRÉS', 'ALCALÁ GÓMEZ');
INSERT INTO `estudiante` VALUES ('287', '0221310030', 'NAREN DAVID', 'DE AVILA JULIO');
INSERT INTO `estudiante` VALUES ('288', '0221110035', 'JOSE ANTONIO', 'TAMARA FUENTES');
INSERT INTO `estudiante` VALUES ('289', '0221620042', 'KEVIN ENRIQUE', 'ARRIETA ZABALETA');
INSERT INTO `estudiante` VALUES ('290', '0221220013', 'JOSHUA ISAAC', 'MARIMONT LARA');
INSERT INTO `estudiante` VALUES ('291', '0221620008', 'KEILER CAMILO', 'TORRENTE PATRON');
INSERT INTO `estudiante` VALUES ('292', '0221610026', 'DUVAN ALEXANDER', 'CUADRO BABILONIA');
INSERT INTO `estudiante` VALUES ('293', '0220820025', 'HAROLD FABIAN', 'SOLORZANO PEÑA');
INSERT INTO `estudiante` VALUES ('294', '0221210043', 'ELIAS DAVID', 'ZABALETA CORREA');
INSERT INTO `estudiante` VALUES ('295', '0221620004', 'WILMER', 'LLAMAS RENZA');
INSERT INTO `estudiante` VALUES ('296', '0221310013', 'MARIA ALEJANDRA', 'HERRERA MENDOZA');
INSERT INTO `estudiante` VALUES ('297', '0221010027', 'GERMAN EDUARDO', 'MESTRE RAMOS');
INSERT INTO `estudiante` VALUES ('298', '0221120015', 'JUAN JOSE', 'MORAD FERNANDEZ');
INSERT INTO `estudiante` VALUES ('299', '0221620019', 'ALBERTO LUIGI', 'ANDREINI NOGUERA');
INSERT INTO `estudiante` VALUES ('300', '0221520036', 'MAURICIO ANDRES', 'JUKOPILA JIMENEZ');
INSERT INTO `estudiante` VALUES ('301', '0221210023', 'JEYMARSON JOEL', 'GARCÍA SANMARTÍN');
INSERT INTO `estudiante` VALUES ('302', '0221410043', 'MIRANIA PAOLA', 'VILLAFAÑE CASTILLA');
INSERT INTO `estudiante` VALUES ('303', '0221620016', 'ESTEBAN DAVID', 'ARTEAGA ESCOBAR');
INSERT INTO `estudiante` VALUES ('304', '0220820040', 'ALEXANDER', 'MORALES CANO');
INSERT INTO `estudiante` VALUES ('305', '0221420030', 'DEIMER ANTONIO', 'ROMERO MADERA');
INSERT INTO `estudiante` VALUES ('306', '0221620005', 'HECTOR LUIS', 'OREJUELA RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('307', '0221410021', 'CARLOS ARTURO', 'CARBAL ROJANO');
INSERT INTO `estudiante` VALUES ('308', '0221610016', 'RAY SEBASTIAN DE JESUS', 'GONZALEZ PUELLO');
INSERT INTO `estudiante` VALUES ('309', '0221210006', 'ALBERTO JOSE', 'URUETA CABEZA');
INSERT INTO `estudiante` VALUES ('310', '0221620039', 'ELMER', 'COMAS RAMOS');
INSERT INTO `estudiante` VALUES ('311', '0221410024', 'HAROLD ADRIÁN', 'PEÑA RAMÍREZ');
INSERT INTO `estudiante` VALUES ('312', '0221620047', 'ANDRÉS CAMILO', 'MUÑOZ CARVAL');
INSERT INTO `estudiante` VALUES ('313', '0221412001', 'GABRIEL ENRIQUE', 'RIBON TORRES');
INSERT INTO `estudiante` VALUES ('314', '0221610035', 'NEDER MIGUEL', 'LEON GONZALEZ');
INSERT INTO `estudiante` VALUES ('315', '0221610067', 'CAMILO ANDRES', 'FARIA ZABALETA');
INSERT INTO `estudiante` VALUES ('316', '0221510028', 'CRISTOBAL DE JESUS', 'PADILLA RUIZ');
INSERT INTO `estudiante` VALUES ('317', '0221620007', 'DANIEL JESUS', 'ANZOATEGUI GOMEZ');
INSERT INTO `estudiante` VALUES ('318', '0221120030', 'LUIS MIGUEL', 'RUIZ HERNANDEZ');
INSERT INTO `estudiante` VALUES ('319', '0221410032', 'DEYVIS MIGUEL', 'CASTILLO CORREA');
INSERT INTO `estudiante` VALUES ('320', '0221010036', 'HECTOR LUIS', 'POSADA YEPEZ');
INSERT INTO `estudiante` VALUES ('321', '0221520025', 'CELINDA ISABEL', 'CUETO DE LA HOZ');
INSERT INTO `estudiante` VALUES ('322', '0221410015', 'MARIALEJANDRA', 'TORRENEGRA ANAYA');
INSERT INTO `estudiante` VALUES ('323', '0221620029', 'JAVIER FELIPE', 'ORTIZ BRUN');
INSERT INTO `estudiante` VALUES ('324', '0221110009', 'ANTONIO JOSE', 'ANGULO PADILLA');
INSERT INTO `estudiante` VALUES ('325', '0221010039', 'ROMARIO SENEN', 'LOPEZ IBARRA');
INSERT INTO `estudiante` VALUES ('326', '0221620037', 'LOANS', 'RICARDO MARTINEZ');
INSERT INTO `estudiante` VALUES ('327', '0221620012', 'ELKIN MANUEL', 'DIAZ ANGULO');
INSERT INTO `estudiante` VALUES ('328', '0221220028', 'ANDRES DAVID', 'MEJIA ZARZA');
INSERT INTO `estudiante` VALUES ('329', '0221310002', 'EMMANUEL DE JESUS', 'MARTINEZ FRANCO');
INSERT INTO `estudiante` VALUES ('330', '0221510038', 'LUIS MIGUEL', 'GUERRA GAMERO');
INSERT INTO `estudiante` VALUES ('331', '0221420003', 'CAMILO ANDRÉS', 'ROSALES MARRAUI');
INSERT INTO `estudiante` VALUES ('332', '0221420044', 'ALDIS MANUEL', 'ALMEIDA CARRASQUILLA');
INSERT INTO `estudiante` VALUES ('333', '0221510024', 'SANTIAGO', 'RHENALS RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('334', '0221320018', 'TEO MAYERLY', 'LONDOÑO GUERRERO');
INSERT INTO `estudiante` VALUES ('335', '0221010042', 'JUAN CARLOS', 'BUSTAMANTE MONTES');
INSERT INTO `estudiante` VALUES ('336', '0221620022', 'BRYAN RAFAEL', 'RAMOS OSUNA');
INSERT INTO `estudiante` VALUES ('337', '0221610011', 'ARLEYS', 'ROCA VARGAS');
INSERT INTO `estudiante` VALUES ('338', '0221320008', 'LOREDANA', 'MARTINEZ PATERNINA');
INSERT INTO `estudiante` VALUES ('339', '0221520014', 'OMAR ANDRES', 'ARRIETA NAVARRO');
INSERT INTO `estudiante` VALUES ('340', '0221610038', 'DIANIS JESUS', 'CALVO TILVEZ');
INSERT INTO `estudiante` VALUES ('341', '0221520010', 'DANIELA ANDREA', 'RAMIREZ PALENCIA');
INSERT INTO `estudiante` VALUES ('342', '0221220037', 'LUIS ENRIQUE', 'CONSUEGRA ARRIETA');
INSERT INTO `estudiante` VALUES ('343', '0221320011', 'STEFANY DEL CARMEN', 'RAMOS CASTRO');
INSERT INTO `estudiante` VALUES ('344', '0221420020', 'EDBER RICARDO', 'TABOADA NARANJO');
INSERT INTO `estudiante` VALUES ('345', '0221510008', 'CARLOS MARIO', 'ARRIETA TAPIA');
INSERT INTO `estudiante` VALUES ('346', '0221510050', 'JUAN SEBASTIAN', 'MORALES PUELLO');
INSERT INTO `estudiante` VALUES ('347', '0221610048', 'CARLOS MANUEL', 'GUTIERREZ PEREIRA');
INSERT INTO `estudiante` VALUES ('348', '0221220003', 'ALEXANDER RAFAEL', 'SILVERA CHARRIS');
INSERT INTO `estudiante` VALUES ('349', '0221610023', 'RONALD', 'PATERNINA CASTRO');
INSERT INTO `estudiante` VALUES ('350', '0221310001', 'DANIEL SANTIAGO', 'VILLALOBOS ESCOBAR');
INSERT INTO `estudiante` VALUES ('351', '0221210022', 'BORIS FERNANDO', 'QUINTANA FAJARDO');
INSERT INTO `estudiante` VALUES ('352', '0221210008', 'IVAN DARIO', 'CUADRO GUZMAN');
INSERT INTO `estudiante` VALUES ('353', '0221120002', 'JESUS DAVID', 'GIL BERDUGO');
INSERT INTO `estudiante` VALUES ('354', '0221110040', 'BRAYAN', 'BATISTA ZUÑIGA');
INSERT INTO `estudiante` VALUES ('355', '0221110024', 'DANIEL EDUARDO', 'ACOSTA CONTRERAS');
INSERT INTO `estudiante` VALUES ('356', '0221110023', 'DANIEL JOSE', 'CARRILLO HERRERA');
INSERT INTO `estudiante` VALUES ('357', '0220820030', 'CRISTIAN RAFAEL', 'TRUJILLO ZULETA');
INSERT INTO `estudiante` VALUES ('358', '0221320013', 'KATIUSCA', 'HERRERA FRANCO');
INSERT INTO `estudiante` VALUES ('359', '0221320005', 'ASTRID CAROLINA', 'VANEGAS CHINCHILLA');
INSERT INTO `estudiante` VALUES ('360', '0221310027', 'CRISTIAN ISAAC', 'ARRIETA PACHECO');
INSERT INTO `estudiante` VALUES ('361', '0221310017', 'JORGE ISAACS', 'CHAGUI ROMERO');
INSERT INTO `estudiante` VALUES ('362', '0221310011', 'JAIR JOSE', 'SUAREZ LOPEZ');
INSERT INTO `estudiante` VALUES ('363', '0221410014', 'ENGELH RAFAEL', 'DE LA BARRERA JIMENEZ');
INSERT INTO `estudiante` VALUES ('364', '0221120009', 'DAVID JAVIER', 'ANILLO LORA');
INSERT INTO `estudiante` VALUES ('365', '0221710016', 'KEVIN DAVID', 'RANGEL JIMENEZ');
INSERT INTO `estudiante` VALUES ('366', '0221120037', 'PEDRO YAIR', 'CARABALLO VALLEJO');
INSERT INTO `estudiante` VALUES ('367', '0221710013', 'DANIEL ESTEBAN', 'PERIÑAN VILLEGAS');
INSERT INTO `estudiante` VALUES ('368', '0221710054', 'JAIRO ALBERTO', 'PEREZ GUERRERO');
INSERT INTO `estudiante` VALUES ('369', '0221710037', 'YADERSON JESUS', 'PATIÑO VIDAL');
INSERT INTO `estudiante` VALUES ('370', '0221710019', 'SAMUEL ANDRÉS', 'PALOMO ARAPÉ');
INSERT INTO `estudiante` VALUES ('371', '0221710042', 'NICOLAS ESTEBAN', 'OLARTE SANDOVAL');
INSERT INTO `estudiante` VALUES ('372', '0221410002', 'ANDRES FELIPE', 'LOPEZ DURAN');
INSERT INTO `estudiante` VALUES ('373', '0221610046', 'MARIA ISABEL', 'FAWCETT SALCEDO');
INSERT INTO `estudiante` VALUES ('374', '0221610006', 'ANDRES FELIPE', 'VIZCAINO SALAZAR');
INSERT INTO `estudiante` VALUES ('375', '0221320028', 'JAIDER', 'VERGARA UTRIA');
INSERT INTO `estudiante` VALUES ('376', '0221410007', 'OMAR DAVID', 'GUERRERO JIMENEZ');
INSERT INTO `estudiante` VALUES ('377', '0221618001', 'FRANCISCO JAVIER', 'SCHOLBORGH QUINTERO');
INSERT INTO `estudiante` VALUES ('378', '0221320043', 'JESUS DAVID', 'BARAJAS GONZALEZ');
INSERT INTO `estudiante` VALUES ('379', '0221420010', 'FERNANDO', 'BELTRAN GOMEZ');
INSERT INTO `estudiante` VALUES ('380', '0221420025', 'RICHARD ALBERTO', 'CAMACHO HERNANDEZ');
INSERT INTO `estudiante` VALUES ('381', '0221320019', 'ANDRES CAMILO', 'RAMIREZ JIMENEZ');
INSERT INTO `estudiante` VALUES ('382', '0221110005', 'JESUS DAVID', 'PRASCA BUSTOS');
INSERT INTO `estudiante` VALUES ('383', '0221520017', 'KENNETH DE JESUS', 'MARTINEZ ESPITIA');
INSERT INTO `estudiante` VALUES ('384', '0221620048', 'YOMALIS', 'CARABALLOCHAVEZ');
INSERT INTO `estudiante` VALUES ('385', '0221120010', 'JORGE ELIECER', 'CARO OLMOS');
INSERT INTO `estudiante` VALUES ('386', '0221210030', 'JOAN  MANUEL', 'THERAN BURGOS');
INSERT INTO `estudiante` VALUES ('387', '0221310024', 'EVER', 'CABARCAS MALLARINO');
INSERT INTO `estudiante` VALUES ('388', '0221310003', 'JONATHAN CAMILO', 'CANTILLO GUERRERO');
INSERT INTO `estudiante` VALUES ('389', '0221510056', 'BRANDON', 'PEREZ  HERRERA');
INSERT INTO `estudiante` VALUES ('390', '0221510020', 'JORGE ALFONSO', 'MARÍN GÓNGORA');
INSERT INTO `estudiante` VALUES ('391', '0221510044', 'HAROLD ANDRES', 'REYES PADILLA');
INSERT INTO `estudiante` VALUES ('392', '0221620028', 'LEINER YESID', 'SORACA GUEVARA');
INSERT INTO `estudiante` VALUES ('393', '0221620045', 'DIEGO ANDRES', 'MARTINEZ MARTINEZ');
INSERT INTO `estudiante` VALUES ('394', '0221620021', 'JESUS ALBERTO', 'MORALES RICO');
INSERT INTO `estudiante` VALUES ('395', '0221520037', 'SILFREDO', 'RIVERA RODRIGUEZ');
INSERT INTO `estudiante` VALUES ('396', '0221620018', 'LEONEL', 'PAJARO CASTAÑO');
INSERT INTO `estudiante` VALUES ('397', '0221620044', 'ERICK JHOAN', 'GUERRERO COGOLLO');
INSERT INTO `estudiante` VALUES ('398', '0221620049', 'JEAN CARLOS', 'HERNANDEZ ESPINOSA');
INSERT INTO `estudiante` VALUES ('399', '0221520046', 'EDUARDO LUIS', 'CARRILLO RAMIREZ');
INSERT INTO `estudiante` VALUES ('400', '0221520043', 'DIEGO JESUS', 'POSADA MARTÍNEZ');
INSERT INTO `estudiante` VALUES ('401', '0221520034', 'OSVALDO MIGUEL', 'OYAGA GULLOSO');
INSERT INTO `estudiante` VALUES ('402', '0221510003', 'JESUS DAVID', 'PUELLO FUENTES');
INSERT INTO `estudiante` VALUES ('403', '0221610043', 'MALENA SOFIA', 'ALTAMIRANDA DE ARCO');
INSERT INTO `estudiante` VALUES ('404', '0221420002', 'DAVID JOSÉ', 'GARCÉS CONDE');
INSERT INTO `estudiante` VALUES ('405', '0221520006', 'LUIS ANDRES', 'AGUDELO PADILLA');
INSERT INTO `estudiante` VALUES ('406', '0221510021', 'CAMILO ANDRES', 'FONSECA VILLAMIZAR');
INSERT INTO `estudiante` VALUES ('407', '0221310020', 'JOHNNY JOHNNY', 'LUNA URANGO');
INSERT INTO `estudiante` VALUES ('408', '0221610018', 'SIXTO MANUEL', 'FIGUEROA REYES');
INSERT INTO `estudiante` VALUES ('409', '0221220033', 'ALBERTO ENRRIQUE', 'SERRANO TORRES');
INSERT INTO `estudiante` VALUES ('410', '0221320015', 'JORGE MARIO', 'HERNANDEZ BEUFFORD');
INSERT INTO `estudiante` VALUES ('411', '0221610032', 'VALERIA DEL CARMEN', 'DEL CAMPO MUÑOZ');
INSERT INTO `estudiante` VALUES ('412', '0221610021', 'LUIS ANGEL', 'RODRIGUEZ VALDELAMAR');
INSERT INTO `estudiante` VALUES ('413', '0221210013', 'EMERSON RAFAEL', 'HERRERA DIAZ');
INSERT INTO `estudiante` VALUES ('414', '0221520013', 'SERGIO ANDRES', 'GARCIA BARRIOS');
INSERT INTO `estudiante` VALUES ('415', '0221521002', 'JUAN JOSE', 'POLO MELENDEZ');
INSERT INTO `estudiante` VALUES ('416', '0221420008', 'JORGE ANDRÉS', 'CASTRO CARABALLO');
INSERT INTO `estudiante` VALUES ('417', '0221510010', 'JESÚS ALBERTO', 'DE LOS REYES MADRID');
INSERT INTO `estudiante` VALUES ('418', '0221520007', 'JAIR', 'CALDERON VELAIDES');
INSERT INTO `estudiante` VALUES ('419', '0221620011', 'JHON ALEXANDER', 'NORIEGA LÓPEZ');
INSERT INTO `estudiante` VALUES ('420', '0221620036', 'LUIS FELIPE', 'PENICHE VARGAS');
INSERT INTO `estudiante` VALUES ('421', '0221320034', 'ORLEY ARTURO', 'SALGADO ORTEGA');
INSERT INTO `estudiante` VALUES ('422', '0221220006', 'SEBASTIAN FELIPE', 'BARON CAICEDO');
INSERT INTO `estudiante` VALUES ('423', '0221310036', 'JOSHUA', 'PUELLO PADILLA');
INSERT INTO `estudiante` VALUES ('424', '0221320024', 'ERICK IVAN', 'BARCASNEGRAS ORTIZ');
INSERT INTO `estudiante` VALUES ('425', '0221520047', 'JESUS EDUARDO', 'CONSUEGRA FONTALVO');
INSERT INTO `estudiante` VALUES ('426', '0221120007', 'JHONATAN', 'URIBE ECHENIQUE');
INSERT INTO `estudiante` VALUES ('427', '0221510049', 'ANDRÉS FELIPE', 'MONTESINOS BROCHERO');
INSERT INTO `estudiante` VALUES ('428', '0221610024', 'NELSON DAVID', 'HERNANDEZ BADEL');
INSERT INTO `estudiante` VALUES ('429', '0221510058', 'CAMILO JOSÉ', 'ACOSTA MUÑOZ');
INSERT INTO `estudiante` VALUES ('430', '0221520032', 'LUIS ANGEL', 'VALIENTE VIVANCO');
INSERT INTO `estudiante` VALUES ('431', '0221620009', 'SEBASTIAN ADOLFO', 'YARZAGARAY DEL VALLE');
INSERT INTO `estudiante` VALUES ('432', '0221420007', 'PABLO EMILIO', 'PUPO MARCHENA');
INSERT INTO `estudiante` VALUES ('433', '0221420033', 'FABIAN CAMILO', 'PICO FLOREZ');
INSERT INTO `estudiante` VALUES ('434', '0221520005', 'ADRIANA CRISTINA', 'OTERO TRUAQUERO');
INSERT INTO `estudiante` VALUES ('435', '0221520011', 'CARLOS JAVIER', 'ALCALA OROZCO');
INSERT INTO `estudiante` VALUES ('436', '0221610065', 'JOSE GREGORIO', 'HERNANDEZ ARIAS');
INSERT INTO `estudiante` VALUES ('437', '0221620046', 'JHON FREDY', 'OSPINO NAVARRO');
INSERT INTO `estudiante` VALUES ('438', '0221320044', 'WILLIAN ANDRES', 'DE LA ESPRIELLA AVILA');
INSERT INTO `estudiante` VALUES ('439', '0221520023', 'JESUS', 'LLERENA CABRERA');
INSERT INTO `estudiante` VALUES ('440', '0221420034', 'DAVID ENRIQUE', 'PADILLA FONSECA');
INSERT INTO `estudiante` VALUES ('441', '0221310009', 'JOSE DAVID', 'LUDIAN COHEN');
INSERT INTO `estudiante` VALUES ('442', '0221420026', 'DAVID EDUARDO', 'CERMEÑO PINZON');
INSERT INTO `estudiante` VALUES ('443', '0221310026', 'ALAN', 'MARQUEZ ESCORCIA');
INSERT INTO `estudiante` VALUES ('444', '0221310038', 'JUAN CAMILO', 'TEJADA PORTO');
INSERT INTO `estudiante` VALUES ('445', '0221610040', 'LUIS DANIEL', 'CASTELLAR ARIAS');
INSERT INTO `estudiante` VALUES ('446', '0221010026', 'ISMAEL', 'SAYAS ARRIETA');
INSERT INTO `estudiante` VALUES ('447', '0221520024', 'MARCOS ANDRES', 'PEREZ PADILLA');
INSERT INTO `estudiante` VALUES ('448', '0221520042', 'EMANUEL RICARDO', 'SIERRA MUENTES');
INSERT INTO `estudiante` VALUES ('449', '0221110047', 'OSMAR', 'PEÑA GONZALEZ');
INSERT INTO `estudiante` VALUES ('450', '0221510029', 'DANIEL ENRIQUE', 'POMBO ORTEGA');
INSERT INTO `estudiante` VALUES ('451', '0221610068', 'EDGAR ORLANDO', 'HERRERA BORRAEZ');
INSERT INTO `estudiante` VALUES ('452', '0221120006', 'JAIME JOSE', 'HERRERA PETRO');
INSERT INTO `estudiante` VALUES ('453', '0221710034', 'MARIA DE LOS ANGELES', 'GOMEZ GUZMAN');
INSERT INTO `estudiante` VALUES ('454', '0221710032', 'ADRIAN HASSEK', 'GONZALEZ OROBIO');
INSERT INTO `estudiante` VALUES ('455', '0221710005', 'SEBASTIAN', 'HERNANDEZ PEREZ');
INSERT INTO `estudiante` VALUES ('456', '0221710021', 'CRISTIAN DAVID', 'BARRIOS ESCOBAR');
INSERT INTO `estudiante` VALUES ('457', '0221710018', 'CRISTIAN', 'HERNÁNDEZ GARAY');
INSERT INTO `estudiante` VALUES ('458', '0221710011', 'JOSE CARLOS', 'GARCÍA VÉLEZ');
INSERT INTO `estudiante` VALUES ('459', '0221710044', 'CRISTIAN ANTONIO', 'BARRIOS ARRIETA');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES ('1', 'DEPARTAMENTO DE CIENCIAS SOCIALES');
INSERT INTO `facultad` VALUES ('4', 'FACULTAD DE CIENCIAS NAVALES Y NÁUTICAS');
INSERT INTO `facultad` VALUES ('7', 'FACULTAD DE OCEANOGRAFÍA');
INSERT INTO `facultad` VALUES ('9', 'FACULTAD DE INGENIERÍA');
INSERT INTO `facultad` VALUES ('10', 'FACULTAD DE ADMINISTRACIÓN MARÍTIMA');
INSERT INTO `facultad` VALUES ('11', 'FACULTAD DE INFANTERÍA DE MARINA');
INSERT INTO `facultad` VALUES ('12', 'DEPARTAMENTO DE CIENCIAS BÁSICAS');

-- ----------------------------
-- Table structure for graduado
-- ----------------------------
DROP TABLE IF EXISTS `graduado`;
CREATE TABLE `graduado` (
  `idgraduado` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graduado
-- ----------------------------
INSERT INTO `graduado` VALUES ('1', 'Merly', 'Patrcia', 'Liñan', 'Jaraba', 'CC', '33101730', 'OFICIAL', '2', 'GRADUADO', '2016-12-15', 'mlinanj@enap.com', '3001234567', 'canapote', 'Universidad de Cartagena', 'Jefe de División');
INSERT INTO `graduado` VALUES ('2', 'Alix', 'Patricia', 'Anaya', 'Quiroz', 'CC', '10471234854', 'CIVIL', '2', 'GRADUADO', '2016-11-30', 'alix@gmail.com', '3001234567', 'torices calle 1 carrera 3 #24A', 'CBI', 'Coordinador de Almacen');
INSERT INTO `graduado` VALUES ('3', 'GERMAN', '', 'PAEZ', 'RODRIGUEZ', 'CC', '1143354250', 'CIVIL', '1', 'EGRESADO', null, 'gaezr@hotmail.com', '6677056', 'NUEVO BOSQUE M5 LT29 4OETP', 'Base Naval', 'SUPERVISOR');
INSERT INTO `graduado` VALUES ('4', 'LILIANA', 'MARIA', 'MOSCOTE', 'SALCEDO', 'CC', '1047419316', 'MERCANTE', '1', 'EGRESADO', null, 'LILIANYS8@HOTMAIL.COM', '3007066104', 'altos de san isidro Mz P lote 29', 'Cotecmar', 'Gerente');

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
INSERT INTO `permisos` VALUES ('37', 'Listar Graduados');
INSERT INTO `permisos` VALUES ('38', 'Crear Graduados');
INSERT INTO `permisos` VALUES ('39', 'Editar Graduados');

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
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `nivel_max_formacion` varchar(45) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profesor
-- ----------------------------
INSERT INTO `profesor` VALUES ('1', 'INGLES', 'CC', '78945562', 'JUAN', 'SEBASTIAN', 'VARGAS', 'PACHECO', 'DOCTORADO', '2004-10-26', 'GRADO1', '1', 'Catedra', '1994-10-26', 'Masculino', 'SOLTERO', 'juan@gmail.com', '6333333', 'HORAS', '20');

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
  `nombre` varchar(255) NOT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `nivel_formacion` varchar(45) DEFAULT NULL,
  `facultad_idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idprograma`),
  KEY `fk_programa_facultad1_idx` (`facultad_idfacultad`),
  CONSTRAINT `fk_programa_facultad1` FOREIGN KEY (`facultad_idfacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('1', 'OCEANOGRAFÍA FÍSICA', 'Presencial', 'Universitaria', '7');
INSERT INTO `programa` VALUES ('2', 'CIENCIAS NAVALES PARA OFICIALES NAVALES', 'Presencial', 'Universitaria', '4');
INSERT INTO `programa` VALUES ('3', 'INGENIERÍA NAVAL', 'Presencial', 'Universitaria', '9');
INSERT INTO `programa` VALUES ('4', 'INGENIERÍA ELECTRÓNICA', 'Presencial', 'Universitaria', '9');
INSERT INTO `programa` VALUES ('5', 'ADMINISTRACIÓN MARÍTIMA', 'Presencial', 'Universitaria', '10');
INSERT INTO `programa` VALUES ('6', 'ADMINISTRACIÓN', 'Presencial', 'Universitaria', '10');
INSERT INTO `programa` VALUES ('7', 'CIENCIAS NAVALES PARA OFICIALES DE INFANTERÍA DE MARINA', 'Presencial', 'Universitaria', '11');
INSERT INTO `programa` VALUES ('8', 'CIENCIAS NÁUTICAS PARA OFICIALES MERCANTES', 'Presencial', 'Universitaria', '4');
INSERT INTO `programa` VALUES ('9', 'MAESTRÍA EN GESTIÓN DE ORGANIZACIONES', 'Presencial', 'Maestria', '4');
INSERT INTO `programa` VALUES ('10', 'MAESTRÍA EN GESTIÓN DE PROYECTOS', 'Presencial', 'Maestria', '4');
INSERT INTO `programa` VALUES ('11', 'MAESTRÍA EN GESTIÓN LOGISTICA', 'Presencial', 'Maestria', '10');
INSERT INTO `programa` VALUES ('12', 'ESPECIALIZACIÓN EN LOGISTICA', 'Presencial', 'Especializacion', '10');
INSERT INTO `programa` VALUES ('13', 'MAESTRÍA EN OCEANOGRAFÍA', 'Presencial', 'Maestria', '7');
INSERT INTO `programa` VALUES ('14', 'MAESTRÍA EN INGENIERÍA NAVAL', 'Presencial', 'Maestria', '9');
INSERT INTO `programa` VALUES ('15', 'MAESTRÍA EN ELECTRÓNICA', 'Presencial', 'Maestria', '9');

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
INSERT INTO `rol_has_permisos` VALUES ('1', '37');
INSERT INTO `rol_has_permisos` VALUES ('1', '38');
INSERT INTO `rol_has_permisos` VALUES ('1', '39');

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
