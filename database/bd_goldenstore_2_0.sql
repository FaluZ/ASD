CREATE TABLE `categoria` (
	`id_Categoria` INT(11) NOT NULL AUTO_INCREMENT,
	`nombreCategoria` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id_Categoria`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;
CREATE TABLE `producto` (
	`id_Producto` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`imagen` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nombreProducto` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`descripcion` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`talla` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`monto` DECIMAL(9,2) NOT NULL,
	`descuento` DECIMAL(9,2) NULL DEFAULT NULL,
	`monto_total` DECIMAL(9,2) NOT NULL,
	`status` TINYINT(4) NOT NULL,
	`id_Categoria` INT(11) NOT NULL,
	`genero` CHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id_Producto`) USING BTREE,
	INDEX `FKProducto105040` (`id_Categoria`) USING BTREE,
	CONSTRAINT `FKProducto105040` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria` (`id_Categoria`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=17
;


CREATE TABLE `tipo_documento` (
	`id_TipoDocumento` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`nomTipoDocumento` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id_TipoDocumento`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;
CREATE TABLE `tipo_usuario` (
	`id_TipoUsuario` BIGINT(20) NOT NULL,
	`nomTipoUsuario` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id_TipoUsuario`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `usuario` (
	`id_Usuario` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`avatar` LONGBLOB NULL DEFAULT NULL,
	`numeroDocumento` VARCHAR(45) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombres` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`apellidos` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`usuario` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`contraseña` VARCHAR(8) NOT NULL COLLATE 'utf8mb4_general_ci',
	`telefono` CHAR(9) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fechaNacimiento` DATE NOT NULL,
	`fechaCreación` DATETIME NOT NULL DEFAULT current_timestamp(),
	`status` TINYINT(4) NOT NULL,
	`id_TipoDocumento` BIGINT(20) NOT NULL,
	`id_TipoUsuario` BIGINT(20) NOT NULL,
	PRIMARY KEY (`id_Usuario`) USING BTREE,
	UNIQUE INDEX `numeroDocumento` (`numeroDocumento`) USING BTREE,
	UNIQUE INDEX `usuario` (`usuario`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE,
	UNIQUE INDEX `telefono` (`telefono`) USING BTREE,
	INDEX `FKUsuario250236` (`id_TipoDocumento`) USING BTREE,
	INDEX `fk_TipoUsuario` (`id_TipoUsuario`) USING BTREE,
	CONSTRAINT `FKUsuario250236` FOREIGN KEY (`id_TipoDocumento`) REFERENCES `tipo_documento` (`id_TipoDocumento`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `fk_TipoUsuario` FOREIGN KEY (`id_TipoUsuario`) REFERENCES `tipo_usuario` (`id_TipoUsuario`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=16
;
