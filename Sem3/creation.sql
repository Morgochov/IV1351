CREATE TABLE discount (
 discount_rate FLOAT(10)
);


CREATE TABLE instrument (
 instrument_ID  INT NOT NULL,
 price FLOAT(50),
 name VARCHAR(50) NOT NULL,
 brand VARCHAR(50)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_ID );


CREATE TABLE person (
 person_number  INT NOT NULL,
 name VARCHAR(50)
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (person_number );


CREATE TABLE phone (
 person_number  INT NOT NULL,
 phone VARCHAR(20)
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (person_number );


CREATE TABLE adress (
 person_number  INT NOT NULL,
 street VARCHAR(50),
 city VARCHAR(50),
 zip VARCHAR(10)
);

ALTER TABLE adress ADD CONSTRAINT PK_adress PRIMARY KEY (person_number );


CREATE TABLE email (
 person_number  INT NOT NULL,
 email VARCHAR(50)
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (person_number );


CREATE TABLE instructor (
 instructor_ID  INT NOT NULL,
 person_number  INT NOT NULL,
 can_host_ensembles BIT(1)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_ID );


CREATE TABLE instructor_payment (
 instructor_ID  INT NOT NULL,
 payment_amount VARCHAR(10)
);

ALTER TABLE instructor_payment ADD CONSTRAINT PK_instructor_payment PRIMARY KEY (instructor_ID );


CREATE TABLE instructor_schedule (
 instructor_ID  INT NOT NULL,
 date DATE
);

ALTER TABLE instructor_schedule ADD CONSTRAINT PK_instructor_schedule PRIMARY KEY (instructor_ID );


CREATE TABLE lesson (
 lesson_ID  INT NOT NULL,
 instructor_ID  INT NOT NULL,
 time TIMESTAMP(6),
 place VARCHAR(50),
 type VARCHAR(20),
 proficiency VARCHAR(20),
 spots VARCHAR(10),
 minimum_spots VARCHAR(10)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_ID );


CREATE TABLE attendants (
 lesson_ID  INT NOT NULL,
 student_ID  INT
);

ALTER TABLE attendants ADD CONSTRAINT PK_attendants PRIMARY KEY (lesson_ID );


CREATE TABLE ensemble (
 lesson_ID  INT NOT NULL,
 spots VARCHAR(5),
 genre VARCHAR(50)
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_ID );


CREATE TABLE group_lesson (
 lesson_ID  INT NOT NULL,
 instrument VARCHAR(50),
 spots VARCHAR(5)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_ID );


CREATE TABLE individual_lesson (
 lesson_ID  INT NOT NULL,
 instrument VARCHAR(50)
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_ID );


CREATE TABLE student (
 student_ID  INT NOT NULL,
 person_number  INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_ID );


CREATE TABLE application (
 student_ID  INT NOT NULL,
 lesson_ID  INT NOT NULL,
 requestID VARCHAR(50),
 accepted BIT(1)
);

ALTER TABLE application ADD CONSTRAINT PK_application PRIMARY KEY (student_ID );


CREATE TABLE lesson_fee (
 lesson_ID  INT NOT NULL,
 student_ID  INT NOT NULL,
 cost FLOAT(50)
);

ALTER TABLE lesson_fee ADD CONSTRAINT PK_lesson_fee PRIMARY KEY (lesson_ID );


CREATE TABLE renting_fee (
 student_ID  INT NOT NULL,
 instrument_ID  INT
);

ALTER TABLE renting_fee ADD CONSTRAINT PK_renting_fee PRIMARY KEY (student_ID );


CREATE TABLE siblings (
 student_ID  INT NOT NULL,
 siblingID INT
);

ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (person_number ) REFERENCES person (person_number );


ALTER TABLE adress ADD CONSTRAINT FK_adress_0 FOREIGN KEY (person_number ) REFERENCES person (person_number );


ALTER TABLE email ADD CONSTRAINT FK_email_0 FOREIGN KEY (person_number ) REFERENCES person (person_number );


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_number ) REFERENCES person (person_number );


ALTER TABLE instructor_payment ADD CONSTRAINT FK_instructor_payment_0 FOREIGN KEY (instructor_ID ) REFERENCES instructor (instructor_ID );


ALTER TABLE instructor_schedule ADD CONSTRAINT FK_instructor_schedule_0 FOREIGN KEY (instructor_ID ) REFERENCES instructor (instructor_ID );


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_ID ) REFERENCES instructor (instructor_ID );


ALTER TABLE attendants ADD CONSTRAINT FK_attendants_0 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_number ) REFERENCES person (person_number );


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_ID ) REFERENCES student (student_ID );
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );


ALTER TABLE lesson_fee ADD CONSTRAINT FK_lesson_fee_0 FOREIGN KEY (lesson_ID ) REFERENCES lesson (lesson_ID );
ALTER TABLE lesson_fee ADD CONSTRAINT FK_lesson_fee_1 FOREIGN KEY (student_ID ) REFERENCES student (student_ID );


ALTER TABLE renting_fee ADD CONSTRAINT FK_renting_fee_0 FOREIGN KEY (student_ID ) REFERENCES student (student_ID );
ALTER TABLE renting_fee ADD CONSTRAINT FK_renting_fee_1 FOREIGN KEY (instrument_ID ) REFERENCES instrument (instrument_ID );


ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_ID ) REFERENCES student (student_ID );

-- Drop the existing primary key constraint on attendants
ALTER TABLE attendants
DROP CONSTRAINT PK_attendants;

-- Add a new unique constraint combining lesson_id and student_ID
ALTER TABLE attendants
ADD CONSTRAINT PK_attendants PRIMARY KEY (lesson_ID, student_ID);

