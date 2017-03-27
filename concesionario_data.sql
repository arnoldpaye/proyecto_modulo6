-- concesionario_data.sql
USE concesionario;

-- Concesionario
INSERT INTO concesionario (nombre, direccion) VALUE("Concesionario nissan", "CALLE AGUSTIN LARA NO. 69-B");
INSERT INTO concesionario (nombre, direccion) VALUE("Concesionario hyundai", "CARRETERA A LOMA ALTA S/N.");
INSERT INTO concesionario (nombre, direccion) VALUE("Concesionario toyota", "AV. 20 DE NOVIEMBRE ESQ. JUAREZ");

-- Consultor
INSERT INTO consultor (concesionario_id, nombre, apellido, usuario, password) VALUES(1, "Arnold", "Paye", "apaye", "123");
INSERT INTO consultor (concesionario_id, nombre, apellido, usuario, password) VALUES(1, "Mauricio", "Rojas", "mrojas", "123");
INSERT INTO consultor (concesionario_id, nombre, apellido, usuario, password) VALUES(2, "Juan", "Perez", "jperez", "123");
