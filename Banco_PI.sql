﻿-- MySQL Script generated by MySQL Workbench
-- Tue Apr  2 20:12:16 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `professor_id` INT NOT NULL,
  `administrador` INT NULL DEFAULT 0,
  `matricula` VARCHAR(45) NULL,
  PRIMARY KEY (`professor_id`),
  INDEX `fk_Professor_Usuario_idx` (`professor_id` ASC),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC),
  CONSTRAINT `fk_Professor_Usuario`
    FOREIGN KEY (`professor_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `aluno_id` INT NOT NULL,
  `ra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`aluno_id`),
  UNIQUE INDEX `ra_UNIQUE` (`ra` ASC),
  CONSTRAINT `fk_Aluno_Usuario1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dt_cadastro` DATETIME NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `introducao` VARCHAR(250) NULL,
  `requisitos` VARCHAR(1000) NULL,	
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `semestre_letivo` INT NULL,
  `ano_letivo` INT NULL,
  `sigla` VARCHAR(45) NULL,
  `tema_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_turma_tema1_idx` (`tema_id` ASC),
  UNIQUE INDEX `idx_uk_sigla_ano_semestre` (`semestre_letivo` ASC, `ano_letivo` ASC, `sigla` ASC),
  CONSTRAINT `fk_turma_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `mydb`.`tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orientador_id` INT NOT NULL,
  `numero` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grupo_Professor1_idx` (`orientador_id` ASC),
  CONSTRAINT `fk_grupo_Professor1`
    FOREIGN KEY (`orientador_id`)
    REFERENCES `mydb`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma_aluno` (
  `Aluno_id` INT NOT NULL,
  `turma_id` INT NOT NULL,
  `grupo_id` INT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_Aluno_has_turma_turma1_idx` (`turma_id` ASC),
  INDEX `fk_Aluno_has_turma_Aluno1_idx` (`Aluno_id` ASC),
  INDEX `fk_Aluno_has_turma_grupo1_idx` (`grupo_id` ASC),
  INDEX `idx_aluno_turma` (`Aluno_id` ASC, `turma_id` ASC),
  CONSTRAINT `fk_Aluno_has_turma_Aluno1`
    FOREIGN KEY (`Aluno_id`)
    REFERENCES `mydb`.`aluno` (`aluno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_turma_turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `mydb`.`turma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_turma_grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `mydb`.`grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`banca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`banca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grupo_id` INT NOT NULL,
  `data` DATETIME NULL,
  `sala` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_banca_grupo1_idx` (`grupo_id` ASC),
  CONSTRAINT `fk_banca_grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `mydb`.`grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professores_banca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professores_banca` (
  `banca_id` INT NOT NULL,
  `Professor_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `avaliacao` DECIMAL(4,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_banca_has_Professor_Professor1_idx` (`Professor_id` ASC),
  INDEX `fk_banca_has_Professor_banca1_idx` (`banca_id` ASC),
  INDEX `idx_banca_prof` (`banca_id` ASC, `Professor_id` ASC),
  CONSTRAINT `fk_banca_has_Professor_banca1`
    FOREIGN KEY (`banca_id`)
    REFERENCES `mydb`.`banca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_banca_has_Professor_Professor1`
    FOREIGN KEY (`Professor_id`)
    REFERENCES `mydb`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`atividade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tema_id` INT NOT NULL,
  `numero` INT NULL,
  `descricao` VARCHAR(250) NULL,
  `formato_entrega` VARCHAR(45) NULL,
  `dt_inicio` DATETIME NULL,
  `dt_fim` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_atividade_tema1_idx` (`tema_id` ASC),
  CONSTRAINT `fk_atividade_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `mydb`.`tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`entrega` (
  `grupo_id` INT NOT NULL,
  `atividade_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `dt_cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grupo_has_entregas_entregas1_idx` (`atividade_id` ASC),
  INDEX `fk_grupo_has_entregas_grupo1_idx` (`grupo_id` ASC),
  INDEX `idx_grupo_ativ` (`grupo_id` ASC, `atividade_id` ASC),
  CONSTRAINT `fk_grupo_has_entregas_grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `mydb`.`grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_has_entregas_entregas1`
    FOREIGN KEY (`atividade_id`)
    REFERENCES `mydb`.`atividade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entrega_id` INT NOT NULL,
  `turma_aluno_id` INT NOT NULL,
  `nota` DECIMAL(4,2) NULL,
  `dt_avaliacao` DATETIME NULL,
  `comentarios` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Avaliacao_entregas1_idx` (`entrega_id` ASC),
  INDEX `fk_Avaliacao_Aluno_has_turma1_idx` (`turma_aluno_id` ASC),
  CONSTRAINT `fk_Avaliacao_entregas1`
    FOREIGN KEY (`entrega_id`)
    REFERENCES `mydb`.`entrega` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Aluno_has_turma1`
    FOREIGN KEY (`turma_aluno_id`)
    REFERENCES `mydb`.`turma_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE `mydb`.`entrega` ADD COLUMN `link` VARCHAR(255) NULL AFTER `dt_cadastro`;

INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (1,'Andre de Souza Mello','amello@usjt.com.br','andre');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (2,'Paloma Nascimento Costa','pcosta@usjt.com.br','paloma');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (3,'Douglas Fonseca Silva','dsilva@usjt.com.br','douglas');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (4,'Renata de Brito Martins','rmartins@usjt.com.br','renata');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (5,'João Pedro Junior','jjunior@usjt.com.br','joao');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (6,'Lucas Moreira','lmoreira@usjt.com.br','lucas');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (7,'Renato Figueiredo','rfigueiredo@usjt.com.br','renato');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (8,'Diego Ribeiro','dribeiro@usjt.com.br','diego');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (9,'Renan Morales','rmorales@usjt.com.br','renan');
INSERT INTO `usuario` (`id`,`nome`,`email`,`senha`) VALUES (10,'Ana Carolina','acarolina@usjt.com.br','carolina');

INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (1, 1,'818234569');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (2, 1,'818123417');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (3, 0,'818109485');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (4, 1,'818248392');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (5, 0,'818159123');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (6, 1,'818234324');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (7, 1,'818165535');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (8, 0,'818107657');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (9, 1,'818989778');
INSERT INTO `professor` (`professor_id`,`administrador`,`matricula`) VALUES (10, 0,'81813634');

INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (1, '2019-05-01 00:00:00', 'Projeto PI', 'Sistema Escolar', 'Cadastro de Tema e turma');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (2, '2019-05-15 00:00:00', 'Analise de Sistemas', 'Sistema Estacionamento', 'Cadastro de carros e alugueis');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (3, '2019-05-20 00:00:00', 'Projeto Interdiciplinar', 'Sistema Odontologico', 'Cadastro de pacientes e funcionarios');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (4, '2019-04-05 00:00:00', 'Projeto Faculdade', 'Sistema Reembolso', 'Cadastro pedidos e gerar informações');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (5, '2019-04-15 00:00:00', 'TCC 2019', 'Plataforma de Sistema', 'Codigos Binarios e hexa');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (6, '2019-04-25 00:00:00', 'FATEC 2018', 'Sistema de Chamadas', 'Realizar chamada e lançamento de notas');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (7, '2019-06-01 00:00:00', 'ETEC 2019', 'Sistema Cabeleleiro', 'Cadastro de horarios e clientes');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (8, '2019-04-30 00:00:00', 'Projeto Ferias', 'Sistema Independente', 'Cadastro de produtos e notas fiscais');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (9, '2019-05-30 00:00:00', 'Projeto PI 2019', 'Sistema Financeiro', 'Notas fiscais e lançamento padrão');
INSERT INTO `TEMA` (`id`,`dt_cadastro`,`titulo`,`introducao`,`requisitos`) VALUES (10, '2019-03-25 00:00:00', 'TCC São Judas', 'Sistema Android', 'Informar locais disponiveis e cardapio');

INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (1, '01', '2019', 'SINMCA-01', '1');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (2, '02', '2018', 'SINDES-02', '2');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (3, '01', '2018', 'ANSDRF-01', '3');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (4, '02', '2018', 'DENSSO-O01', '4');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (5, '01', '2019', 'MCDAPI-A02', '5');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (6, '02', '2019', 'CSDEAO-M01', '6');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (7, '01', '2019', 'ENGNTR-01', '7');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (8, '02', '2019', 'ANASGE-H02', '8');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (9, '01', '2019', 'LANCDE-A01', '9');
INSERT INTO `TURMA` (`id`,`semestre_letivo`,`ano_letivo`,`sigla`,`tema_id`) VALUES (10, '02', '2018', 'SINMCS-02', '10');

INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (1, 1, 1001, 'Atividade 01', 'Sala de Aula', '2019-04-05 00:00:00', '2019-04-10 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (2, 1, 1002, 'Atividade 02', 'Slide', '2019-04-11 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (3, 2, 1003, 'Atividade 01', 'Sala de Aula', '2019-05-10 00:00:00', '2019-05-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (4, 2, 1004, 'Atividade 02', 'Via E-mail', '2019-05-15 00:00:00', '2019-05-25 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (5, 3, 1005, 'Atividade 01', 'PDF', '2019-04-10 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (6, 3, 1006, 'Atividade 02', 'Sala de Aula', '2019-04-21 00:00:00', '2019-04-30 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (7, 4, 1007, 'Atividade 01', 'Via E-mail', '2019-05-15 00:00:00', '2019-05-25 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (8, 4, 1008, 'Atividade 02', 'Word', '2019-04-15 00:00:00', '2019-04-28 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (9, 5, 1009, 'Atividade 01', 'Word', '2019-05-01 00:00:00', '2019-05-12 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (10, 5, 1010, 'Atividade 02', 'Workbench', '2019-05-10 00:00:00', '2019-05-15 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (11, 6, 1011, 'Atividade 01', 'Sala de Aula', '2019-05-20 00:00:00', '2019-05-24 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (12, 6, 1012, 'Atividade 02', 'Apresentação', '2019-05-06 00:00:00', '2019-05-30 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (13, 7, 1013, 'Atividade 01', 'Apresentação', '2019-04-25 00:00:00', '2019-05-05 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (14, 7, 1014, 'Atividade 02', 'Eclipse', '2019-04-08 00:00:00', '2019-04-12 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (15, 8, 1015, 'Atividade 01', 'Sala de Aula', '2019-06-21 00:00:00', '2019-06-27 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (16, 8, 1016, 'Atividade 02', 'Apresentação', '2019-06-10 00:00:00', '2019-06-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (17, 9, 1017, 'Atividade 01', 'PDF', '2019-06-05 00:00:00', '2019-06-15 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (18, 9, 1018, 'Atividade 02', 'Slide', '2019-05-01 00:00:00', '2019-05-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (19, 10, 1019, 'Atividade 01', 'Sala de Aula', '2019-04-15 00:00:00', '2019-04-20 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (20, 10, 1020, 'Atividade 02', 'Via E-mail', '2019-03-20 00:00:00', '2019-03-30 00:00:00');
INSERT INTO `ATIVIDADE` (`id`,`tema_id`,`numero`,`descricao`,`formato_entrega`,`dt_inicio`,`dt_fim`) VALUES (21, 1, 1021, 'Atividade 03', 'Sala de Aula', '2019-03-10 00:00:00', '2019-03-25 00:00:00');

INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (1, 1, 501, 'Os Travessos');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (2, 2, 502, 'As Panteras');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (3, 3, 503, 'Guerreiros em Ação');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (4, 4, 504, 'Grupo Vitoria');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (5, 5, 505, 'Objetivo Passar');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (6, 6, 506, 'Grupo 02');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (7, 7, 507, 'Grupo Trevas');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (8, 8, 508, 'Grupo USJT');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (9, 9, 509, 'Os Programadores');
INSERT INTO `GRUPO` (`id`,`orientador_id`,`numero`,`nome`) VALUES (10, 10, 510, 'TI é viver');

INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (1, 1, 1,'2019-04-09 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (2, 2, 3,'2019-05-20 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (3, 3, 5,'2019-04-15 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (4, 4, 7,'2019-05-21 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (5, 5, 9,'2019-05-10 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (6, 6, 15,'2019-06-27 00:00:00');
INSERT INTO `ENTREGA` (`id`,`grupo_id`,`atividade_id`,`dt_cadastro`) VALUES (7, 7, 18,'2019-05-18 00:00:00');
