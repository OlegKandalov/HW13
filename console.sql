CREATE DATABASE airport;

CREATE TABLE if not exists pilot
(
    id SERIAL PRIMARY KEY,
    number_pilot SMALLINT NOT NULL,
    pilot_name_surname VARCHAR(255) UNIQUE NOT NULL,
    pilot_age SMALLINT NOT NULL CHECK ( pilot_age > 23 )
);

INSERT INTO pilot (number_pilot, pilot_name_surname, pilot_age) VALUES
(1, 'John Colby', 38),
(2, 'Rabbit Franks', 26),
(3, 'Randy Faction', 33),
(4, 'Tim Kendal', 32);

CREATE TABLE if not exists plane
(
    id SERIAL PRIMARY KEY UNIQUE,
    plane_id INT NOT NULL UNIQUE,
    plane_model VARCHAR(255) NOT NULL,
    plane_serial_number TEXT NOT NULL UNIQUE,
    plane_number_sid INT NOT NULL
);

INSERT INTO plane (plane_id, plane_model, plane_serial_number, plane_number_sid) VALUES
(1, 'Bowing 747', '40-23', 350),
(2, 'Tu-134', '3234-g', 120),
(3, 'Kukuruza', '113', 25);

CREATE TABLE if not exists pilot_can
(
    id SERIAL PRIMARY KEY,
    pilot_num INT UNIQUE ,
    plane_serial INT NOT NULL,
    CONSTRAINT this_pilot_can
        FOREIGN KEY (pilot_num)
            REFERENCES pilot (id),
    CONSTRAINT pilot_airplane_model
        FOREIGN KEY (plane_serial)
            REFERENCES plane (plane_id)
);

INSERT INTO pilot_can (pilot_num, plane_serial) VALUES
(1,1),
(2,3),
(3,1),
(4,2);