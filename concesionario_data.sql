-- concesionario_data.sql
USE concesionario;

INSERT INTO concesionario (nombre) VALUE('Concesionario nissan'); 
INSERT INTO concesionario (nombre) VALUE('Concesionario hyundai'); 
INSERT INTO concesionario (nombre) VALUE('Concesionario toyota'); 

INSERT INTO consultor (concesionario_id, usuario, password) VALUES(1, "apaye", "123");
