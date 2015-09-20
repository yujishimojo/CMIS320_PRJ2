
/* Drop Triggers */

DROP TRIGGER TRI_academy_awards_id;
DROP TRIGGER TRI_academy_awards_movies_id;
DROP TRIGGER TRI_actors_id;
DROP TRIGGER TRI_actors_movies_id;
DROP TRIGGER TRI_charges_id;
DROP TRIGGER TRI_charges_rentals_id;
DROP TRIGGER TRI_customers_id;
DROP TRIGGER TRI_directors_id;
DROP TRIGGER TRI_directors_movies_id;
DROP TRIGGER TRI_distributors_id;
DROP TRIGGER TRI_inventories_id;
DROP TRIGGER TRI_movies_id;
DROP TRIGGER TRI_rentals_id;



/* Drop Tables */

DROP TABLE academy_awards_movies CASCADE CONSTRAINTS;
DROP TABLE academy_awards CASCADE CONSTRAINTS;
DROP TABLE actors_movies CASCADE CONSTRAINTS;
DROP TABLE actors CASCADE CONSTRAINTS;
DROP TABLE charges_rentals CASCADE CONSTRAINTS;
DROP TABLE charges CASCADE CONSTRAINTS;
DROP TABLE rentals CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE directors_movies CASCADE CONSTRAINTS;
DROP TABLE directors CASCADE CONSTRAINTS;
DROP TABLE inventories CASCADE CONSTRAINTS;
DROP TABLE movies CASCADE CONSTRAINTS;
DROP TABLE distributors CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_academy_awards_id;
DROP SEQUENCE SEQ_academy_awards_movies_id;
DROP SEQUENCE SEQ_actors_id;
DROP SEQUENCE SEQ_actors_movies_id;
DROP SEQUENCE SEQ_charges_id;
DROP SEQUENCE SEQ_charges_rentals_id;
DROP SEQUENCE SEQ_customers_id;
DROP SEQUENCE SEQ_directors_id;
DROP SEQUENCE SEQ_directors_movies_id;
DROP SEQUENCE SEQ_distributors_id;
DROP SEQUENCE SEQ_inventories_id;
DROP SEQUENCE SEQ_movies_id;
DROP SEQUENCE SEQ_rentals_id;




/* Create Sequences */

CREATE SEQUENCE SEQ_academy_awards_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_academy_awards_movies_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_actors_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_actors_movies_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_charges_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_charges_rentals_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_customers_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_directors_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_directors_movies_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_distributors_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_inventories_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_movies_id INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_rentals_id INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE academy_awards
(
	id number(5,0) NOT NULL,
	category varchar2(25) NOT NULL,
	year_awarded number(5,0) NOT NULL,
	is_winner varchar2(1) NOT NULL,
	is_nominee varchar2(1) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE academy_awards_movies
(
	id number(10,0) NOT NULL,
	academy_award_id number(5,0) NOT NULL,
	movie_id number(5,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE actors
(
	id number(5,0) NOT NULL,
	first_name varchar2(15) NOT NULL,
	middle_name varchar2(15),
	last_name varchar2(15) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE actors_movies
(
	id number(10,0) NOT NULL,
	actor_id number(5,0) NOT NULL,
	movie_id number(5,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE charges
(
	id number(3,0) NOT NULL,
	-- standard_charge
	-- late_fee
	-- damaged_fee
	-- failure_to_rewind_fee
	-- other
	charge_type varchar2(30) NOT NULL,
	charge number(19,4) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE charges_rentals
(
	id number(10,0) NOT NULL,
	rental_id number(10,0) NOT NULL,
	charge_id number(3,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE customers
(
	id number(5,0) NOT NULL,
	first_name varchar2(15) NOT NULL,
	middle_name varchar2(15),
	last_name varchar2(15) NOT NULL,
	street_address varchar2(30) NOT NULL,
	city varchar2(15) NOT NULL,
	state varchar2(5) NOT NULL,
	zip_code number(10,0) NOT NULL,
	phone_number varchar2(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE directors
(
	id number(5,0) NOT NULL,
	first_name varchar2(15) NOT NULL,
	middle_name varchar2(15),
	last_name varchar2(15) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE directors_movies
(
	id number(10,0) NOT NULL,
	director_id number(5,0) NOT NULL,
	movie_id number(5,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE distributors
(
	id number(3,0) NOT NULL,
	name varchar2(40) NOT NULL,
	shipment_quantity number(5,0),
	PRIMARY KEY (id)
);


CREATE TABLE inventories
(
	id number(10,0) NOT NULL,
	movie_id number(5,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE movies
(
	id number(5,0) NOT NULL,
	distributor_id number(3,0) NOT NULL,
	title varchar2(50) NOT NULL,
	-- suspense
	-- horror
	-- mystery
	-- comedy
	-- other
	movie_type varchar2(15) NOT NULL,
	running_length number(5,0) NOT NULL,
	rating number(3,0),
	year_released number(5,0) NOT NULL,
	is_video varchar2(1) NOT NULL,
	is_dvd varchar2(1) NOT NULL,
	wholesale_price number(19,4) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE rentals
(
	id number(10,0) NOT NULL,
	customer_id number(5,0) NOT NULL,
	inventory_id number(10,0) NOT NULL,
	rental_date date NOT NULL,
	return_due_date date NOT NULL,
	is_rented varchar2(1) NOT NULL,
	is_returned varchar2(1) NOT NULL,
	total_charge number(19,4) NOT NULL,
	tax number(19,4) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE academy_awards_movies
	ADD FOREIGN KEY (academy_award_id)
	REFERENCES academy_awards (id)
;


ALTER TABLE actors_movies
	ADD FOREIGN KEY (actor_id)
	REFERENCES actors (id)
;


ALTER TABLE charges_rentals
	ADD FOREIGN KEY (charge_id)
	REFERENCES charges (id)
;


ALTER TABLE rentals
	ADD FOREIGN KEY (customer_id)
	REFERENCES customers (id)
;


ALTER TABLE directors_movies
	ADD FOREIGN KEY (director_id)
	REFERENCES directors (id)
;


ALTER TABLE movies
	ADD FOREIGN KEY (distributor_id)
	REFERENCES distributors (id)
;


ALTER TABLE rentals
	ADD FOREIGN KEY (inventory_id)
	REFERENCES inventories (id)
;


ALTER TABLE directors_movies
	ADD FOREIGN KEY (movie_id)
	REFERENCES movies (id)
;


ALTER TABLE actors_movies
	ADD FOREIGN KEY (movie_id)
	REFERENCES movies (id)
;


ALTER TABLE academy_awards_movies
	ADD FOREIGN KEY (movie_id)
	REFERENCES movies (id)
;


ALTER TABLE inventories
	ADD FOREIGN KEY (movie_id)
	REFERENCES movies (id)
;


ALTER TABLE charges_rentals
	ADD FOREIGN KEY (rental_id)
	REFERENCES rentals (id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_academy_awards_id BEFORE INSERT ON academy_awards
FOR EACH ROW
BEGIN
	SELECT SEQ_academy_awards_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_academy_awards_movies_id BEFORE INSERT ON academy_awards_movies
FOR EACH ROW
BEGIN
	SELECT SEQ_academy_awards_movies_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_actors_id BEFORE INSERT ON actors
FOR EACH ROW
BEGIN
	SELECT SEQ_actors_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_actors_movies_id BEFORE INSERT ON actors_movies
FOR EACH ROW
BEGIN
	SELECT SEQ_actors_movies_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_charges_id BEFORE INSERT ON charges
FOR EACH ROW
BEGIN
	SELECT SEQ_charges_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_charges_rentals_id BEFORE INSERT ON charges_rentals
FOR EACH ROW
BEGIN
	SELECT SEQ_charges_rentals_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_customers_id BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
	SELECT SEQ_customers_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_directors_id BEFORE INSERT ON directors
FOR EACH ROW
BEGIN
	SELECT SEQ_directors_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_directors_movies_id BEFORE INSERT ON directors_movies
FOR EACH ROW
BEGIN
	SELECT SEQ_directors_movies_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_distributors_id BEFORE INSERT ON distributors
FOR EACH ROW
BEGIN
	SELECT SEQ_distributors_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_inventories_id BEFORE INSERT ON inventories
FOR EACH ROW
BEGIN
	SELECT SEQ_inventories_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_movies_id BEFORE INSERT ON movies
FOR EACH ROW
BEGIN
	SELECT SEQ_movies_id.nextval
	INTO :new.id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_rentals_id BEFORE INSERT ON rentals
FOR EACH ROW
BEGIN
	SELECT SEQ_rentals_id.nextval
	INTO :new.id
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN charges.charge_type IS 'standard_charge
late_fee
damaged_fee
failure_to_rewind_fee
other';
COMMENT ON COLUMN movies.movie_type IS 'suspense
horror
mystery
comedy
other';



