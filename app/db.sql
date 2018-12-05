DROP DATABASE IF EXISTS edtickets;

CREATE DATABASE
IF NOT EXISTS edtickets;

USE edtickets;

CREATE TABLE actividades(
  actividad_id CHAR(2) PRIMARY KEY,
  bloque ENUM('Bloque 1', 'Bloque 2', 'Bloque 3') NOT NULL,
  disciplina ENUM
('KICK BOXING', 'YOGA', 'PILATES', 'ZUMBA') NOT NULL,
  horario VARCHAR
(30) NOT NULL,
  cupo INTEGER NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO actividades
    (actividad_id, bloque, disciplina, horario, cupo)
VALUES
    ('1K', 'Bloque 1', 'KICK BOXING', '9:00 a 12:00', 10),
    ('1Y', 'Bloque 1', 'YOGA', '9:00 a 12:00', 20),
    ('1P', 'Bloque 1', 'PILATES', '9:00 a 12:00', 10),
    ('1Z', 'Bloque 1', 'ZUMBA', '9:00 a 12:00', 10),
    ('2K', 'Bloque 2', 'KICK BOXING', '14:00 a 17:00', 10),
    ('2Y', 'Bloque 2', 'YOGA', '14:00 a 17:00', 20),
    ('2P', 'Bloque 2', 'PILATES', '14:00 a 17:00', 10),
    ('2Z', 'Bloque 2', 'ZUMBA', '14:00 a 17:00', 10),
    ('3K', 'Bloque 3', 'KICK BOXING', '18:00 a 21:00', 10),
    ('3Y', 'Bloque 3', 'YOGA', '18:00 a 21:00', 20),
    ('3P', 'Bloque 3', 'PILATES', '18:00 a 21:00', 10),
    ('3Z', 'Bloque 3', 'ZUMBA', '18:00 a 21:00', 10);


CREATE TABLE participantes
(
    email VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50)
        NOT NULL,
    nacimiento DATE NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE registros
(
    registro_id INTEGER
    UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        email VARCHAR
    (50) UNIQUE NOT NULL,
        actividad CHAR
    (2) NOT NULL,
        fecha DATE NOT NULL,
        FOREIGN KEY
    (email) REFERENCES participantes
    (email) ON
    DELETE CASCADE ON
    UPDATE CASCADE,
        FOREIGN KEY (actividad) REFERENCES actividades(actividad_id)
    ON
    DELETE CASCADE ON
    UPDATE CASCADE
    )ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4;