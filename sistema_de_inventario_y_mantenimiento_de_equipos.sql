CREATE DATABASE sistema_de_inventario_y_mantenimiento_de_equipos;

USE sistema_de_inventario_y_mantenimiento_de_equipos;


CREATE TABLE usuario{
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    apellido_usuario VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE rol{
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion_rol VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE usuarios_x_roles{
    id_usuarios_x_roles INT AUTO_INCREMENT PRIMARY KEY
    id_usuario_fk INT,
    id_rol_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

ALTER TABLE usuarios_x_roles ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario_fk) REFERENCES usuario(id_usuario);
ALTER TABLE usuarios_x_roles ADD CONSTRAINT fk_id_rol FOREIGN KEY (id_rol_fk) REFERENCES rol(id_rol);

CREATE TABLE permiso{
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(50) NOT NULL,
    descripcion_permiso VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE roles_x_permisos{
    id_roles_x_permisos INT AUTO_INCREMENT PRIMARY KEY,
    id_rol_fk INT,
    id_permiso_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

ALTER TABLE roles_x_permisos ADD CONSTRAINT fk_id_rol FOREIGN KEY(id_rol_fk) REFERENCES rol(id_rol);
ALTER TABLE roles_x_permisos ADD CONSTRAINT fk_id_permiso FOREIGN KEY(id_permiso_fk) REFERENCES permiso(id_permiso);

CREATE TABLE marca{
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL,
    descripcion_marca VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE modelo{
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(50) NOT NULL,
    descripcion_modelo VARCHAR(100) NULL,
    id_marca_fk INT
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

ALTER TABLE modelo ADD CONSTRAINT fk_id_marca FOREIGN(id_marca_fk) REFERENCES marca(id_marca);

CREATE TABLE tipo_equipo{
    id_tipo_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo_equipo VARCHAR(50) NOT NULL,
    descripcion_tipo_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE posicion_equipo{
    id_posicion_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_posicion_equipo VARCHAR(50) NOT NULL,
    descripcion_posicion_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE ubicacion_equipo{
    id_ubicacion_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ubicacion_equipo VARCHAR(50) NOT NULL,
    descripcion_ubicacion_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE equipo{
    id_equipo_serie VARCHAR(50) PRIMARY KEY,
    activo_fijo_equipo VARCHAR(50) NULL,
    color_equipo VARCHAR(50) NULL,
    descripcion_equipo VARCHAR(100) NULL,
    id_marca_fk int,
    id_tipo_equipo_fk INT,
    id_posicion_equipo_fk INT,
    id_ubicacion_equipo_fk INT
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

ALTER TABLE equipo ADD CONSTRAINT fk_id_marca FOREIGN KEY(id_marca_fk) REFERENCES marca(id_marca);
ALTER TABLE equipo ADD CONSTRAINT fk_id_tipo_equipo FOREIGN KEY(id_tipo_equipo_fk) REFERENCES tipo_equipo(id_tipo_equipo);
ALTER TABLE equipo ADD CONSTRAINT fk_id_posicion_equipo FOREIGN KEY(id_posicion_equipo_fk) REFERENCES posicion_equipo(id_posicion_equipo);
ALTER TABLE equipo ADD CONSTRAINT fk_id_ubicacion_equipo FOREIGN KEY(id_ubicacion_equipo_fk) REFERENCES ubicacion_equipo(id_ubicacion_equipo);

CREATE TABLE accesorio{
    id_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_accesorio VARCHAR(50) NOT NULL,
    descripcion_accesorio VARCHAR(100) NULL,
    numero_serie_accesorio VARCHAR(50) NULL,
    id_equipo_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL

};

ALTER TABLE accesorio ADD CONSTRAINT fk_id_equipo FOREIGN KEY(id_equipo_fk) REFERENCES equipo(id_equipo),

CREATE TABLE estado_equipo{
    id_estado_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado_equipo VARCHAR(50) NOT NULL,
    descripcion_estado_equipo VARCHAR(100) NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

CREATE TABLE equipos_x_estados_equipo{
    id_equipos_x_estados_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_fk INT,
    id_estado_equipo_fk INT,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
};

ALTER TABLE equipos_x_estados_equipo ADD CONSTRAINT fk_id_equipo FOREIGN KEY(id_equipo_fk) REFERENCES equipo(id_equipo);
ALTER TABLE equipos_x_estados_equipo ADD CONSTRAINT fk_id_estado_equipo FOREIGN KEY(id_estado_equipo_fk) REFERENCES estado_equipo(id_estado_equipo);
