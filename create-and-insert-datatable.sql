drop schema if exists sistema_competicao;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sistema_competicao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_competicao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_competicao` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sistema_competicao` ;

-- -----------------------------------------------------
-- Table `sistema_competicao`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`pais` (
  `id_pais` INT NOT NULL COMMENT 'O atributo id_pais é a PK da tabela País e identifica unicamente um pais.',
  `nome_pais` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`delegacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`delegacao` (
  `id_delegacao` INT NOT NULL COMMENT 'O atributo id_delegacao é a PK da tabela Delegação e identifica unicamente um delegação.',
  `nome_delegacao` VARCHAR(45) NOT NULL,
  `pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_delegacao`),
  INDEX `fk_Delegacao_Pais1_idx` (`pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_Delegacao_Pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `sistema_competicao`.`pais` (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`estado` (
  `id_estado` INT NOT NULL COMMENT 'O atributo id_estado é a PK da tabela Estado e identifica unicamente um Estado.',
  `nome_estado` VARCHAR(80) NOT NULL,
  `sigla_estado` VARCHAR(80) NOT NULL,
  `pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_estado`),
  INDEX `fk_Estado_Pais1_idx` (`pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_Estado_Pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `sistema_competicao`.`pais` (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`cidade` (
  `id_cidade` INT NOT NULL COMMENT 'O atributo id_cidade é a PK da tabela Cidade e identifica unicamente um Cidade.',
  `nome_cidade` VARCHAR(100) NOT NULL,
  `estado_id_estado` INT NOT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `fk_Cidade_Estado1_idx` (`estado_id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Estado1`
    FOREIGN KEY (`estado_id_estado`)
    REFERENCES `sistema_competicao`.`estado` (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`escolaridade` (
  `id_escolaridade` INT NOT NULL COMMENT 'O atributo id_escolaridade é a PK da tabela escolaridade e identifica unicamente um escolaridade.',
  `descricao_escolaridade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_escolaridade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`estado_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`estado_civil` (
  `id_estado_civil` INT NOT NULL COMMENT 'O atributo id_estado_civil é a PK da tabela estado_civil e identifica unicamente um estado_civil.',
  `descricao_estado_civil` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_estado_civil`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`filiacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`filiacao` (
  `id_filiacao` INT NOT NULL COMMENT 'O atributo id_filiacao é a PK da tabela filiacao e identifica unicamente um filiacao.',
  `nome_mae` VARCHAR(45) NOT NULL,
  `nome_pai` VARCHAR(45) NULL DEFAULT NULL,
  `num_filhos` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_filiacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`sexo` (
  `id_sexo` INT NOT NULL COMMENT 'O atributo id_sexo é a PK da tabela sexo e identifica unicamente um sexo.',
  `sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sexo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`pessoa` (
  `id_pessoa` INT NOT NULL COMMENT 'O atributo id_pessoa é a PK da tabela pessoa e identifica unicamente um pessoa.',
  `passaporte` VARCHAR(10) NOT NULL,
  `nome_pessoa` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `rg` VARCHAR(15) NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  `altura` FLOAT NOT NULL,
  `peso` FLOAT NOT NULL,
  `sexo_id_sexo` INT NOT NULL,
  `escolaridade_id_escolaridade` INT NOT NULL,
  `filiacao_id_filiacao` INT NOT NULL,
  `estado_civil_id_estado_civil` INT NOT NULL,
  `cidade_id_cidade_` INT NOT NULL,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE INDEX `passaporte_UNIQUE` (`passaporte` ASC) VISIBLE,
  INDEX `fk_Pessoa_Sexo1_idx` (`sexo_id_sexo` ASC) VISIBLE,
  INDEX `fk_Pessoa_Escolaridade1_idx` (`escolaridade_id_escolaridade` ASC) VISIBLE,
  INDEX `fk_Pessoa_Filiacao1_idx` (`filiacao_id_filiacao` ASC) VISIBLE,
  INDEX `fk_Pessoa_estado_civil1_idx` (`estado_civil_id_estado_civil` ASC) VISIBLE,
  INDEX `fk_Pessoa_Cidade1_idx` (`cidade_id_cidade_` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_Cidade1`
    FOREIGN KEY (`cidade_id_cidade_`)
    REFERENCES `sistema_competicao`.`cidade` (`id_cidade`),
  CONSTRAINT `fk_Pessoa_Escolaridade1`
    FOREIGN KEY (`escolaridade_id_escolaridade`)
    REFERENCES `sistema_competicao`.`escolaridade` (`id_escolaridade`),
  CONSTRAINT `fk_Pessoa_estado_civil1`
    FOREIGN KEY (`estado_civil_id_estado_civil`)
    REFERENCES `sistema_competicao`.`estado_civil` (`id_estado_civil`),
  CONSTRAINT `fk_Pessoa_Filiacao1`
    FOREIGN KEY (`filiacao_id_filiacao`)
    REFERENCES `sistema_competicao`.`filiacao` (`id_filiacao`),
  CONSTRAINT `fk_Pessoa_Sexo1`
    FOREIGN KEY (`sexo_id_sexo`)
    REFERENCES `sistema_competicao`.`sexo` (`id_sexo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`treinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`treinador` (
  `id_treinador` INT NOT NULL COMMENT 'O atributo id_treinador é a PK da tabela treinador e identifica unicamente um treinador.',
  `nome_confederacao` VARCHAR(100) NOT NULL,
  `dt_nomeacao` DATE NOT NULL,
  `trabalhos_anteriores` VARCHAR(45) NULL DEFAULT NULL,
  `delegacao_id_delegacao` INT NOT NULL,
  `pessoa_id_pessoa` INT NOT NULL,
  PRIMARY KEY (`id_treinador`),
  INDEX `fk_Treinador_Delegacao1_idx` (`delegacao_id_delegacao` ASC) VISIBLE,
  INDEX `fk_Treinador_Pessoa1_idx` (`pessoa_id_pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Treinador_Delegacao1`
    FOREIGN KEY (`delegacao_id_delegacao`)
    REFERENCES `sistema_competicao`.`delegacao` (`id_delegacao`),
  CONSTRAINT `fk_Treinador_Pessoa1`
    FOREIGN KEY (`pessoa_id_pessoa`)
    REFERENCES `sistema_competicao`.`pessoa` (`id_pessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`atletas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`atletas` (
  `id_atletas` INT NOT NULL COMMENT 'O atributo id_atletas é a PK da tabela atletas e identifica unicamente um atleta.',
  `num_licenca_atletas` VARCHAR(45) NOT NULL,
  `delegacao_id_delegacao` INT NOT NULL,
  `pessoa_id_pessoa` INT NOT NULL,
  `treinador_id_treinador` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_atletas`),
  UNIQUE INDEX `num_licenca_UNIQUE` (`num_licenca_atletas` ASC) VISIBLE,
  INDEX `fk_Atletas_Delegacao1_idx` (`delegacao_id_delegacao` ASC) VISIBLE,
  INDEX `fk_Atletas_Pessoa1_idx` (`pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_Atletas_Treinador1_idx` (`treinador_id_treinador` ASC) VISIBLE,
  CONSTRAINT `fk_Atletas_Delegacao1`
    FOREIGN KEY (`delegacao_id_delegacao`)
    REFERENCES `sistema_competicao`.`delegacao` (`id_delegacao`),
  CONSTRAINT `fk_Atletas_Pessoa1`
    FOREIGN KEY (`pessoa_id_pessoa`)
    REFERENCES `sistema_competicao`.`pessoa` (`id_pessoa`),
  CONSTRAINT `fk_Atletas_Treinador1`
    FOREIGN KEY (`treinador_id_treinador`)
    REFERENCES `sistema_competicao`.`treinador` (`id_treinador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`bairro` (
  `id_bairro` INT NOT NULL COMMENT 'O atributo id_bairro é a PK da tabela bairro e identifica unicamente um bairro.',
  `nome_bairro` VARCHAR(100) NOT NULL,
  `cidade_id_cidade` INT NOT NULL,
  PRIMARY KEY (`id_bairro`),
  INDEX `fk_Bairro_Cidade1_idx` (`cidade_id_cidade` ASC) VISIBLE,
  CONSTRAINT `fk_Bairro_Cidade1`
    FOREIGN KEY (`cidade_id_cidade`)
    REFERENCES `sistema_competicao`.`cidade` (`id_cidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`classificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`classificacao` (
  `id_classificacao` INT NOT NULL COMMENT 'O atributo id_classificacao é a PK da tabela escolaridade e identifica unicamente um escolaridade.',
  `classificacao` VARCHAR(45) NOT NULL,
  `pontuacao_classificacao` INT NOT NULL,
  PRIMARY KEY (`id_classificacao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`olimpiada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`olimpiada` (
  `id_olimpiada` INT NOT NULL COMMENT 'O atributo id_olimpiada é a PK da tabela olimpiada e identifica unicamente um olimpiada.',
  `nome_olimpiada` VARCHAR(45) NOT NULL,
  `data_realizacao` DATE NOT NULL,
  PRIMARY KEY (`id_olimpiada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`participacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`participacao` (
  `atletas_id_atletas` INT NOT NULL COMMENT 'O atributo id_atletas_id_atletas é a FK na tabela participacao e identifica unicamente um atleta.',
  `olimpiada_id_olimpiada` INT NOT NULL COMMENT 'O atributo olimpiada_id_olimpiada é a FK na tabela participacao e identifica unicamente uma olimpiada.',
  PRIMARY KEY (`atletas_id_atletas`, `olimpiada_id_olimpiada`),
  INDEX `fk_Atletas_has_Olimpiada_Olimpiada1_idx` (`olimpiada_id_olimpiada` ASC) VISIBLE,
  INDEX `fk_Atletas_has_Olimpiada_Atletas1_idx` (`atletas_id_atletas` ASC) VISIBLE,
  CONSTRAINT `fk_Atletas_has_Olimpiada_Atletas1`
    FOREIGN KEY (`atletas_id_atletas`)
    REFERENCES `sistema_competicao`.`atletas` (`id_atletas`),
  CONSTRAINT `fk_Atletas_has_Olimpiada_Olimpiada1`
    FOREIGN KEY (`olimpiada_id_olimpiada`)
    REFERENCES `sistema_competicao`.`olimpiada` (`id_olimpiada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`tipo_modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`tipo_modalidade` (
  `id_tipo_modalidade` INT NOT NULL COMMENT 'O atributo id_tipo_modalidade é a PK da tabela tipo_modalidade e identifica unicamente um tipo de modalidade.',
  `descricao_tipo_modalidade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_modalidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`modalidade` (
  `id_modalidade` INT NOT NULL COMMENT 'O atributo id_modalidade é a PK da tabela modalidade e identifica unicamente uma modalidade.',
  `nome_modalidade` VARCHAR(45) NOT NULL,
  `dt_inclusao_modalidade` DATE NOT NULL,
  `tipo_modalidade_id_tipo_modalidade` INT NOT NULL,
  PRIMARY KEY (`id_modalidade`),
  UNIQUE INDEX `nome_modalidade_UNIQUE` (`nome_modalidade` ASC) VISIBLE,
  INDEX `fk_Modalidade_Tipo_modalidade1_idx` (`tipo_modalidade_id_tipo_modalidade` ASC) VISIBLE,
  CONSTRAINT `fk_Modalidade_Tipo_modalidade1`
    FOREIGN KEY (`tipo_modalidade_id_tipo_modalidade`)
    REFERENCES `sistema_competicao`.`tipo_modalidade` (`id_tipo_modalidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`competicao_individual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`competicao_individual` (
  `modalidade_id_modalidade` INT NOT NULL COMMENT 'O atributo modalidade_id_modalidade é a FK na competicao_individual e identifica unicamente uma modalidade',
  `classificacao_id_classificacao` INT NULL COMMENT 'O atributo classificacao_id_classificacao é a FK na competicao_individual e identifica unicamente uma classificacao dentro da competicao',
  `participacao_atletas_id_atletas` INT NOT NULL COMMENT 'O atributo participacao_atletas_id_atletas é a FK na competicao_individual e identifica unicamente uma participacao de um atleta',
  `participacao_olimpiada_id_olimpiada` INT NOT NULL COMMENT 'O atributo participacao_olimpiada_id_olimpiada é a FK na competicao_individual e identifica unicamente uma participacao dentro da competicao',
  INDEX `fk_Competicao_Modalidade1_idx` (`modalidade_id_modalidade` ASC) VISIBLE,
  INDEX `fk_Competicao_Classificacao1_idx` (`classificacao_id_classificacao` ASC) VISIBLE,
  INDEX `fk_Competicao_Individual_Participacao1_idx` (`participacao_atletas_id_atletas` ASC, `participacao_olimpiada_id_olimpiada` ASC) VISIBLE,
  CONSTRAINT `fk_Competicao_Classificacao1`
    FOREIGN KEY (`classificacao_id_classificacao`)
    REFERENCES `sistema_competicao`.`classificacao` (`id_classificacao`),
  CONSTRAINT `fk_Competicao_Individual_Participacao1`
    FOREIGN KEY (`participacao_atletas_id_atletas` , `participacao_olimpiada_id_olimpiada`)
    REFERENCES `sistema_competicao`.`participacao` (`atletas_id_atletas` , `olimpiada_id_olimpiada`),
  CONSTRAINT `fk_Competicao_Modalidade1`
    FOREIGN KEY (`modalidade_id_modalidade`)
    REFERENCES `sistema_competicao`.`modalidade` (`id_modalidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`email` (
  `id_email` INT NOT NULL COMMENT 'O atributo id_email é a PK da tabela email e identifica unicamente um email.',
  `email` VARCHAR(45) NOT NULL,
  `pessoa_id_pessoa` INT NOT NULL,
  `tipo_email_id_tipo_email` INT NOT NULL,
  PRIMARY KEY (`id_email`),
  INDEX `fk_E-mail_Pessoa1_idx` (`pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_E-mail_Tipo_e-mail1_idx` (`tipo_email_id_tipo_email` ASC) VISIBLE,
  CONSTRAINT `fk_E-mail_Pessoa1`
    FOREIGN KEY (`pessoa_id_pessoa`)
    REFERENCES `sistema_competicao`.`pessoa` (`id_pessoa`),
  CONSTRAINT `fk_E-mail_Tipo_e-mail1`
    FOREIGN KEY (`tipo_email_id_tipo_email`)
    REFERENCES `sistema_competicao`.`tipo_email` (`id_tipo_email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`tipo_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`tipo_endereco` (
  `id_tipo_endereco` INT NOT NULL COMMENT 'O atributo id_tipo_endereco é a PK da tabela tipo_endereco e identifica unicamente um tipo de endereco.',
  `descricao_tipo_endereco` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_endereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`endereco` (
  `id_endereco` INT NOT NULL COMMENT 'O atributo id_endereco é a PK da tabela endereco e identifica unicamente um endereco.',
  `numero_endereco` INT NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `complemento_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_endereco_id_tipo_endereco` INT NOT NULL,
  `bairro_id_bairro` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_Endereco_Tipo_endereco1_idx` (`tipo_endereco_id_tipo_endereco` ASC) VISIBLE,
  INDEX `fk_Endereco_Bairro1_idx` (`bairro_id_bairro` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Bairro1`
    FOREIGN KEY (`bairro_id_bairro`)
    REFERENCES `sistema_competicao`.`bairro` (`id_bairro`),
  CONSTRAINT `fk_Endereco_Tipo_endereco1`
    FOREIGN KEY (`tipo_endereco_id_tipo_endereco`)
    REFERENCES `sistema_competicao`.`tipo_endereco` (`id_tipo_endereco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`equipe` (
  `id_equipe` INT NOT NULL COMMENT 'O atributo id_equipe é a PK da tabela equipe e identifica unicamente um equipe.',
  `nome_equipe` VARCHAR(75) NOT NULL,
  `treinador_id_treinador` INT NOT NULL,
  PRIMARY KEY (`id_equipe`),
  UNIQUE INDEX `Treinador_idTreinador_UNIQUE` (`treinador_id_treinador` ASC) VISIBLE,
  INDEX `fk_Equipe_Treinador1_idx` (`treinador_id_treinador` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_Treinador1`
    FOREIGN KEY (`treinador_id_treinador`)
    REFERENCES `sistema_competicao`.`treinador` (`id_treinador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`equipe_de_atletas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`equipe_de_atletas` (
  `equipe_id_equipe` INT NOT NULL COMMENT 'O atributo equipe_id_equipe é FK na tabela equipe_de_atetas e identifica unicamente equipe_id_equipe.',
  `atletas_id_atletas` INT NOT NULL COMMENT 'O atributo atletas_id_atletas é FK na tabela equipe_de_atetas e identifica unicamente um atleta.',
  INDEX `fk_Equipe_de_Atletlas_Equipe1_idx` (`equipe_id_equipe` ASC) VISIBLE,
  INDEX `fk_equipe_de_atletas_atletas1_idx` (`atletas_id_atletas` ASC) VISIBLE,
  CONSTRAINT `fk_Equipe_de_Atletlas_Equipe1`
    FOREIGN KEY (`equipe_id_equipe`)
    REFERENCES `sistema_competicao`.`equipe` (`id_equipe`),
  CONSTRAINT `fk_equipe_de_atletas_atletas1`
    FOREIGN KEY (`atletas_id_atletas`)
    REFERENCES `sistema_competicao`.`atletas` (`id_atletas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`historico` (
  `olimpiada_id_olimpiada` INT NOT NULL COMMENT 'O atributo olimpiada_id_olimpiada é a PK da tabela historico e identifica unicamente olimpiada_id_olimpiada.',
  `pais_id_pais` INT NOT NULL COMMENT 'O atributo pais_id_pais é a PK da tabela historico e identifica unicamente um país que disputou a olimpiada.',
  INDEX `fk_Campeonato_Olimpiada_idx` (`olimpiada_id_olimpiada` ASC) VISIBLE,
  INDEX `fk_Campeonato_Pais1_idx` (`pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_Campeonato_Olimpiada`
    FOREIGN KEY (`olimpiada_id_olimpiada`)
    REFERENCES `sistema_competicao`.`olimpiada` (`id_olimpiada`),
  CONSTRAINT `fk_Campeonato_Pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `sistema_competicao`.`pais` (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`pessoa_has_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`pessoa_has_endereco` (
  `pessoa_id_pessoa` INT NOT NULL COMMENT 'O atributo pessoa_id_pessoa é a FK da tabela pessoa_has_endereco e identifica unicamente uma pessoa.',
  `endereco_id_endereco` INT NOT NULL COMMENT 'O atributo pessoa_id_endereco é a FK da tabela pessoa_has_endereco e identifica unicamente um endereco de uma pessoa.',
  INDEX `fk_Pessoa_has_endereco_Pessoa1_idx` (`pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_Pessoa_has_endereco_endereco1_idx` (`endereco_id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_has_endereco_endereco1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `sistema_competicao`.`endereco` (`id_endereco`),
  CONSTRAINT `fk_Pessoa_has_endereco_Pessoa1`
    FOREIGN KEY (`pessoa_id_pessoa`)
    REFERENCES `sistema_competicao`.`pessoa` (`id_pessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`tipo_telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`tipo_telefone` (
  `id_tipo_telefone` INT NOT NULL COMMENT 'O atributo id_tipo_telefone é a PK da tabela tipo_telefone e identifica unicamente um tipo de telefone.',
  `descricao_tipo_telefone` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_telefone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`telefone` (
  `id_telefone` INT NOT NULL COMMENT 'O atributo id_telefone é a PK da tabela telefone e identifica unicamente um telefone.',
  `numero_telefone` VARCHAR(45) NOT NULL,
  `pessoa_id_pessoa` INT NOT NULL,
  `tipo_telefone_id_tipo_telefone` INT NOT NULL,
  PRIMARY KEY (`id_telefone`),
  INDEX `fk_Telefone_Pessoa1_idx` (`pessoa_id_pessoa` ASC) VISIBLE,
  INDEX `fk_Telefone_Tipo_telefone1_idx` (`tipo_telefone_id_tipo_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Pessoa1`
    FOREIGN KEY (`pessoa_id_pessoa`)
    REFERENCES `sistema_competicao`.`pessoa` (`id_pessoa`),
  CONSTRAINT `fk_Telefone_Tipo_telefone1`
    FOREIGN KEY (`tipo_telefone_id_tipo_telefone`)
    REFERENCES `sistema_competicao`.`tipo_telefone` (`id_tipo_telefone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`tipo_email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`tipo_email` (
  `id_tipo_email` INT NOT NULL COMMENT 'O atributo id_tipo_email é a PK da tabela tipo_email e identifica unicamente um email.',
  `descricao_tipo_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`participacao_de_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`participacao_de_equipe` (
  `olimpiada_id_olimpiada` INT NOT NULL COMMENT 'O atributo olimpiada_id_olimpiada é a PK da tabela participacao_de_equipe e identifica unicamente uma participação de uma equipe na Olimpiada.',
  `equipe_id_equipe` INT NOT NULL COMMENT 'O atributo equipe_id_equipe é a PK da tabela participacao_de_equipe e identifica unicamente uma participação de uma equipe na Olimpiada.',
  PRIMARY KEY (`olimpiada_id_olimpiada`, `equipe_id_equipe`),
  INDEX `fk_olimpiada_has_equipe_equipe1_idx` (`equipe_id_equipe` ASC) VISIBLE,
  INDEX `fk_olimpiada_has_equipe_olimpiada1_idx` (`olimpiada_id_olimpiada` ASC) VISIBLE,
  CONSTRAINT `fk_olimpiada_has_equipe_olimpiada1`
    FOREIGN KEY (`olimpiada_id_olimpiada`)
    REFERENCES `sistema_competicao`.`olimpiada` (`id_olimpiada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_olimpiada_has_equipe_equipe1`
    FOREIGN KEY (`equipe_id_equipe`)
    REFERENCES `sistema_competicao`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_competicao`.`competicao_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_competicao`.`competicao_equipe` (
  `participacao_de_equipe_olimpiada_id_olimpiada` INT NOT NULL COMMENT 'O atributo participacao_de_equipe_olimpiada_id_olimpiada é a FK da tabela competicao_equipe e identifica unicamente uma participacao de uma equipe na olimpiada.',
  `participacao_de_equipe_equipe_id_equipe` INT NOT NULL COMMENT 'O atributo participacao_de_equipe_equipe_id_equipe é a FK da tabela competicao_equipe e identifica unicamente uma participacao de uma equipe na competicao.',
  `modalidade_id_modalidade` INT NOT NULL COMMENT 'O atributo modalidade_id_modalidade é a FK da tabela competicao_equipe e identifica unicamente uma modalidade da competicao.',
  `classificacao_id_classificacao` INT NULL COMMENT 'O atributo classificacao_id_classificacao a FK da tabela competicao_equipe e identifica uma classificacao dentro da competicao',
  INDEX `fk_participacao_de_equipe_has_modalidade_modalidade1_idx` (`modalidade_id_modalidade` ASC) VISIBLE,
  INDEX `fk_participacao_de_equipe_has_modalidade_participacao_de_eq_idx` (`participacao_de_equipe_olimpiada_id_olimpiada` ASC, `participacao_de_equipe_equipe_id_equipe` ASC) VISIBLE,
  INDEX `fk_participacao_de_equipe_has_modalidade_classificacao1_idx` (`classificacao_id_classificacao` ASC) VISIBLE,
  CONSTRAINT `fk_participacao_de_equipe_has_modalidade_participacao_de_equi1`
    FOREIGN KEY (`participacao_de_equipe_olimpiada_id_olimpiada` , `participacao_de_equipe_equipe_id_equipe`)
    REFERENCES `sistema_competicao`.`participacao_de_equipe` (`olimpiada_id_olimpiada` , `equipe_id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participacao_de_equipe_has_modalidade_modalidade1`
    FOREIGN KEY (`modalidade_id_modalidade`)
    REFERENCES `sistema_competicao`.`modalidade` (`id_modalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participacao_de_equipe_has_modalidade_classificacao1`
    FOREIGN KEY (`classificacao_id_classificacao`)
    REFERENCES `sistema_competicao`.`classificacao` (`id_classificacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ---------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------INSERT ------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Schema Sistema_Competicao
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Pais`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Pais` (id_pais, nome_pais)
values(1,'Brasil');
Insert into `SISTEMA_COMPETICAO`.`Pais` (id_pais, nome_pais)
values(2,'Espanha');
Insert into `SISTEMA_COMPETICAO`.`Pais` (id_pais, nome_pais)
values(3,'Japão');
Insert into `SISTEMA_COMPETICAO`.`Pais` (id_pais, nome_pais)
values(4,'Estados Unidos');
Insert into `SISTEMA_COMPETICAO`.`Pais` (id_pais, nome_pais)
values(5,'França');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Delegacao`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Delegacao` (id_delegacao, nome_delegacao, pais_id_pais)
values(1,'Delegação do Brasil',1);
Insert into `SISTEMA_COMPETICAO`.`Delegacao` (id_delegacao, nome_delegacao, pais_id_pais)
values(2,'Delegação da Espanha',2);
Insert into `SISTEMA_COMPETICAO`.`Delegacao` (id_delegacao, nome_delegacao, pais_id_pais)
values(3,'Delegação do Japão',3);
Insert into `SISTEMA_COMPETICAO`.`Delegacao` (id_delegacao, nome_delegacao, pais_id_pais)
values(4,'Delegação dos Estados Unidos',4);
Insert into `SISTEMA_COMPETICAO`.`Delegacao` (id_delegacao, nome_delegacao, pais_id_pais)
values(5,'Delegação da França',5);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Sexo`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Sexo` (id_sexo,sexo)
values(1,'Masculino');
Insert into `SISTEMA_COMPETICAO`.`Sexo` (id_sexo,sexo)
values(2,'Feminino');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Escolaridade`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(1,'Analfabeto');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(2,'Até 5º Ano Incompleto');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(3,'5º Ano Completo');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(4,'6º ao 9º Ano do Fundamental	');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(5,'Fundamental Completo');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(6,'Médio Incompleto');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(7,'Médio Completo');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(8,'Superior Incompleto');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(9,'Superior Completo');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(10,'Mestrado');
Insert into `SISTEMA_COMPETICAO`.`Escolaridade` (id_escolaridade, descricao_escolaridade)
values(11,'Doutorado');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Filiacao`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(1,'Sebastiana Pietra Pietra','Sebastião Enrico Caldeira',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(2,'Sophia Stella Brenda','Benjamin Thiago Joaquim Ramos',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(3,'Stella Lúcia','Igor Heitor Raimundo Figueiredo',2);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(4,'Vera Vanessa Mirella','Levi Pedro Henrique Cardoso',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(5,'Débora Francisca Márcia','Benjamin Sebastião Bernardo Martins',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(6,'Sônia Lorena','Pedro Henrique Antonio Mendes',1);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(7,'Fabiana Stefany','Oliver Miguel Cardoso',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(8,'Mariane Letícia Analu','Samuel Fábio Peixoto',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(9,'Maitê Lívia Luciana','Carlos Igor Viana',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(10,'Josefa Louise Vitória','Paulo Calebe Benedito da Cruz',2);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(11,'Luana Louise','Antonio Osvaldo Moreira',2);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(12,'Caroline Juliana Agatha','Miguel Elias Tiago Fogaça',2);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(13,'Bianca Joana Rebeca','Yuri Henrique Gonçalves',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(14,'Alessandra Ayla','Manuel Luís Erick Novaes',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(15,'Bianca Luiza Yasmin','Enzo Renan Daniel Jesus',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(16,'Isabel Emanuelly Giovanna','Bryan Marcelo Costa',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(17,'Rayssa Rayssa Marcela','Matheus Raimundo Heitor Porto',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(18,'Agatha Maya','Luís Kevin Martins',null);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(19,'Jéssica Maya Emanuelly','Fábio Carlos Thiago Cardoso',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(20,'Alana Lavínia Marlene','Tiago Benedito Manuel Teixeira',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(21,'Emilly Laís','Nathan Bruno Nicolas da Mota',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(22,'Lívia Patrícia Letícia','Miguel Davi André Monteiro',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(23,'Silvana Bianca','Caleb Murilo Teixeira',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(24,'Clara Tânia','Thomas Diego Caio Dias',1);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(25,'Ester Sophie Betina','Fábio Filipe Anderson Gomes',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(26,'Luiza Márcia Nina','Bruno Carlos Marcos Vinicius Brito',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(27,'Teresinha Clara Adriana','Yuri Eduardo Mateus Silveira',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(28,'Kamilly Evelyn Ester','Alexandre Vinicius Alves',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(29,'Ana Amanda Nina','Thiago Ricardo Almeida',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(30,'Olivia Juliana', null,null);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(31,'Benedita Esther Maitê', 'Marcos Diego Diogo Vieira',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(32,'Josefa Heloisa', null,null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(33,'Sarah Stefany', 'Igor Caio Joaquim da Rosa',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(34,'Carolina Lúcia', 'Rodrigo Marcos Vinicius Barbosa',1);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(35,'Elaine Maria Fabiana', 'Gabriel Breno das Neves',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(36,'Natália Gabrielly Maitê', 'Carlos Thomas Ferreira',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(37,'Elaine Elisa', null,null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(38,'Giovanna Mariah', 'Heitor Murilo Ribeiro',1);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(39,'Esther Ester', 'Eduardo Giovanni Bernardes',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(40,'Beatriz Emilly Alice', 'Bruno Augusto Roberto Assis',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(41,'Laís Renata', 'Eduardo Marcos Vinicius Bernardes',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(42,'Larissa Nicole', 'Pietro Carlos Eduardo Carlos Eduardo Novaes',1);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(43,'Tânia Isabella', 'Lorenzo César dos Santos',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(44,'Teresinha Ayla Eliane', 'Roberto Giovanni Benício dos Santos',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(45,'Cláudia Isabella', 'Lucca José Thiago Moura',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(46,'Josefa Cláudia Rafaela', 'Cláudio Renato Francisco Fogaça',null);

Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(47,'Sarah Carla', 'Mateus Nelson Carvalho',2);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(48,'Isabel Cristiane Antonella', 'Erick Murilo Melo',null);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(49,'Alice Louise', 'Cauê Diego Nathan Fernandes',1);
Insert into `SISTEMA_COMPETICAO`.`Filiacao` (id_filiacao, nome_mae, nome_pai , num_filhos)
values(50,'Alícia Luna Fernanda', 'Samuel Bruno José Moura',null);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`estado_civil`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Estado_Civil` (id_estado_civil, descricao_estado_civil)
values(1,'solteiro');
Insert into `SISTEMA_COMPETICAO`.`Estado_Civil` (id_estado_civil, descricao_estado_civil)
values(2,'casado');
Insert into `SISTEMA_COMPETICAO`.`Estado_Civil` (id_estado_civil, descricao_estado_civil)
values(3,'separado');
Insert into `SISTEMA_COMPETICAO`.`Estado_Civil` (id_estado_civil, descricao_estado_civil)
values(4,'divorciado ');
Insert into `SISTEMA_COMPETICAO`.`Estado_Civil` (id_estado_civil, descricao_estado_civil)
values(5,'viúvo');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Estado`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(1,'Acre','AC',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(2,'Alagoas','AL',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(3,'Amapá','AP',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(4,'Amazonas','AM',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(5,'Bahia','BA',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(6,'Ceará','CE',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(7,'Espírito Santo','ES',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(8,'Goiás','GO',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(9,'Maranhão','MA',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(10,'Mato Grosso','MT',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(11,'Mato Grosso do Sul','MS',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(12,'Minas Gerais','MG',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(13,'Pará','PA',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(14,'Paraíba','PR',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(15,'Paraná','PR',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(16,'Pernambuco','PE',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(17,'Piauí','PI',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(18,'Rio de Janeiro','RJ',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(19,'Rio Grande do Norte','RN',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(20,'Rio Grande do Sul','RS',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(21,'Rondônia','RO',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(22,'Roraima','RR',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(23,'Santa Catarina','SC',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(24,'São Paulo','SP',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(25,'Sergipe','SE',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(26,'Tocantins','TO',1);
Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(27,'Distrito Federal','DF',1);

Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(28,'Madrid','Madrid',2);

Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(29,'Hokkaido','Hokkaido',3);

Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(30,'Flórida','FL',4);

Insert into `SISTEMA_COMPETICAO`.`Estado` (id_estado, nome_estado, sigla_estado, pais_id_pais)
values(31,'Paris','Paris',5);



-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Cidade`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(1,'Rio Branco',1);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(2,'Maceió',2);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(3,'Macapá',3);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(4,'Manaus',4);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(5,'Salvador',5);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(6,'Fortaleza',6);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(7,'Vitória',7);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(8,'Goiânia',8);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(9,'São Luís',9);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(10,'Cuiabá',10);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(11,'Campo Grande',11);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(12,'Belo Horizonte',12);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(13,'Belém',13);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(14,'Jõao Pessoa',14);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(15,'Curitiba',15);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(16,'Recife',16);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(17,'Teresina',17);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(18,'Rio de Janeiro',18);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(19,'Natal',19);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(20,'Porto Alegre',20);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(21,'`Porto Velho',21);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(22,'Boa Vista',22);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(23,'Florianópolis',23);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(24,'São Paulo',24);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(25,'Aracaju',25);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(26,'Palmas',26);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(27,'Brasília',27);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(28,'Madrid',28);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(29,'Sapporo',29);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(30,'Orlando',30);
Insert into `SISTEMA_COMPETICAO`.`Cidade` (id_cidade, nome_cidade, estado_id_estado)
values(31,'Paris',31);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Pessoa`
-- -----------------------------------------------------
-- ---------------------------------------------- -- Treinadores -- -----------------------------------------------------
-- BRS
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(1,'EA001303','Aurora Luiza Caldeira','282.340.135-05','23.369.386-5','1953-07-06',1.69,90,2,1,22,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(2,'DI001146','Benício Isaac Ramos','342.764.728-57','34.840.474-8','1985-04-23',1.74,107,1,2,23,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(3,'JZ013334','Gustavo Matheus Figueiredo','477.764.941-51','39.745.900-2','1959-09-02',1.73,89,1,3,24,9,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(4,'TC001152','Renata Raimunda Raquel Cardoso','775.168.251-58','29.494.072-8','1966-04-10',1.80,81,2,4,25,10,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(5,'YQ012323','Rafaela Stefany Martins','492.789.126-70','37.215.023-8','1958-03-15',1.51,59,2,5,26,10,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(6,'RZ121331','Guilherme Diego Rodrigo Mendes','334.096.748-29','26.054.661-6','1973-01-22',1.95,71,1,6,27,11,2);
-- ESP
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(7,'PI012330','Sarah Cláudia Cardoso','086.149.690-66','49.047.379-9','1987-01-19',1.50,85,2,7,28,9,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(8,'XZ122202','Giovana Luna Peixoto','647.953.662-25','19.031.525-8','1982-08-25',1.85,68,2,8,28,9,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(9,'IJ120223','Augusto Severino Viana','681.526.583-83','16.752.689-3','1974-03-26',1.71,85,1,9,28,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(10,'NB001312','Fátima Tereza Isabela da Cruz','967.261.659-78','44.679.111-8','1995-08-16',1.64,86,2,10,28,10,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(11,'DU013140','Bárbara Sandra Moreira','765.746.392-98','47.001.394-1','1995-05-06',1.59,82,2,11,28,10,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(12,'BW013124','Cristiane Sabrina Yasmin Fogaça','704.252.104-80','34.747.917-0','1985-06-10',1.57,53,2,12,28,11,4);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(13,'RU002125','Thales Miguel Gonçalves','582.801.172-37','17.883.975-9','1996-03-16',1.91,86,1,13,29,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(14,'SN102034','Ryan Bruno Paulo Novaes','097.411.410-33','35.800.197-3','1956-08-21',1.96,80,1,14,29,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(15,'FO010211','Edson Igor Jesus','950.970.682-54','23.344.318-6','2000-06-19',1.64,96,1,15,29,9,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(16,'HZ112002','Giovanni Mateus Manuel Costa','443.279.628-64','37.807.290-0','1965-07-27',1.93,90,1,16,29,10,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(17,'VX021141','Elaine Gabriela Aparecida Porto','845.276.933-44','36.436.933-4','1949-08-04',1.64,84,2,17,29,10,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(18,'DJ022241','Kevin Kaique Martins','057.855.812-21','20.877.857-3','1964-07-09',1.72,86,1,18,29,11,2);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(19,'YO102242','Clarice Sarah Cardoso','781.590.733-48','30.722.462-4','2000-05-05',1.59,49,2,19,30,9,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(20,'VX012013','Osvaldo Yago Anthony Teixeira','362.957.704-01','21.861.443-3','1992-05-19',1.68,80,1,20,30,9,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(21,'LL021333','Sandra Vanessa Giovana da Mota','038.293.447-40','10.398.745-9','2002-06-26',1.51,57,2,21,30,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(22,'XI013455','Helena Rosângela Eduarda Monteiro','944.187.517-18','24.933.279-6','1983-02-09',1.50,56,2,22,30,10,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(23,'PC001014','Lucca Vitor Teixeira','685.373.337-19','45.608.684-5','1975-06-15',1.74,108,1,23,30,10,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(24,'VC012052','Natália Maria Dias','464.785.872-31','34.539.073-8','1959-04-19',1.63,62,2,24,30,11,4);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(25,'KZ122311','Isabelly Vanessa Gomes','070.704.200-30','16.258.120-8','1967-07-27',1.81,82,2,25,31,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(26,'EN102106','Gabriel Kaique Hugo Brito','162.198.568-72','25.703.580-1','1970-03-14',1.85,71,1,26,31,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(27,'SO002125','Yago Henrique Jorge Silveira','486.858.306-99','13.090.220-2','1981-05-09',1.99,99,1,27,31,9,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(28,'XP012125','Stella Evelyn Juliana Alves','770.550.499-54','49.239.244-4','1987-05-16',1.51,68,2,28,31,10,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(29,'WR023232','Pietro Cauê Almeida','139.685.658-78','15.185.444-0','2003-01-21',1.86,52,1,29,31,10,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(30,'QY121145','Kevin Yago dos Santos','927.625.726-81','17.850.044-6','1980-02-26',1.93,96,1,30,31,11,2);
-- ------------------------------------------------------ --ATLETA-- ----------------------------------------------------
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(31,'UY020353','Ana Marcela Cunha','932.960.179-09','15.884.644-8','1949-01-10',1.56,59,2,31,18,7,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(32,'UY013035','Ítalo Ferreira','528.542.294-95','44.322.209-5','1983-04-27',1.68,59,1,32,19,8,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(33,'VH012313','Martine Grael','161.886.947-79','22.623.407-1','1999-03-12',1.76,58,2,33,20,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(34,'PX123324','Kahena Kunze','090.689.622-30','12.990.638-4','1980-09-02',1.55,56,2,34,21,7,2);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(35,'ZJ112403','Ana María Martínez Sagi','895.221.448-00','40.060.900-9','1993-02-25',1.67,56,2,35,28,8,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(36,'RT012212','César Castro','553.844.512-70','32.825.243-8','1955-04-13',1.65,80,1,36,28,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(37,'PO000110','Iván Fernández','739.130.387-95','24.674.634-8','1973-03-11',1.72,45,1,37,28,7,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(38,'WT111114','Ana Peleteiro','190.467.920-05','28.786.242-2','1999-09-04',1.59,77,1,38,28,8,2);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(39,'CY002214','ABE Uta','934.583.403-60','48.561.045-0','1973-02-23',1.77,72,2,39,29,9,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(40,'JU122124','IKEE Rikako','190.898.499-63','42.485.992-0','2004-02-15',1.77,84,2,40,29,7,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(41,'QF101311','ITO Mima','071.003.456-34','22.802.205-8','1970-05-05',1.71,93,2,41,29,8,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(42,'JH011441','OHASHI Yui','029.115.083-78','26.141.482-3','1956-02-07',1.85,89,1,42,29,9,2);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(43,'PN102243','Aimee Mullins','149.722.822-07','26.614.501-2','1999-09-05',1.79,64,2,43,30,7,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(44,'IN011122','Elisha Voren','014.763.751-19','39.975.757-0','2001-03-07',1.59,86,2,44,30,8,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(45,'UC100132','Taylor Manson','278.216.986-60','15.961.187-8','1945-07-05',1.63,71,1,45,30,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(46,'WY112151','Kenneth Bednarek','653.321.030-00','41.900.608-4','1978-09-01',1.80,85,2,46,30,7,1);
--
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(47,'KL121451','Gaëtane Deberdt','238.864.493-35','34.231.793-3','1988-03-16',1.88,52,1,47,31,8,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(48,'KA022120','Léa Fontaine','226.038.399-85','41.407.544-4','1980-04-04',1.75,81,2,48,31,9,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(49,'KS111451','Jean Berhouzouq','504.727.684-84','28.403.245-1','1971-03-15',1.58,87,1,49,31,7,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa` (id_pessoa, passaporte, nome_pessoa , cpf, rg, dt_nascimento, altura, peso, sexo_id_sexo, filiacao_id_filiacao, cidade_id_cidade_, escolaridade_id_escolaridade, estado_civil_id_estado_civil)
values(50,'WA120115','Julia Tolofua','109.995.586-68','28.253.203-1','1968-03-01',1.63,90,2,50,31,8,1);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Treinador`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(1,'Confederação Brasileira','2012-01-01',null,1,1);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(2,'Confederação Brasileira','2008-01-01',null,1,2);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(3,'Confederação Brasileira','2012-01-01','Atleta olímpico',1,3);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(4,'Confederação Brasileira','2016-01-01',null,1,4);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(5,'Confederação Brasileira','2008-01-01',null,1,5);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(6,'Confederação Brasileira','2004-01-01',null,1,6);

Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(7,'Real Federação Espanhola','2004-01-01',null,2,7);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(8,'Real Federação Espanhola','2004-01-01',null,2,8);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(9,'Real Federação Espanhola','2004-01-01',null,2,9);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(10,'Real Federação Espanhola','2004-01-01',null,2,10);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(11,'Real Federação Espanhola','2004-01-01',null,2,11);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(12,'Real Federação Espanhola','2004-01-01',null,2,12);

Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(13,'AFC (Ásia)','2004-01-01',null,3,13);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(14,'AFC (Ásia)','2004-01-01',null,3,14);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(15,'AFC (Ásia)','2004-01-01',null,3,15);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(16,'AFC (Ásia)','2004-01-01',null,3,16);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(17,'AFC (Ásia)','2004-01-01',null,3,17);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(18,'AFC (Ásia)','2004-01-01',null,3,18);

Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(19,'andebol','2004-01-01',null,4,19);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(20,'andebol','2004-01-01',null,4,20);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(21,'andebol','2004-01-01',null,4,21);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(22,'andebol','2004-01-01',null,4,22);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(23,'andebol','2004-01-01',null,4,23);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(24,'andebol','2004-01-01',null,4,24);

Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(25,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,25);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(26,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,26);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(27,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,27);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(28,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,28);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(29,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,29);
Insert into `SISTEMA_COMPETICAO`.`Treinador` (id_treinador,nome_confederacao, dt_nomeacao, trabalhos_anteriores, delegacao_id_delegacao, pessoa_id_pessoa)
values(30,'União das Sociedades Francesas de Esportes Atléticos','2004-01-01',null,5,30);
-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Classificacao`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Classificacao` (id_classificacao,classificacao, pontuacao_classificacao)
values(1,'Ouro',3);
Insert into `SISTEMA_COMPETICAO`.`Classificacao` (id_classificacao,classificacao, pontuacao_classificacao)
values(2,'Prata',2);
Insert into `SISTEMA_COMPETICAO`.`Classificacao` (id_classificacao,classificacao, pontuacao_classificacao)
values(3,'Bronze',1);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Tipo_modalidade`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Tipo_Modalidade` (id_tipo_modalidade, descricao_tipo_modalidade)
values(1,'Individual');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Modalidade` (id_tipo_modalidade, descricao_tipo_modalidade)
values(2,'coletiva');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Modalidade`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Modalidade` (id_modalidade, nome_modalidade, dt_inclusao_modalidade, Tipo_modalidade_id_tipo_modalidade)
values(1,'Tênis','1896-06-23',2);
Insert into `SISTEMA_COMPETICAO`.`Modalidade` (id_modalidade, nome_modalidade, dt_inclusao_modalidade, Tipo_modalidade_id_tipo_modalidade)
values(2,'Atletismo','1896-06-23',2);
Insert into `SISTEMA_COMPETICAO`.`Modalidade` (id_modalidade, nome_modalidade, dt_inclusao_modalidade, Tipo_modalidade_id_tipo_modalidade)
values(3,'Atletismo_individual','1896-06-23',1);
Insert into `SISTEMA_COMPETICAO`.`Modalidade` (id_modalidade, nome_modalidade, dt_inclusao_modalidade, Tipo_modalidade_id_tipo_modalidade)
values(4,'Judô','1964-06-23',1);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Equipe`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(1,'Tênis Brasileiro',1);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(2,'Tênis Espanhol',7);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(3,'Tênis Japonês',13);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(4,'Tênis Americano',19);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(5,'Tênis Francês',25);

Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(6,'Atletismo Brasileiro',2);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(7,'Atletismo Espanhol',8);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(8,'Atletismo Japonês',14);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(9,'Atletismo Americano',20);
Insert into `SISTEMA_COMPETICAO`.`Equipe` (id_equipe, nome_equipe, treinador_id_treinador)
values(10,'Atletismo Francês',26);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Atletas`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(1,'CPB12005',1,31,1);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(2,'CPB12006',1,32,2);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(3,'CPB12007',1,33,3);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(4,'CPB12008',1,34,null);

Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(5,'CPE12009',2,35,7);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(6,'CPE120010',2,36,8);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(7,'CPE120011',2,37,9);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(8,'CPE120012',2,38,10);

Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(9,'CPJ12055',3,39,13);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(10,'CPJB12506',3,40,14);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(11,'CPJ12067',3,41,15);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(12,'CPJ12068',3,42,16);

Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(13,'CPA12095',4,43,19);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(14,'CPA12086',4,44,20);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(15,'CPA12047',4,45,21);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(16,'CPA12048',4,46,22);

Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(17,'cpf12905',5,47,25);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(18,'cpf12026',5,48,26);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(19,'cpf12017',5,49,27);
Insert into `SISTEMA_COMPETICAO`.`Atletas` (id_atletas, num_licenca_atletas, delegacao_id_delegacao, pessoa_id_pessoa, treinador_id_treinador)
values(20,'cpf12068',5,50,28);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Olimpiada`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Olimpiada`(id_olimpiada, nome_olimpiada, data_realizacao)
values(1,'Rio 2016','2016-08-05');
Insert into `SISTEMA_COMPETICAO`.`Olimpiada`(id_olimpiada, nome_olimpiada, data_realizacao)
values(2,'Tóquio 2020','2021-07-23');

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Participacao`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(2,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(3,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(4,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(5,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(6,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(7,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(8,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(9,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(10,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(11,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(12,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(13,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(14,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(15,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(16,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(17,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(18,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(19,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(20,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(1,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(2,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(3,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(4,2);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(5,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(6,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(7,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(8,2);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(9,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(10,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(11,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(12,2);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(13,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(14,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(15,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(16,2);

Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(17,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(18,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(19,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao`(atletas_id_atletas, olimpiada_id_olimpiada)
values(20,2);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Participacao_de_equipe`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(2,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(3,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(4,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(5,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(6,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(7,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(8,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(9,1);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(10,1);

Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(1,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(2,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(3,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(4,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(5,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(6,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(7,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(8,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(9,2);
Insert into `SISTEMA_COMPETICAO`.`Participacao_de_equipe`(equipe_id_equipe, olimpiada_id_olimpiada)
values(10,2);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Historico`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(1,2);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(1,3);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(1,4);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(1,5);

Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(2,1);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(2,2);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(2,3);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(2,4);
Insert into `SISTEMA_COMPETICAO`.`Historico`(olimpiada_id_olimpiada, pais_id_pais)
values(2,5);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(1,2);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(2,5);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(2,6);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(3,9);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(3,10);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(4,13);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(4,14);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(5,17);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(5,18);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(6,2);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(6,3);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(7,6);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(7,7);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(8,10);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(8,11);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(9,14);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(9,15);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(10,18);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(10,19);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(1,2);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(2,5);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(2,6);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(3,9);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(3,10);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(4,13);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(4,14);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(5,17);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(5,18);

Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(6,2);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(6,3);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(7,6);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(7,7);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(8,10);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(8,11);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(9,14);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(9,15);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(10,18);
Insert into `SISTEMA_COMPETICAO`.`Equipe_de_Atletas`(equipe_id_equipe, atletas_id_atletas)
values(10,19);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Competicao_Individual`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(3,1,3,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(7,1,3,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(11,1,3,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(15,1,3,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(19,1,3,3);


Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(4,1,4,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(8,1,4,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(12,1,4,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(16,1,4,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(20,1,4,3);

Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(3,2,3,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(7,2,3,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(11,2,3,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(15,2,3,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(19,2,3,3);


Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(4,2,4,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(8,2,4,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(12,2,4,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(16,2,4,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Individual`(participacao_atletas_id_atletas, participacao_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(20,2,4,3);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Competicao_Equipe`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`competicao_equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(1,1,1,1);
Insert into `SISTEMA_COMPETICAO`.`competicao_equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(1,1,1,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(2,1,1,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(3,1,1,3);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(4,1,1,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(5,1,1,null);

Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(6,1,2,3);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(7,1,2,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(8,1,2,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(9,1,2,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(10,1,2,2);

Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(1,2,1,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(2,2,1,2);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(3,2,1,3);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(4,2,1,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(5,2,1,null);

Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(6,2,2,3);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(7,2,2,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(8,2,2,null);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(9,2,2,1);
Insert into `SISTEMA_COMPETICAO`.`Competicao_Equipe`(participacao_de_equipe_equipe_id_equipe, participacao_de_equipe_olimpiada_id_olimpiada, modalidade_id_modalidade,classificacao_id_classificacao)
values(10,2,2,2);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Tipo_endereco`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(1,'aeroporto');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(2,'alameda');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(3,'área');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(4,'avenida');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(5,'campo');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(6,'chácara');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(7,'colônia');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(8,'condomínio');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(9,'conjunto');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(10,'distrito');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(11,'esplanada');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(12,'estação');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(13,'estrada');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(14,'favela');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(15,'fazenda');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(16,'feira');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(17,'jardim');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(18,'ladeira');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(19,'lago');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(20,'lagoa');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(21,'largo');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(22,'loteamento');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(23,'morro');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(24,'núcleo');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(25,'parque');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(26,'passarela');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(27,'pátio');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(28,'praça');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(29,'quadra');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(30,'recanto');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(31,'residencial');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(32,'rodovia');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(33,'rua');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(34,'setor');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(35,'sítio');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(36,'travessa');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(37,'trecho');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(38,'trevo');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(39,'vale');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(40,'vereda');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(41,'via');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(42,'viaduto');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(43,'viela');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Endereco` (id_tipo_endereco, descricao_tipo_endereco)
values(44,'vila');


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Bairro`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(1,'Abraão Alab',1);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(2,'Benedito Bentes',2);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(3,'Alvorada',3);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(4,'Adrianópolis',4);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(5,'Prefeitura-Bairro I',5);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(6,'Jardim Iracema',6);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(7,'Goiabeiras',7);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(8,'Setor Marista',8);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(9,'Turu',9);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(10,'Altos do Coxipó',10);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(11,'Centro',11);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(12,'Centro',12);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(13,'Caruara',13);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(14,'Cabo Branco',14);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(15,'Bairro Novo',15);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(16,'Casa Amarela',16);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(17,'Cabral',17);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(18,'Copacabana',18);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(19,'Ponta Negra',19);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(20,'Centro',20);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(21,'Ilhas e Humaitá/Navegantes',21);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(22,'Asa Branca',22);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(23,'Barra da Lagoa',23);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(24,'Consolação',24);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(25,'Jardins',25);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(26,'Setor Santo Amaro',26);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(27,'Asa Norte',27);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(28,'Centro',28);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(29,'Susukino',29);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(30,'Lake Nona',30);
Insert into `SISTEMA_COMPETICAO`.`Bairro` (id_bairro, nome_bairro, cidade_id_cidade)
values(31,'Île Saint-Louis',31);

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Endereco`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(1,2600,'22041-001',null,33,18);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(2,199,'59090-180',null,33,19);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(3,1,'78088-465','Quadra 06',33,10);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(4,154,'90230-040',null,33,21);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(5,135,'29075-080',null,33,7);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(6,58,'88061-150',null,20,23);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(7,14,'37670-000',null,33,24);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(8,158,'01449-000',null,33,25);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(9,61,'77000-000',NULL,33,26);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(10,208,'70853-520',NULL,33,27);



Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(11,60,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(12,61,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(13,62,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(14,63,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(15,64,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(16,65,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(17,66,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(18,67,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(19,68,'28005','Madrid, Espanha',43,28);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(20,69,'28005','Madrid, Espanha',43,28);


Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(21,3,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(22,4,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(23,5,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(24,6,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(25,7,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(26,8,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(27,9,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(28,10,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(29,11,'255-0021',null,33,29);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(30,12,'255-0021',null,33,29);

Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(31,9685,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(32,9686,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(33,9687,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(34,9688,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(35,9689,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(36,9690,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(37,9691,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(38,9692,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(39,9693,'32827','Orlando, FL',33,30);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(40,9694,'32827','Orlando, FL',33,30);

Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(41,30,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(42,31,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(43,32,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(44,33,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(45,34,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(46,35,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(47,36,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(48,37,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(49,38,'75004','Paris, França',19,31);
Insert into `SISTEMA_COMPETICAO`.`Endereco` (id_endereco, numero_endereco, cep, complemento_endereco,tipo_endereco_id_tipo_endereco, bairro_id_bairro)
values(50,39,'75004','Paris, França',19,31);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Tipo_telefone`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Tipo_Telefone` (id_tipo_telefone, descricao_tipo_telefone)
values(1,'Fixo');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Telefone` (id_tipo_telefone, descricao_tipo_telefone)
values(2,'Movel');

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Pessoa_has_endereco`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(1,1);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(2,2);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(3,3);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(4,4);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(5,5);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(6,6);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(31,7);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(32,8);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(33,9);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(34,10);

Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(7,11);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(8,12);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(9,13);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(10,14);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(11,15);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(12,16);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(35,17);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(36,18);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(37,19);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(38,20);

Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(13,21);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(14,22);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(15,23);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(16,24);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(17,25);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(18,26);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(39,27);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(40,28);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(41,29);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(42,30);

Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(19,31);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(20,32);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(21,33);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(22,34);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(23,35);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(24,36);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(43,37);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(44,38);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(45,39);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(46,40);

Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(25,41);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(26,42);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(27,43);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(28,44);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(29,45);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(30,46);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(47,47);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(48,48);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(49,49);
Insert into `SISTEMA_COMPETICAO`.`Pessoa_has_endereco` (pessoa_id_pessoa, endereco_id_endereco)
values(50,50);



-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Telefone`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(1,'(21) 98464-7616',1,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(2,'(37) 99218-4829',2,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(3,'(33) 97552-7603',3,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(4,'(68) 99173-8710',4,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(5,'(84) 99731-2544',5,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(6,'(83) 98544-2611',6,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(7,'(82) 98521-3387',7,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(8,'(69) 97321-8348',8,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(9,'(61) 99466-3050',9,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(10,'(83) 99752-8174',10,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(11,'(61) 99813-6371',11,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(12,'(61) 98550-1181',12,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(13,'(87) 97515-5157',13,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(14,'(82) 98089-4151',14,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(15,'(63) 98473-3827',15,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(16,'(84) 98734-7737',16,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(17,'(95) 96982-5837',17,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(18,'(96) 99884-6382',18,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(19,'(61) 96763-4057',19,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(20,'(63) 98033-4757',20,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(21,'(73) 96705-6012',21,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(22,'(34) 98872-7531',22,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(23,'(84) 98263-2523',23,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(24,'(82) 99833-6017',24,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(25,'(42) 96778-0648',25,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(26,'(54) 98887-4454',26,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(27,'(97) 98946-8230',27,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(28,'(67) 97511-3910',28,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(29,'(79) 98947-4539',29,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(30,'(27) 98938-0872',30,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(31,'(41) 98494-3666',31,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(32,'(49) 98456-8759',32,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(33,'(79) 97333-2887',33,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(34,'(95) 98672-5045',34,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(35,'(68) 98894-4638',35,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(36,'(62) 98450-6553',36,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(37,'(48) 99728-3034',37,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(38,'(84) 98844-7104',38,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(39,'(61) 99543-7474',39,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(40,'(62) 99633-5771',40,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(41,'(84) 99712-2411',41,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(42,'(82) 98743-6746',42,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(43,'(69) 98223-1760',43,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(44,'(84) 97189-2649',44,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(45,'(54) 98593-4598',45,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(46,'(17) 97991-5439',46,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(47,'(61) 96820-0175',47,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(48,'(67) 98103-5587',48,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(49,'(83) 98072-4847',49,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(50,'(61) 97625-3461',50,2);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(51,'(69) 97399-6501',1,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(52,'(84) 99451-6470',2,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(53,'(97) 99504-3728',3,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(54,'(83) 99532-8451',4,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(55,'(88) 98453-6481',5,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(56,'(96) 98577-4415',6,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(57,'(63) 98802-1865',7,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(58,'(66) 98484-8376',8,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(59,'(75) 98891-2317',9,1);
Insert into `SISTEMA_COMPETICAO`.`Telefone` (id_telefone, numero_telefone, pessoa_id_pessoa, tipo_telefone_id_tipo_telefone)
values(60,'(95) 99743-9740',10,1);


-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`Tipo_e-mail`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Tipo_Email` (id_tipo_email, descricao_tipo_email)
values(1,'Pessoal');
Insert into `SISTEMA_COMPETICAO`.`Tipo_Email` (id_tipo_email, descricao_tipo_email)
values(2,'Profissional');

-- -----------------------------------------------------
-- Table `SISTEMA_COMPETICAO`.`E-mail`
-- -----------------------------------------------------
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(1,'Aurora.Caldeira@selecao.com',2,1);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(2,'Benício.Ramos@selecao.com',2,2);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(3,'Gustavo.Figueiredo@selecao.com',2,3);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(4,'Renata.Cardoso@selecao.com',2,4);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(5,'Rafaela.Martins@selecao.com',2,5);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(6,'Guilherme.Mendes@selecao.com',2,6);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(7,'Sarah.Cardoso@selecao.com',2,7);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(8,'Giovana.Peixoto@selecao.com',2,8);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(9,'Augusto.Viana@selecao.com',2,9);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(10,'Fátima.Cruz@selecao.com',2,10);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(11,'Bárbara.Moreira@selecao.com',2,11);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(12,'Cristiane.Fogaça@selecao.com',2,12);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(13,'Thales.Gonçalves@selecao.com',2,13);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(14,'Ryan.Novaes@selecao.com',2,14);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(15,'Edson.Jesus@selecao.com',2,15);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(16,'Giovanni.Costa@selecao.com',2,16);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(17,'Elaine.Porto@selecao.com',2,17);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(18,'Kevin.Martins@selecao.com',2,18);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(19,'Clarice.Cardoso@selecao.com',2,19);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(20,'Osvaldo.Teixeira@selecao.com',2,20);

Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(21,'Sandra.Mota@selecao.com',2,21);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(22,'Helena.Monteiro@selecao.com',2,22);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(23,'Lucca.Teixeira@selecao.com',2,23);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(24,'Natália.Dias@selecao.com',2,24);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(25,'Isabelly.Gomes@selecao.com',2,25);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(26,'Gabriel.Brito@selecao.com',2,26);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(27,'Yago.Silveira@selecao.com',2,27);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(28,'Stella.Alves@selecao.com',2,28);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(29,'Pietro.Almeida@selecao.com',2,29);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(30,'Kevin.Santos@selecao.com',2,30);

Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(31,'Ana.Cunha@selecao.com',2,1);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(32,'Ítalo.Ferreira@selecao.com',2,32);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(33,'Martine.Grael@selecao.com',2,33);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(34,'Kahena.Kunze@selecao.com',2,34);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(35,'Ana.Sagi@selecao.com',2,35);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(36,'César.Castro@selecao.com',2,36);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(37,'Iván.Fernández@selecao.com',2,37);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(38,'Ana.Peleteiro@selecao.com',2,38);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(39,'ABE.Uta@selecao.com',2,39);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(40,'IKEE.Rikako@selecao.com',2,40);

Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(41,'ITO.Mima@selecao.com',2,41);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(42,'OHASHI.Yui@selecao.com',2,42);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(43,'Aimee.Mullins@selecao.com',2,43);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(44,'Elisha.Voren@selecao.com',2,44);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(45,'Taylor.Manson@selecao.com',2,45);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(46,'Kenneth.Bednarek@selecao.com',2,46);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(47,'Gaëtane.Deberdt@selecao.com',2,47);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(48,'Léa.Fontaine@selecao.com',2,48);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(49,'Jean.Berhouzouq@selecao.com',2,49);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(50,'Julia.Tolofua@selecao.com',2,50);

Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(51,'Aurora.Caldeira@gmail.com',1,1);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(52,'Benício.Ramos@gmail.com',1,2);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(53,'Gustavo.Figueiredo@gmail.com',1,3);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(54,'Renata.Cardoso@gmail.com',1,4);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(55,'Rafaela.Martins@gmail.com',1,5);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(56,'Guilherme.Mendes@gmail.com',1,6);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(57,'Sarah.Cardoso@gmail.com',1,7);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(58,'Giovana.Peixoto@gmail.com',1,8);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(59,'Augusto.Viana@gmail.com',1,9);
Insert into `SISTEMA_COMPETICAO`.`Email` (id_email, email,tipo_email_id_tipo_email,pessoa_id_pessoa)
values(60,'Fátima.Cruz@gmail.com',1,10);