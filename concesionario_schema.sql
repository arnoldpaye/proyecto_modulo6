-- concesionario_squema.sql
DROP DATABASE IF EXISTS concesionario;
CREATE DATABASE concesionario;
USE concesionario;

CREATE TABLE IF NOT EXISTS concesionario (
    concesionario_id    INT NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(100),
    direccion           VARCHAR(200),
    PRIMARY KEY (concesionario_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS consultor (
    consultor_id        INT NOT NULL AUTO_INCREMENT,
    concesionario_id    INT NOT NULL,
    nombre              VARCHAR(30),
    apellido            VARCHAR(30),
    usuario             VARCHAR(30) NOT NULL,
    password            VARCHAR(100) NOT NULL,
    PRIMARY KEY (consultor_id),
    FOREIGN KEY (concesionario_id) REFERENCES concesionario(concesionario_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS cliente (
    cliente_id          INT NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(30),
    apellido            VARCHAR(30),
    direccion           VARCHAR(200),
    telefono            VARCHAR(30),
    correo              VARCHAR(100),
    PRIMARY KEY (cliente_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS vehiculo (
    vehiculo_id         INT NOT NULL AUTO_INCREMENT,
    cliente_id          INT NOT NULL,
    modelo              VARCHAR(30),
    marca               VARCHAR(30),
    anio                INT,
    kilometraje         INT,
    color               VARCHAR(30),
    PRIMARY KEY (vehiculo_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS servicio (
    servicio_id         INT NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(200),
    duracion            INT DEFAULT 0,
    precio              NUMERIC(10,2),
    PRIMARY KEY (servicio_id)
) ENGINE=INNODB; 

CREATE TABLE IF NOT EXISTS inspeccion (
    inspeccion_id       INT NOT NULL AUTO_INCREMENT,
    consultor_id        INT NOT NULL,
    vehiculo_id         INT NOT NULL,
    fecha               DATE,
    pagado              BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (inspeccion_id),
    FOREIGN KEY (consultor_id) REFERENCES consultor(consultor_id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo (vehiculo_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS inspeccion_servicio (
    inspeccion_servicio_id  INT NOT NULL AUTO_INCREMENT,
    inspeccio_id            INT NOT NULL,
    servicio_id             INT NOT NULL,
    PRIMARY KEY (inspeccion_servicio_id),
    FOREIGN KEY (inspeccion_id) REFERENCES reserva(reserva_id),
    FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id)

) ENGINE=INNODB;

