CREATE TABLE discount (
 discount_rate FLOAT(10)
);


CREATE TABLE instrument (
 instrument_ID INT NOT NULL UNIQUE,
 price FLOAT(50),
 name VARCHAR(50) NOT NULL,
 brand VARCHAR(50)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_ID);


CREATE TABLE lesson_type (
 lesson_type_ID INT NOT NULL,
 value VARCHAR(15)
);

ALTER TABLE lesson_type ADD CONSTRAINT PK_lesson_type PRIMARY KEY (lesson_type_ID);


CREATE TABLE person (
 person_number INT NOT NULL UNIQUE,
 name VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_number);


CREATE TABLE phone (
 person_number INT NOT NULL UNIQUE,
 phone VARCHAR(20)
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (person_number);


CREATE TABLE proficiency (
 proficiency_ID INT NOT NULL,
 value VARCHAR(15)
);

ALTER TABLE proficiency ADD CONSTRAINT PK_proficiency PRIMARY KEY (proficiency_ID);


CREATE TABLE adress (
 person_number INT NOT NULL UNIQUE,
 street VARCHAR(50),
 city VARCHAR(50),
 zip VARCHAR(10)
);

ALTER TABLE adress ADD CONSTRAINT PK_adress PRIMARY KEY (person_number);


CREATE TABLE email (
 person_number INT NOT NULL UNIQUE,
 email VARCHAR(50)
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (person_number);


CREATE TABLE instructor (
 instructor_ID INT NOT NULL UNIQUE,
 person_number INT NOT NULL UNIQUE,
 can_host_ensembles BIT(1)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_ID);

CREATE TABLE instructor_schedule (
 instructor_ID INT NOT NULL UNIQUE,
 date DATE
);

ALTER TABLE instructor_schedule ADD CONSTRAINT PK_instructor_schedule PRIMARY KEY (instructor_ID);


CREATE TABLE lesson (
 lesson_ID INT NOT NULL UNIQUE,
 instructor_ID INT NOT NULL UNIQUE,
 lesson_type_ID INT,
 proficiency_ID INT,
 time TIMESTAMP(6),
 place VARCHAR(50),
 instructor_payment FLOAT(50)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_ID);


CREATE TABLE lesson_prices (
 lesson_type_ID INT NOT NULL,
 proficiency_ID INT NOT NULL,
 price FLOAT(50),
 date TIMESTAMP(6)
);

ALTER TABLE lesson_prices ADD CONSTRAINT PK_lesson_prices PRIMARY KEY (lesson_type_ID,proficiency_ID);


CREATE TABLE attendants (
 lesson_ID INT NOT NULL UNIQUE,
 student_ID INT UNIQUE
);

ALTER TABLE attendants ADD CONSTRAINT PK_attendants PRIMARY KEY (lesson_ID);


CREATE TABLE ensemble (
 lesson_ID INT NOT NULL UNIQUE,
 genre VARCHAR(15),
 spots VARCHAR(15),
 minimum_spots CHAR(10)
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_ID);


CREATE TABLE group_lesson (
 lesson_ID INT NOT NULL UNIQUE,
 instrument VARCHAR(50),
 spots VARCHAR(15),
 minimum_spots CHAR(10)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_ID);


CREATE TABLE individual_lesson (
 lesson_ID INT NOT NULL UNIQUE,
 instrument VARCHAR(50)
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_ID);


CREATE TABLE student (
 student_ID INT NOT NULL UNIQUE,
 person_number INT NOT NULL UNIQUE,
 sibling_ID INT UNIQUE
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_ID);


CREATE TABLE application (
 student_ID INT NOT NULL UNIQUE,
 lesson_ID INT NOT NULL UNIQUE,
 requestID VARCHAR(50),
 accepted BIT(1)
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_ID);


CREATE TABLE rentals (
 student_ID INT UNIQUE,
 instrument_ID INT UNIQUE,
 startDate TIMESTAMP(6),
 endDate TIMESTAMP(6)
);



ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (person_number) REFERENCES person (person_number);


ALTER TABLE adress ADD CONSTRAINT FK_adress_0 FOREIGN KEY (person_number) REFERENCES person (person_number);


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (person_number) REFERENCES person (person_number);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_number) REFERENCES person (person_number);

ALTER TABLE instructor_schedule ADD CONSTRAINT FK_instructor_schedule_0 FOREIGN KEY (instructor_ID) REFERENCES instructor (instructor_ID);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_ID) REFERENCES instructor (instructor_ID);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (lesson_type_ID) REFERENCES lesson_type (lesson_type_ID);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (proficiency_ID) REFERENCES proficiency (proficiency_ID);


ALTER TABLE lesson_prices ADD CONSTRAINT FK_lesson_prices_0 FOREIGN KEY (lesson_type_ID) REFERENCES lesson_type (lesson_type_ID);
ALTER TABLE lesson_prices ADD CONSTRAINT FK_lesson_prices_1 FOREIGN KEY (proficiency_ID) REFERENCES proficiency (proficiency_ID);


ALTER TABLE attendants ADD CONSTRAINT FK_attendants_0 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_number) REFERENCES person (person_number);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (sibling_ID) REFERENCES student (student_ID);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_ID) REFERENCES student (student_ID);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (lesson_ID) REFERENCES lesson (lesson_ID);

ALTER TABLE rentals ADD CONSTRAINT FK_rentals_0 FOREIGN KEY (student_ID) REFERENCES student (student_ID);
ALTER TABLE rentals ADD CONSTRAINT FK_rentals_1 FOREIGN KEY (instrument_ID) REFERENCES instrument (instrument_ID);

ALTER TABLE lesson DROP CONSTRAINT lesson_instructor_id_key;
