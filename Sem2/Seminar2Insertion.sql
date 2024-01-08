-- Insert data into the person table
INSERT INTO person (person_number, name) VALUES
(101, 'John Doe'),
(102, 'Jane Doe'),
(103, 'Bob Smith'),
(104, 'Saul Goodman'),
(105, 'Reeses Cups');

-- Insert data into the phone table
INSERT INTO phone (person_number, phone) VALUES
(101, '123-456-7890'),
(102, '987-654-3210'),
(103, '555-123-4567');

-- Insert data into the adress table
INSERT INTO adress (person_number, street, city, zip) VALUES
(101, '123 Main St', 'City1', '12345'),
(102, '456 Oak St', 'City2', '67890'),
(103, '789 Pine St', 'City3', '54321');

-- Insert data into the email table
INSERT INTO email (person_number, email) VALUES
(101, 'john.doe@example.com'),
(102, 'jane.doe@example.com'),
(103, 'bob.smith@example.com');

-- Insert data into the student table
INSERT INTO student (student_ID, person_number) VALUES
(101, 101),
(102, 102),
(103, 103);

-- Insert data into the instrument table first
INSERT INTO instrument (instrument_ID, price, name, brand) VALUES
(1, 50.00, 'Guitar', 'Fender'),
(2, 700.00, 'Piano', 'Yamaha'),
(3, 300.00, 'Violin', 'Stradivarius');

-- Insert data into the renting_fee table
INSERT INTO rentals (student_ID, instrument_ID, startDate, endDate) VALUES
(101, 1, '2023-11-25 10:00:00', '2024-01-25 10:00:00'),
(102, 2, '2023-11-25 10:00:00', '2024-01-25 10:00:00'),
(103, 3, '2023-11-25 10:00:00', '2024-01-25 10:00:00');

-- Insert data into the discount table
INSERT INTO discount (discount_rate) VALUES
(0.9);

-- Insert data into the instructor table
INSERT INTO instructor (instructor_ID, person_number, can_host_ensembles) VALUES
(1, 104, B'1'),
(2, 105, B'0');

-- Insert data into the instructor_schedule table
INSERT INTO instructor_schedule (instructor_ID, date) VALUES
(1, '2024-01-25'),
(2, '2024-01-25');

INSERT INTO proficiency (proficiency_ID, skill_level) VALUES
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Advanced');

INSERT INTO lesson_type (lesson_type_ID, type) VALUES
(1, 'Individual'),
(2, 'Group'),
(3, 'Ensemble');

-- Insert data into the lesson table
INSERT INTO lesson (lesson_ID, instructor_ID, lesson_type_ID, proficiency_ID, time, place, instructor_payment) VALUES
(1, 1, 3, 2, '2023-11-25 10:00:00', 'Studio A', '500'),
(2, 2, 1, 1, '2023-11-26 15:00:00', 'Studio B', '300');

-- Insert data into the attendants table
INSERT INTO attendants (lesson_ID, student_ID) VALUES
(1, 101),
(2, 103);

-- Insert data into the ensemble table
INSERT INTO ensemble (lesson_ID, spots, genre) VALUES
(1, '10', 'Classical');

-- Insert data into the group_lesson table
-- INSERT INTO group_lesson (lesson_ID, instrument, spots) VALUES

-- Insert data into the individual_lesson table
INSERT INTO individual_lesson (lesson_ID, instrument) VALUES
(2, 'Violin');

-- Insert data into the application table
INSERT INTO application (student_ID, lesson_ID, requestID, accepted) VALUES
(101, 1, 'ABC123', B'1'),
(103, 2, 'GHI789', B'0');

-- Insert data into the lesson_fee table
INSERT INTO lesson_prices (lesson_type_ID, proficiency_ID, price, date) VALUES
(3, 2, 50.00, '2024-01-25 10:00:00'),
(1, 1, 70.00, '2024-01-25 15:00:00');
