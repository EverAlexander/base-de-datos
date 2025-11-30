create database recursosnivel6zg;
use recursosnivel6zg;

select * from marcas;
CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

ALTER TABLE `marcas`
ADD `created_at` TIMESTAMP NULL DEFAULT NULL,
ADD `updated_at` TIMESTAMP NULL DEFAULT NULL;


INSERT INTO marcas (nombre) VALUES('Sony'),('Microsoft'),('Nintendo'),('JBL'),('Motorola');

CREATE TABLE modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100),
    modelo VARCHAR(50) NOT NULL,
    marca INT NOT NULL,
    FOREIGN KEY (marca) REFERENCES marcas(id_marca)
);


ALTER TABLE `modelos`
ADD `created_at` TIMESTAMP NULL DEFAULT NULL,
ADD `updated_at` TIMESTAMP NULL DEFAULT NULL;

INSERT INTO modelos (nombre,modelo,marca) VALUES('Playstation 5','CFI-1200A',1),('Playstation 5','CFI-1115A',1),
	('Playstation 5','CFI-1215A',1),('Playstation 5','AW-XM501',1),
	('Playstation 5','J20H100',1),('Playstation 5','AW-XM546', 1),
    ('DualSense','CF1-ZCT1W',1),('DualSense','CF1-ZCT1J',1);

CREATE TABLE estado_inventario (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL 
);

INSERT INTO estado_inventario(nombre) VALUES('En uso'),('Dañada'),('Completa'),('Incompleta'),('Pendiente Mantenimiento');

CREATE TABLE ubicaciones (
  id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL, 
  descripcion VARCHAR(200)
);

INSERT INTO ubicaciones (nombre, descripcion) VALUES ('Nivel 6' ,'Area de 15 años o mas'), ('Nivel 3' ,'Area de 8 a 14 años'),('Bodega N6' ,'Area de bodega nivel 6');

CREATE TABLE consolas (
  id_consola INT AUTO_INCREMENT PRIMARY KEY,
  id_modelo INT NOT NULL,
  color VARCHAR(25) not null,
  numero_serie VARCHAR(100) NOT NULL,
  activofijo VARCHAR(100) NOT NULL,
  hdmi VARCHAR(3),
  powers VARCHAR(3),
  observacion VARCHAR(100),
  id_estado INT NOT NULL,
  id_ubicacion INT NOT NULL,
  FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo),
  FOREIGN KEY (id_estado) REFERENCES estado_inventario(id_estado),
  FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

INSERT INTO consolas(id_modelo,color,numero_serie,activofijo,hdmi,powers,observacion,id_estado,id_ubicacion) 
	VALUES(1,'Blanco', 'G32B01VNA11138581', '84-5421-0021', 'Si','Si','Accesorio completos con su base de PS5',3,3);


CREATE TABLE controles (
    id_control INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100),
    modelo INT NOT NULL,
    color VARCHAR(25) NOT NULL,
    numero_serie VARCHAR(100) NOT NULL,
    complementos VARCHAR(100),
    observacion VARCHAR(100),
    id_estado INT NOT NULL,
    id_ubicacion INT NOT NULL,
	FOREIGN KEY (modelo) REFERENCES modelos(id_modelo),
    FOREIGN KEY (id_estado) REFERENCES estado_inventario(id_estado),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

INSERT INTO controles (descripcion,modelo,color,numero_serie,complementos,observacion,id_estado,id_ubicacion)
	VALUES('Control de PS5',7,'Blanco','F22400VYP28549607','Cable de carga','Dañado por drift',2,3);


CREATE TABLE detalle_consola(
	id_detalleconsola INT AUTO_INCREMENT PRIMARY KEY,
	consola INT NOT NULL, -- Consola asignada
    control INT NOT NULL, -- Control Asignado 
    posicion INT,  -- Posicion ej: 1
    observacion VARCHAR(100),
    FOREIGN KEY (control) REFERENCES controles(id_control),
	FOREIGN KEY (consola) REFERENCES consolas(id_consola)
);

INSERT INTO detalle_consola (consola,control,posicion,observacion) VALUES(1,1,4,'Zona gamer');


SELECT 
    dc.id_detalleconsola,
    dc.consola,
    c.numero_serie AS numero_consola,
    uc.nombre AS ubicacion_consola,
    dc.control,
    co.numero_serie AS numero_control,
    uco.nombre AS ubicacion_control,
    dc.posicion,
    dc.observacion
FROM detalle_consola dc
JOIN consolas c ON dc.consola = c.id_consola
JOIN ubicaciones uc ON c.id_ubicacion = uc.id_ubicacion
JOIN controles co ON dc.control = co.id_control
JOIN ubicaciones uco ON co.id_ubicacion = uco.id_ubicacion;

