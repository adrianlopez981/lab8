INSERT INTO `bbdd_lab8`.`genero` (`idGenero`, `nombre`) VALUES ('1', 'M');
INSERT INTO `bbdd_lab8`.`genero` (`idGenero`, `nombre`) VALUES ('2', 'F');
INSERT INTO `bbdd_lab8`.`genero` (`idGenero`, `nombre`) VALUES ('3', 'O');



INSERT INTO `bbdd_lab8`.`claseheroe` (`idClaseHeroe`, `nombreClaseHeroe`) VALUES ('1', 'paladín');
INSERT INTO `bbdd_lab8`.`claseheroe` (`idClaseHeroe`, `nombreClaseHeroe`) VALUES ('2', 'mago');
INSERT INTO `bbdd_lab8`.`claseheroe` (`idClaseHeroe`, `nombreClaseHeroe`) VALUES ('3', 'doma dragones');
INSERT INTO `bbdd_lab8`.`claseheroe` (`idClaseHeroe`, `nombreClaseHeroe`) VALUES ('4', 'guerrero');
INSERT INTO `bbdd_lab8`.`claseheroe` (`idClaseHeroe`, `nombreClaseHeroe`) VALUES ('5', 'cazador');



INSERT INTO `bbdd_lab8`.`inventarioobjetosheroe` (`idInventarioObjetosHeroe`, `cantidadObjetos`, `pesoTotalObjetos`) VALUES ('10', '5', '16');
INSERT INTO `bbdd_lab8`.`inventarioobjetosheroe` (`idInventarioObjetosHeroe`, `cantidadObjetos`, `pesoTotalObjetos`) VALUES ('11', '6', '17');
INSERT INTO `bbdd_lab8`.`inventarioobjetosheroe` (`idInventarioObjetosHeroe`, `cantidadObjetos`, `pesoTotalObjetos`) VALUES ('12', '7', '18');
INSERT INTO `bbdd_lab8`.`inventarioobjetosheroe` (`idInventarioObjetosHeroe`, `cantidadObjetos`, `pesoTotalObjetos`) VALUES ('13', '8', '19');
INSERT INTO `bbdd_lab8`.`inventarioobjetosheroe` (`idInventarioObjetosHeroe`, `cantidadObjetos`, `pesoTotalObjetos`) VALUES ('14', '9', '20');


INSERT INTO `bbdd_lab8`.`listahechizoheroe` (`idListaHechizoHeroe`) VALUES ('1');
INSERT INTO `bbdd_lab8`.`listahechizoheroe` (`idListaHechizoHeroe`) VALUES ('2');
INSERT INTO `bbdd_lab8`.`listahechizoheroe` (`idListaHechizoHeroe`) VALUES ('3');
INSERT INTO `bbdd_lab8`.`listahechizoheroe` (`idListaHechizoHeroe`) VALUES ('4');
INSERT INTO `bbdd_lab8`.`listahechizoheroe` (`idListaHechizoHeroe`) VALUES ('5');



INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('1');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('2');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('3');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('4');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('5');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('6');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('7');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('8');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('9');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('10');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('11');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('12');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('13');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('14');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('15');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('16');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('17');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('18');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('19');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('20');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('21');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('22');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('23');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('24');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('25');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('26');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('27');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('28');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('29');
INSERT INTO `bbdd_lab8`.`nivelheroe` (`idNivelHeroe`) VALUES ('30');





INSERT INTO `bbdd_lab8`.`heroe` (`idHeroe`, `nombreHeroe`, `edadHeroe`, `parejaHeroe`, `InventarioObjetosHeroe_idInventarioObjetosHeroe`, `disponibilidadHeroe`, `ListaHechizoHeroe_idListaHechizoHeroe`, `Genero_idGenero`, `ClaseHeroe_idClaseHeroe`, `NivelHeroe_idNivelHeroe`, `PuntosXPHeroe`) VALUES ('1', 'Thrall', '20', 'si', '10', 'si', '1', '1', '1', '10', '100');
INSERT INTO `bbdd_lab8`.`heroe` (`idHeroe`, `nombreHeroe`, `edadHeroe`, `parejaHeroe`, `InventarioObjetosHeroe_idInventarioObjetosHeroe`, `disponibilidadHeroe`, `ListaHechizoHeroe_idListaHechizoHeroe`, `Genero_idGenero`, `ClaseHeroe_idClaseHeroe`, `NivelHeroe_idNivelHeroe`, `PuntosXPHeroe`) VALUES ('2', 'Poseidon', '26', 'si', '11', 'si', '2', '1', '2', '15', '200');
INSERT INTO `bbdd_lab8`.`heroe` (`idHeroe`, `nombreHeroe`, `edadHeroe`, `parejaHeroe`, `InventarioObjetosHeroe_idInventarioObjetosHeroe`, `disponibilidadHeroe`, `ListaHechizoHeroe_idListaHechizoHeroe`, `Genero_idGenero`, `ClaseHeroe_idClaseHeroe`, `NivelHeroe_idNivelHeroe`, `PuntosXPHeroe`) VALUES ('3', 'Jaina', '32', 'no', '12', 'si', '3', '2', '3', '20', '300');
INSERT INTO `bbdd_lab8`.`heroe` (`idHeroe`, `nombreHeroe`, `edadHeroe`, `parejaHeroe`, `InventarioObjetosHeroe_idInventarioObjetosHeroe`, `disponibilidadHeroe`, `ListaHechizoHeroe_idListaHechizoHeroe`, `Genero_idGenero`, `ClaseHeroe_idClaseHeroe`, `NivelHeroe_idNivelHeroe`, `PuntosXPHeroe`) VALUES ('4', 'Odin', '19', 'no', '13', 'si', '4', '1', '4', '25', '400');
INSERT INTO `bbdd_lab8`.`heroe` (`idHeroe`, `nombreHeroe`, `edadHeroe`, `parejaHeroe`, `InventarioObjetosHeroe_idInventarioObjetosHeroe`, `disponibilidadHeroe`, `ListaHechizoHeroe_idListaHechizoHeroe`, `Genero_idGenero`, `ClaseHeroe_idClaseHeroe`, `NivelHeroe_idNivelHeroe`, `PuntosXPHeroe`) VALUES ('5', 'Zeus', '60', 'no', '14', 'no', '5', '3', '5', '30', '500');



INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('20','21','22','23','24','25');
INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('26','27','28','29','30','31');
INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('32','33','34','35','36','37');
INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('38','39','40','41','42','43');
INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('44','45','46','47','48','49');
INSERT INTO `bbdd_lab8`.`estadisticaheroe` (`ataque`, `defensa`, `velocidad`, `poderMagico`, `espiritu`, `suerte`) VALUES ('50','51','52','53','54','55');


INSERT INTO `bbdd_lab8`.`estadisticaheroe_has_heroe` (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`) VALUES ('1', '1');
INSERT INTO `bbdd_lab8`.`estadisticaheroe_has_heroe` (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`) VALUES ('2', '2');
INSERT INTO `bbdd_lab8`.`estadisticaheroe_has_heroe` (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`) VALUES ('3', '3');
INSERT INTO `bbdd_lab8`.`estadisticaheroe_has_heroe` (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`) VALUES ('4', '4');
INSERT INTO `bbdd_lab8`.`estadisticaheroe_has_heroe` (`EstadisticaHeroe_idEstadisticaHeroe`, `Heroe_idHeroe`) VALUES ('5', '5');




INSERT INTO `bbdd_lab8`.`pareja` (`idPareja`, `Heroe_idHeroe`) VALUES ('1', '1');
INSERT INTO `bbdd_lab8`.`pareja` (`idPareja`, `Heroe_idHeroe`) VALUES ('2', '2');

INSERT INTO `bbdd_lab8`.`relacionpareja` (`Heroe_idHeroe`, `Pareja_idPareja`) VALUES ('1', '2');
INSERT INTO `bbdd_lab8`.`relacionpareja` (`Heroe_idHeroe`, `Pareja_idPareja`) VALUES ('2', '1');

UPDATE `bbdd_lab8`.`heroe` SET `Pareja_idPareja` = '2' WHERE (`idHeroe` = '1');
UPDATE `bbdd_lab8`.`heroe` SET `Pareja_idPareja` = '1' WHERE (`idHeroe` = '2');
