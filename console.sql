CREATE DATABASE airport;

CREATE TABLE if not exists pilot
(
    id SERIAL PRIMARY KEY,
    pilot_name_surname VARCHAR(255) NOT NULL,
    pilot_age SMALLINT NOT NULL CHECK ( pilot_age > 23 )
);

INSERT INTO pilot (pilot_name_surname, pilot_age) VALUES
('John Colby', 38),
('Rabbit Franks', 26),
('Randy Faction', 33),
('Tim Kendal', 32);

CREATE TABLE if not exists model
(
    id SERIAL,
    plane_model TEXT UNIQUE,
    PRIMARY KEY (id)
);

INSERT INTO model (plane_model) VALUES
('Bowing 747'),
('Tu-134'),
('Kukuruza');

CREATE TABLE if not exists plane
(
    id SERIAL PRIMARY KEY,
    plane_model TEXT NOT NULL,
    plane_serial_number TEXT NOT NULL UNIQUE,
    plane_number_sid INT NOT NULL,
    FOREIGN KEY (plane_model) REFERENCES model (plane_model)
);

INSERT INTO plane (plane_model, plane_serial_number, plane_number_sid) VALUES
('Bowing 747', '40-23', 350),
('Tu-134', '3234-g', 120),
('Kukuruza', '113', 25);

CREATE TABLE if not exists pilot_can
(
    id SERIAL PRIMARY KEY,
    pilot_num INT,
    plane_serial INT NOT NULL,
    CONSTRAINT this_pilot_can
        FOREIGN KEY (pilot_num)
            REFERENCES pilot (id),
    CONSTRAINT pilot_airplane_model
        FOREIGN KEY (plane_serial)
            REFERENCES model (id)
);

INSERT INTO pilot_can (pilot_num, plane_serial) VALUES
(1,1),
(1,2),
(2,3),
(3,1),
(3,2),
(3,3),
(4,2);