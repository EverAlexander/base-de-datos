create database recursosnivel6zg;
use recursosnivel6zg;

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100),
    modelo VARCHAR(50) NOT NULL,
    marca INT NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL,
    FOREIGN KEY (marca) REFERENCES marcas(id_marca)
);

CREATE TABLE estado_inventario (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL 
);

INSERT INTO estado_inventario(nombre) VALUES('Bueno'),('Dañado'),('Completa'),('Incompleta'),('Pendiente Mantenimiento');

select *from estado_inventario;

CREATE TABLE ubicaciones (
  id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL, 
  descripcion VARCHAR(200)
);

INSERT INTO ubicaciones (nombre, descripcion) VALUES ('Nivel 6' ,'Area de 15 años o mas'), ('Nivel 3' ,'Area de 8 a 14 años'),('Bodega N6' ,'Area de bodega nivel 6');

CREATE TABLE complemento_consola(
	idComplemento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    complemento VARCHAR(200)
);

INSERT INTO complemento_consola (complemento) VALUES
('Cable HDMI'),
('Cable de poder'),
('Control'),
('Base / Dock Nintendo Switch'),
('Joy-Con');

CREATE TABLE consolas (
	numero_serie VARCHAR(100) NOT NULL PRIMARY KEY,
	activofijo VARCHAR(100),
	id_modelo INT NOT NULL,
	color VARCHAR(25) not null,
	observacion VARCHAR(250),
	id_estado INT NOT NULL,
	id_ubicacion INT NOT NULL,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo),
	FOREIGN KEY (id_estado) REFERENCES estado_inventario(id_estado),
	FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

CREATE TABLE controles_Consola (
    numero_serie VARCHAR(100) NOT NULL PRIMARY KEY,
    descripcion VARCHAR(250),
    modelo INT NOT NULL,
    color VARCHAR(25) NOT NULL,
    id_estado INT NOT NULL,
    id_ubicacion INT NOT NULL,
    observacion VARCHAR(300),
    fechaActualizacion date not null,
    created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL,
	FOREIGN KEY (modelo) REFERENCES modelos(id_modelo),
    FOREIGN KEY (id_estado) REFERENCES estado_inventario(id_estado),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

CREATE TABLE consola_complementos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	numero_serie VARCHAR(100) NOT NULL,
	idComplemento INT NOT NULL,
	tiene TINYINT(1) DEFAULT 0,
	created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	FOREIGN KEY (numero_serie) REFERENCES consolas(numero_serie),
	FOREIGN KEY (idComplemento) REFERENCES complemento_consola(idComplemento)
);

/*Todo limpio  tabla consola_complementos pendiente para su asignacion pero todo esta organizado seria de revisar*/


