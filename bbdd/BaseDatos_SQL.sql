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
-- Table `mydb`.`InventarioObjetosHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InventarioObjetosHeroe` (
  `idInventarioObjetosHeroe` INT NOT NULL,
  `cantidadObjetos` VARCHAR(45) NOT NULL,
  `pesoTotalObjetos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInventarioObjetosHeroe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pareja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pareja` (
  `idPareja` INT NOT NULL,
  `Heroe_idHeroe` INT NOT NULL,
  INDEX `fk_Pareja_Heroe1_idx` (`Heroe_idHeroe` ASC) VISIBLE,
  PRIMARY KEY (`idPareja`),
  CONSTRAINT `fk_Pareja_Heroe1`
    FOREIGN KEY (`Heroe_idHeroe`)
    REFERENCES `mydb`.`Heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ListaHechizoHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ListaHechizoHeroe` (
  `idListaHechizoHeroe` INT NOT NULL,
  PRIMARY KEY (`idListaHechizoHeroe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(1) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClaseHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ClaseHeroe` (
  `idClaseHeroe` INT NOT NULL,
  `nombreClaseHeroe` TEXT(50) NOT NULL,
  PRIMARY KEY (`idClaseHeroe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NivelHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NivelHeroe` (
  `idNivelHeroe` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idNivelHeroe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Heroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Heroe` (
  `idHeroe` INT NOT NULL,
  `nombreHeroe` CHAR(10) NOT NULL DEFAULT 'nuevoHeroe',
  `edadHeroe` SMALLINT NOT NULL,
  `parejaHeroe` CHAR(2) NOT NULL,
  `InventarioObjetosHeroe_idInventarioObjetosHeroe` INT NOT NULL,
  `disponibilidadHeroe` CHAR(2) NOT NULL,
  `Pareja_idPareja` INT NULL,
  `ListaHechizoHeroe_idListaHechizoHeroe` INT NOT NULL,
  `Genero_idGenero` INT NOT NULL,
  `ClaseHeroe_idClaseHeroe` INT NOT NULL,
  `NivelHeroe_idNivelHeroe` INT NOT NULL,
  `PuntosXPHeroe` INT NOT NULL,
  PRIMARY KEY (`idHeroe`),
  INDEX `fk_Heroe_InventarioObjetosHeroe_idx` (`InventarioObjetosHeroe_idInventarioObjetosHeroe` ASC) VISIBLE,
  INDEX `fk_Heroe_Pareja1_idx` (`Pareja_idPareja` ASC) VISIBLE,
  INDEX `fk_Heroe_ListaHechizoHeroe1_idx` (`ListaHechizoHeroe_idListaHechizoHeroe` ASC) VISIBLE,
  INDEX `fk_Heroe_Genero1_idx` (`Genero_idGenero` ASC) VISIBLE,
  INDEX `fk_Heroe_ClaseHeroe1_idx` (`ClaseHeroe_idClaseHeroe` ASC) VISIBLE,
  INDEX `fk_Heroe_NivelHeroe1_idx` (`NivelHeroe_idNivelHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_Heroe_InventarioObjetosHeroe`
    FOREIGN KEY (`InventarioObjetosHeroe_idInventarioObjetosHeroe`)
    REFERENCES `mydb`.`InventarioObjetosHeroe` (`idInventarioObjetosHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_Pareja1`
    FOREIGN KEY (`Pareja_idPareja`)
    REFERENCES `mydb`.`Pareja` (`idPareja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_ListaHechizoHeroe1`
    FOREIGN KEY (`ListaHechizoHeroe_idListaHechizoHeroe`)
    REFERENCES `mydb`.`ListaHechizoHeroe` (`idListaHechizoHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `mydb`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_ClaseHeroe1`
    FOREIGN KEY (`ClaseHeroe_idClaseHeroe`)
    REFERENCES `mydb`.`ClaseHeroe` (`idClaseHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_NivelHeroe1`
    FOREIGN KEY (`NivelHeroe_idNivelHeroe`)
    REFERENCES `mydb`.`NivelHeroe` (`idNivelHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClasificacionAtaqueEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ClasificacionAtaqueEnemigo` (
  `idClasificacionAtaqueEnemigo` INT NOT NULL,
  `Clasificacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClasificacionAtaqueEnemigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ListaAtaquesEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ListaAtaquesEnemigo` (
  `idListaAtaquesEnemigo` INT NOT NULL AUTO_INCREMENT,
  `ClasificacionAtaqueEnemigo_idClasificacionAtaqueEnemigo` INT NOT NULL,
  PRIMARY KEY (`idListaAtaquesEnemigo`),
  INDEX `fk_ListaAtaquesEnemigo_ClasificacionAtaqueEnemigo1_idx` (`ClasificacionAtaqueEnemigo_idClasificacionAtaqueEnemigo` ASC) VISIBLE,
  CONSTRAINT `fk_ListaAtaquesEnemigo_ClasificacionAtaqueEnemigo1`
    FOREIGN KEY (`ClasificacionAtaqueEnemigo_idClasificacionAtaqueEnemigo`)
    REFERENCES `mydb`.`ClasificacionAtaqueEnemigo` (`idClasificacionAtaqueEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExperienciaXDerrotaEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ExperienciaXDerrotaEnemigo` (
  `idExperienciaXDerrotaEnemigo` INT NOT NULL AUTO_INCREMENT,
  `cantidadXP` INT NOT NULL,
  `NumerosDeHeroesXDerrota` INT NOT NULL,
  `cantidadXPRepartida` VARCHAR(45) NULL,
  PRIMARY KEY (`idExperienciaXDerrotaEnemigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enemigo` (
  `idEnemigo` INT NOT NULL,
  `nombreEnemigo` CHAR(10) NOT NULL,
  `ListaAtaquesEnemigo_idListaAtaquesEnemigo` INT NOT NULL,
  `Genero_idGenero` INT NULL,
  `ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo` INT NOT NULL,
  PRIMARY KEY (`idEnemigo`),
  INDEX `fk_Enemigo_ListaAtaquesEnemigo1_idx` (`ListaAtaquesEnemigo_idListaAtaquesEnemigo` ASC) VISIBLE,
  INDEX `fk_Enemigo_Genero1_idx` (`Genero_idGenero` ASC) VISIBLE,
  INDEX `fk_Enemigo_ExperienciaXDerrotaEnemigo1_idx` (`ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo` ASC) VISIBLE,
  CONSTRAINT `fk_Enemigo_ListaAtaquesEnemigo1`
    FOREIGN KEY (`ListaAtaquesEnemigo_idListaAtaquesEnemigo`)
    REFERENCES `mydb`.`ListaAtaquesEnemigo` (`idListaAtaquesEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enemigo_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `mydb`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enemigo_ExperienciaXDerrotaEnemigo1`
    FOREIGN KEY (`ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo`)
    REFERENCES `mydb`.`ExperienciaXDerrotaEnemigo` (`idExperienciaXDerrotaEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Elemento` (
  `idElemento` INT NOT NULL,
  `nombreElemento` VARCHAR(45) NULL,
  PRIMARY KEY (`idElemento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Objeto` (
  `idObjeto` INT NOT NULL,
  `nombreObjeto` VARCHAR(45) NOT NULL,
  `efecto/usoObjeto` VARCHAR(45) NOT NULL,
  `pesoObjeto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idObjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProbabilidadObjeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProbabilidadObjeto` (
  `idProbabilidadObjeto` INT NOT NULL,
  `numeroProbabilidad` VARCHAR(45) NULL,
  `Objeto_idObjeto` INT NOT NULL,
  PRIMARY KEY (`idProbabilidadObjeto`),
  INDEX `fk_ProbabilidadObjeto_Objeto1_idx` (`Objeto_idObjeto` ASC) VISIBLE,
  CONSTRAINT `fk_ProbabilidadObjeto_Objeto1`
    FOREIGN KEY (`Objeto_idObjeto`)
    REFERENCES `mydb`.`Objeto` (`idObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Magia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Magia` (
  `idMagia` INT NOT NULL AUTO_INCREMENT,
  `hexaHechizoId` VARCHAR(45) NULL,
  `nombreHechizo` VARCHAR(45) NULL,
  `potenciaHechizo` VARCHAR(45) NULL,
  `precisionHechizo` VARCHAR(45) NULL,
  `Elemento_idElemento` INT NOT NULL,
  `ProbabilidadObjeto_idProbabilidadObjeto` INT NOT NULL,
  `exclusividad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMagia`),
  INDEX `fk_Magia_Elemento1_idx` (`Elemento_idElemento` ASC) VISIBLE,
  INDEX `fk_Magia_ProbabilidadObjeto1_idx` (`ProbabilidadObjeto_idProbabilidadObjeto` ASC) VISIBLE,
  CONSTRAINT `fk_Magia_Elemento1`
    FOREIGN KEY (`Elemento_idElemento`)
    REFERENCES `mydb`.`Elemento` (`idElemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Magia_ProbabilidadObjeto1`
    FOREIGN KEY (`ProbabilidadObjeto_idProbabilidadObjeto`)
    REFERENCES `mydb`.`ProbabilidadObjeto` (`idProbabilidadObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ObjetosxInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ObjetosxInventario` (
  `InventarioObjetosHeroe_idInventarioObjetosHeroe` INT NOT NULL,
  `Objeto_idObjeto` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_InventarioObjetosHeroe_has_Objeto_Objeto1_idx` (`Objeto_idObjeto` ASC) VISIBLE,
  INDEX `fk_InventarioObjetosHeroe_has_Objeto_InventarioObjetosHeroe_idx` (`InventarioObjetosHeroe_idInventarioObjetosHeroe` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_InventarioObjetosHeroe_has_Objeto_InventarioObjetosHeroe1`
    FOREIGN KEY (`InventarioObjetosHeroe_idInventarioObjetosHeroe`)
    REFERENCES `mydb`.`InventarioObjetosHeroe` (`idInventarioObjetosHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InventarioObjetosHeroe_has_Objeto_Objeto1`
    FOREIGN KEY (`Objeto_idObjeto`)
    REFERENCES `mydb`.`Objeto` (`idObjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RelacionPareja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RelacionPareja` (
  `Heroe_idHeroe` INT NOT NULL,
  `Pareja_idPareja` INT NULL,
  PRIMARY KEY (`Heroe_idHeroe`, `Pareja_idPareja`),
  INDEX `fk_Heroe_has_Pareja_Pareja1_idx` (`Pareja_idPareja` ASC) VISIBLE,
  INDEX `fk_Heroe_has_Pareja_Heroe1_idx` (`Heroe_idHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_Heroe_has_Pareja_Heroe1`
    FOREIGN KEY (`Heroe_idHeroe`)
    REFERENCES `mydb`.`Heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_has_Pareja_Pareja1`
    FOREIGN KEY (`Pareja_idPareja`)
    REFERENCES `mydb`.`Pareja` (`idPareja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClaseEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ClaseEnemigo` (
  `idClaseEnemigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `debilidad` VARCHAR(45) NULL,
  `fortaleza` VARCHAR(45) NULL,
  `porcentajeFortaleza` VARCHAR(45) NULL,
  `porcentajeDebilidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idClaseEnemigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClaseEnemigoXEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ClaseEnemigoXEnemigo` (
  `Enemigo_idEnemigo` INT NOT NULL,
  `ClaseEnemigo_idClaseEnemigo` INT NOT NULL,
  PRIMARY KEY (`Enemigo_idEnemigo`, `ClaseEnemigo_idClaseEnemigo`),
  INDEX `fk_Enemigo_has_ClaseEnemigo_ClaseEnemigo1_idx` (`ClaseEnemigo_idClaseEnemigo` ASC) VISIBLE,
  INDEX `fk_Enemigo_has_ClaseEnemigo_Enemigo1_idx` (`Enemigo_idEnemigo` ASC) VISIBLE,
  CONSTRAINT `fk_Enemigo_has_ClaseEnemigo_Enemigo1`
    FOREIGN KEY (`Enemigo_idEnemigo`)
    REFERENCES `mydb`.`Enemigo` (`idEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enemigo_has_ClaseEnemigo_ClaseEnemigo1`
    FOREIGN KEY (`ClaseEnemigo_idClaseEnemigo`)
    REFERENCES `mydb`.`ClaseEnemigo` (`idClaseEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AtaquesXListaDeAtaques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AtaquesXListaDeAtaques` (
  `Magia_idMagia` INT NOT NULL,
  `ListaAtaquesEnemigo_idListaAtaquesEnemigo` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Magia_has_ListaAtaquesEnemigo_ListaAtaquesEnemigo1_idx` (`ListaAtaquesEnemigo_idListaAtaquesEnemigo` ASC) VISIBLE,
  INDEX `fk_Magia_has_ListaAtaquesEnemigo_Magia1_idx` (`Magia_idMagia` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Magia_has_ListaAtaquesEnemigo_Magia1`
    FOREIGN KEY (`Magia_idMagia`)
    REFERENCES `mydb`.`Magia` (`idMagia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Magia_has_ListaAtaquesEnemigo_ListaAtaquesEnemigo1`
    FOREIGN KEY (`ListaAtaquesEnemigo_idListaAtaquesEnemigo`)
    REFERENCES `mydb`.`ListaAtaquesEnemigo` (`idListaAtaquesEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HechizoxListaHechizo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HechizoxListaHechizo` (
  `ListaHechizoHeroe_idListaHechizoHeroe` INT NOT NULL,
  `Magia_idMagia` INT NOT NULL,
  `id` INT NOT NULL,
  `nivelHechizo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ListaHechizoHeroe_has_Magia_Magia1_idx` (`Magia_idMagia` ASC) VISIBLE,
  INDEX `fk_ListaHechizoHeroe_has_Magia_ListaHechizoHeroe1_idx` (`ListaHechizoHeroe_idListaHechizoHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_ListaHechizoHeroe_has_Magia_ListaHechizoHeroe1`
    FOREIGN KEY (`ListaHechizoHeroe_idListaHechizoHeroe`)
    REFERENCES `mydb`.`ListaHechizoHeroe` (`idListaHechizoHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaHechizoHeroe_has_Magia_Magia1`
    FOREIGN KEY (`Magia_idMagia`)
    REFERENCES `mydb`.`Magia` (`idMagia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ListaEnemigosDerrotados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ListaEnemigosDerrotados` (
  `idListaEnemigosDerrotados` INT NOT NULL,
  `sumaTotalXPEnemigosDerrotados` INT NOT NULL,
  PRIMARY KEY (`idListaEnemigosDerrotados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EnemigosXListaEnemigosDerrotados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EnemigosXListaEnemigosDerrotados` (
  `ListaEnemigosDerrotados_idListaEnemigosDerrotados` INT NOT NULL,
  `Enemigo_idEnemigo` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_ListaEnemigosDerrotados_has_Enemigo_Enemigo1_idx` (`Enemigo_idEnemigo` ASC) VISIBLE,
  INDEX `fk_ListaEnemigosDerrotados_has_Enemigo_ListaEnemigosDerrota_idx` (`ListaEnemigosDerrotados_idListaEnemigosDerrotados` ASC) VISIBLE,
  CONSTRAINT `fk_ListaEnemigosDerrotados_has_Enemigo_ListaEnemigosDerrotados1`
    FOREIGN KEY (`ListaEnemigosDerrotados_idListaEnemigosDerrotados`)
    REFERENCES `mydb`.`ListaEnemigosDerrotados` (`idListaEnemigosDerrotados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaEnemigosDerrotados_has_Enemigo_Enemigo1`
    FOREIGN KEY (`Enemigo_idEnemigo`)
    REFERENCES `mydb`.`Enemigo` (`idEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`XPxNivelxHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`XPxNivelxHeroe` (
  `Heroe_idHeroe` INT NOT NULL,
  `NivelHeroe_idNivelHeroe` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `XPxNivelHeroe` VARCHAR(45) NOT NULL,
  INDEX `fk_Heroe_has_NivelHeroe_NivelHeroe1_idx` (`NivelHeroe_idNivelHeroe` ASC) VISIBLE,
  INDEX `fk_Heroe_has_NivelHeroe_Heroe1_idx` (`Heroe_idHeroe` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Heroe_has_NivelHeroe_Heroe1`
    FOREIGN KEY (`Heroe_idHeroe`)
    REFERENCES `mydb`.`Heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroe_has_NivelHeroe_NivelHeroe1`
    FOREIGN KEY (`NivelHeroe_idNivelHeroe`)
    REFERENCES `mydb`.`NivelHeroe` (`idNivelHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ListaEnemigosDerrotadosXHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ListaEnemigosDerrotadosXHeroe` (
  `ListaEnemigosDerrotados_idListaEnemigosDerrotados` INT NOT NULL,
  `Heroe_idHeroe` INT NOT NULL,
  PRIMARY KEY (`Heroe_idHeroe`, `ListaEnemigosDerrotados_idListaEnemigosDerrotados`),
  INDEX `fk_ListaEnemigosDerrotadosXHeroe_ListaEnemigosDerrotados1_idx` (`ListaEnemigosDerrotados_idListaEnemigosDerrotados` ASC) VISIBLE,
  INDEX `fk_ListaEnemigosDerrotadosXHeroe_Heroe1_idx` (`Heroe_idHeroe` ASC) VISIBLE,
  UNIQUE INDEX `Heroe_idHeroe_UNIQUE` (`Heroe_idHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_ListaEnemigosDerrotadosXHeroe_ListaEnemigosDerrotados1`
    FOREIGN KEY (`ListaEnemigosDerrotados_idListaEnemigosDerrotados`)
    REFERENCES `mydb`.`ListaEnemigosDerrotados` (`idListaEnemigosDerrotados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaEnemigosDerrotadosXHeroe_Heroe1`
    FOREIGN KEY (`Heroe_idHeroe`)
    REFERENCES `mydb`.`Heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadisticaHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadisticaHeroe` (
  `idEstadisticaHeroe` INT NOT NULL,
  `nombreEstadistica` VARCHAR(45) NOT NULL,
  `valorEstadistica` INT NOT NULL,
  PRIMARY KEY (`idEstadisticaHeroe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadisticaHeroe_has_XPxNivelxHeroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadisticaHeroe_has_XPxNivelxHeroe` (
  `EstadisticaHeroe_idEstadisticaHeroe` INT NOT NULL,
  `XPxNivelxHeroe_id` INT NOT NULL,
  `valorEstadisticaxHeroexNivel` INT NOT NULL,
  PRIMARY KEY (`EstadisticaHeroe_idEstadisticaHeroe`, `XPxNivelxHeroe_id`),
  INDEX `fk_EstadisticaHeroe_has_XPxNivelxHeroe_XPxNivelxHeroe1_idx` (`XPxNivelxHeroe_id` ASC) VISIBLE,
  INDEX `fk_EstadisticaHeroe_has_XPxNivelxHeroe_EstadisticaHeroe1_idx` (`EstadisticaHeroe_idEstadisticaHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_EstadisticaHeroe_has_XPxNivelxHeroe_EstadisticaHeroe1`
    FOREIGN KEY (`EstadisticaHeroe_idEstadisticaHeroe`)
    REFERENCES `mydb`.`EstadisticaHeroe` (`idEstadisticaHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstadisticaHeroe_has_XPxNivelxHeroe_XPxNivelxHeroe1`
    FOREIGN KEY (`XPxNivelxHeroe_id`)
    REFERENCES `mydb`.`XPxNivelxHeroe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadisticaHeroe_has_Heroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadisticaHeroe_has_Heroe` (
  `EstadisticaHeroe_idEstadisticaHeroe` INT NOT NULL,
  `Heroe_idHeroe` INT NOT NULL,
  PRIMARY KEY (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`),
  INDEX `fk_EstadisticaHeroe_has_Heroe_Heroe1_idx` (`Heroe_idHeroe` ASC) VISIBLE,
  INDEX `fk_EstadisticaHeroe_has_Heroe_EstadisticaHeroe1_idx` (`EstadisticaHeroe_idEstadisticaHeroe` ASC) VISIBLE,
  CONSTRAINT `fk_EstadisticaHeroe_has_Heroe_EstadisticaHeroe1`
    FOREIGN KEY (`EstadisticaHeroe_idEstadisticaHeroe`)
    REFERENCES `mydb`.`EstadisticaHeroe` (`idEstadisticaHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstadisticaHeroe_has_Heroe_Heroe1`
    FOREIGN KEY (`Heroe_idHeroe`)
    REFERENCES `mydb`.`Heroe` (`idHeroe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadisticaEnemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadisticaEnemigo` (
  `idEstadisticaEnemigo` INT NOT NULL,
  `nombreEstadistica` VARCHAR(45) NOT NULL,
  `valorEstadistica` INT NOT NULL,
  PRIMARY KEY (`idEstadisticaEnemigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadisticaEnemigo_has_Enemigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadisticaEnemigo_has_Enemigo` (
  `EstadisticaEnemigo_idEstadisticaEnemigo` INT NOT NULL,
  `Enemigo_idEnemigo` INT NOT NULL,
  PRIMARY KEY (`EstadisticaEnemigo_idEstadisticaEnemigo`, `Enemigo_idEnemigo`),
  INDEX `fk_EstadisticaEnemigo_has_Enemigo_Enemigo1_idx` (`Enemigo_idEnemigo` ASC) VISIBLE,
  INDEX `fk_EstadisticaEnemigo_has_Enemigo_EstadisticaEnemigo1_idx` (`EstadisticaEnemigo_idEstadisticaEnemigo` ASC) VISIBLE,
  CONSTRAINT `fk_EstadisticaEnemigo_has_Enemigo_EstadisticaEnemigo1`
    FOREIGN KEY (`EstadisticaEnemigo_idEstadisticaEnemigo`)
    REFERENCES `mydb`.`EstadisticaEnemigo` (`idEstadisticaEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstadisticaEnemigo_has_Enemigo_Enemigo1`
    FOREIGN KEY (`Enemigo_idEnemigo`)
    REFERENCES `mydb`.`Enemigo` (`idEnemigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HechizoxNivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HechizoxNivel` (
  `idHechizoxNivel` INT NOT NULL AUTO_INCREMENT,
  `Magia_idMagia` INT NOT NULL,
  `NivelParaHechizoActual` VARCHAR(45) NOT NULL,
  `NivelParaNuevoHechizo` VARCHAR(45) NOT NULL,
  `NuevoHechizo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHechizoxNivel`),
  INDEX `fk_HechizoxNivel_Magia1_idx` (`Magia_idMagia` ASC) VISIBLE,
  CONSTRAINT `fk_HechizoxNivel_Magia1`
    FOREIGN KEY (`Magia_idMagia`)
    REFERENCES `mydb`.`Magia` (`idMagia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
