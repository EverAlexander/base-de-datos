CREATE DATABASE sistema_de_inventario_y_mantenimiento;

USE sistema_de_inventario_y_mantenimiento_de_equipos;


CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE rol(
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion_rol VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE usuarios_x_roles(
    id_usuarios_x_roles INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_fk INT,
    id_rol_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE usuarios_x_roles ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario_fk) REFERENCES usuario(id_usuario);
ALTER TABLE usuarios_x_roles ADD CONSTRAINT fk_id_rol FOREIGN KEY (id_rol_fk) REFERENCES rol(id_rol);

CREATE TABLE permiso(
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(50) NOT NULL,
    descripcion_permiso VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE roles_x_permisos(
    id_roles_x_permisos INT AUTO_INCREMENT PRIMARY KEY,
    id_rol_fk INT,
    id_permiso_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE roles_x_permisos ADD CONSTRAINT fk_id_rol_permiso FOREIGN KEY(id_rol_fk) REFERENCES rol(id_rol);
ALTER TABLE roles_x_permisos ADD CONSTRAINT fk_id_permiso_rol FOREIGN KEY(id_permiso_fk) REFERENCES permiso(id_permiso);

CREATE TABLE marca(
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL,
    descripcion_marca VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE modelo(
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(50) NOT NULL,
    descripcion_modelo VARCHAR(100) NULL,
    id_marca_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE modelo ADD CONSTRAINT fk_id_marca FOREIGN KEY(id_marca_fk) REFERENCES marca(id_marca);

CREATE TABLE tipo_equipo(
    id_tipo_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo_equipo VARCHAR(50) NOT NULL,
    descripcion_tipo_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE posicion_equipo(
    id_posicion_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_posicion_equipo VARCHAR(50) NOT NULL,
    descripcion_posicion_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE ubicacion_equipo(
    id_ubicacion_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ubicacion_equipo VARCHAR(50) NOT NULL,
    descripcion_ubicacion_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE equipo(
    id_equipo_serie VARCHAR(50) PRIMARY KEY,
    activo_fijo_equipo VARCHAR(50) NULL,
    color_equipo VARCHAR(50) NULL,
    descripcion_equipo VARCHAR(100) NULL,
    id_marca_fk int,
    id_tipo_equipo_fk INT,
    id_posicion_equipo_fk INT,
    id_ubicacion_equipo_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE equipo ADD CONSTRAINT fk_id_marca_equipo FOREIGN KEY(id_marca_fk) REFERENCES marca(id_marca);
ALTER TABLE equipo ADD CONSTRAINT fk_id_tipo_equipo FOREIGN KEY(id_tipo_equipo_fk) REFERENCES tipo_equipo(id_tipo_equipo);
ALTER TABLE equipo ADD CONSTRAINT fk_id_posicion_equipo FOREIGN KEY(id_posicion_equipo_fk) REFERENCES posicion_equipo(id_posicion_equipo);
ALTER TABLE equipo ADD CONSTRAINT fk_id_ubicacion_equipo FOREIGN KEY(id_ubicacion_equipo_fk) REFERENCES ubicacion_equipo(id_ubicacion_equipo);

CREATE TABLE accesorio(
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_accesorio VARCHAR(50) NOT NULL,
    descripcion_accesorio VARCHAR(100) NULL,
    numero_serie_accesorio VARCHAR(50) NULL,
    id_equipo_serie_fk VARCHAR(50),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL

);

ALTER TABLE accesorio ADD CONSTRAINT fk_id_equipo_serie FOREIGN KEY(id_equipo_serie_fk) REFERENCES equipo(id_equipo_serie);

CREATE TABLE estado_equipo(
    id_estado_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado_equipo VARCHAR(50) NOT NULL,
    descripcion_estado_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE equipos_x_estados_equipo(
    id_equipos_x_estados_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_serie_fk VARCHAR(50),
    id_estado_equipo_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE equipos_x_estados_equipo ADD CONSTRAINT fk_id_equipo_serie_n FOREIGN KEY(id_equipo_serie_fk) REFERENCES equipo(id_equipo_serie);
ALTER TABLE equipos_x_estados_equipo ADD CONSTRAINT fk_id_estado_equipo_n FOREIGN KEY(id_estado_equipo_fk) REFERENCES estado_equipo(id_estado_equipo);

CREATE TABLE mantenimiento_programado(
    id_mantenimiento_programado INT AUTO_INCREMENT PRIMARY KEY,
    descripcion_mantenimiento_programado VARCHAR(50) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    id_tecnico_fk INT,
    id_encargado_mantenimiento_fk INT,
    id_equipo_serie_fk VARCHAR(50),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE mantenimiento_programado ADD CONSTRAINT fk_id_tecnico FOREIGN KEY(id_tecnico_fk) REFERENCES usuario(id_usuario);
ALTER TABLE mantenimiento_programado ADD CONSTRAINT fk_id_encargado_mantenimiento FOREIGN KEY(id_encargado_mantenimiento_fk) REFERENCES usuario(id_usuario);
ALTER TABLE mantenimiento_programado ADD CONSTRAINT fk_id_equipo_serie_mantenimiento FOREIGN KEY(id_equipo_serie_fk) REFERENCES equipo(id_equipo_serie);

CREATE TABLE expediente_equipo(
    id_expediente_equipo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion_equipo VARCHAR(50) NOT NULL,
    id_equipo_serie_fk VARCHAR(50),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE expediente_equipo ADD CONSTRAINT fk_id_equipo_serie_expediente FOREIGN KEY(id_equipo_serie_fk) REFERENCES equipo(id_equipo_serie);

CREATE TABLE estado_mantenimiento(
    id_estado_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado_mantenimiento VARCHAR(50) NOT NULL,
    descripcion_estado_mantenimiento VARCHAR(100),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE tipo_mantenimiento(
    id_tipo_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo_mantenimiento VARCHAR(50) NOT NULL,
    descripcion_tipo_mantenimiento VARCHAR(100),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE ficha_expediente(
    id_ficha_expediente INT AUTO_INCREMENT PRIMARY KEY,
    procedimiento VARCHAR(100) NOT NULL,
    observacion VARCHAR(200) NOT NULL,
    documento_anexado VARCHAR(100) NULL,
    id_expediente_equipo_fk INT,
    id_tecnico_fk INT,
    id_estado_mantenimiento_fk INT,
    id_tipo_mantenimiento_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

ALTER TABLE ficha_expediente ADD CONSTRAINT fk_id_expediente_equipo FOREIGN KEY(id_expediente_equipo_fk) REFERENCES expediente_equipo(id_expediente_equipo);
ALTER TABLE ficha_expediente ADD CONSTRAINT fk_id_tecnico_expediente FOREIGN KEY(id_tecnico_fk) REFERENCES usuario(id_usuario);
ALTER TABLE ficha_expediente ADD CONSTRAINT fk_id_estado_mantenimiento FOREIGN KEY(id_estado_mantenimiento_fk) REFERENCES estado_mantenimiento(id_estado_mantenimiento);
ALTER TABLE ficha_expediente ADD CONSTRAINT fk_id_tipo_mantenimiento FOREIGN KEY(id_tipo_mantenimiento_fk) REFERENCES tipo_mantenimiento(id_tipo_mantenimiento);
