-- Insert data into discount table
INSERT INTO discount (discount_rate) VALUES (0.1), (0.15), (0.2), (0.9);

-- Insert data into instrument table
INSERT INTO instrument (instrument_ID, price, name, brand) VALUES
(1, 500, 'Guitar', 'Fender'),
(2, 700, 'Piano', 'Yamaha'),
(3, 300, 'Violin', 'Stradivarius'),
(4, 50.00, 'Guitar', 'Fender'),
(5, 700.00, 'Piano', 'Yamaha'),
(6, 300.00, 'Violin', 'Stradivarius');

-- Insert data into person table
INSERT INTO person (person_number, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Bob Smith'),
(4, 'Alice Johnson'),
(5, 'Charlie Brown'),
(6, 'Eve White'),
(101, 'John Doe'),
(102, 'Jane Doe'),
(103, 'Bob Smith'),
(104, 'Saul Goodman'),
(105, 'Reeses Cups');

-- Insert data into phone table
INSERT INTO phone (person_number, phone) VALUES
(1, '123-456-7890'),
(2, '987-654-3210'),
(3, '555-123-4567'),
(4, '111-222-3333'),
(5, '444-555-6666'),
(6, '777-888-9999'),
(101, '123-456-7890'),
(102, '987-654-3210'),
(103, '555-123-4567');

-- Insert data into adress table
INSERT INTO adress (person_number, street, city, zip) VALUES
(1, '123 Main St', 'Anytown', '12345'),
(2, '456 Oak St', 'Othertown', '67890'),
(3, '789 Pine St', 'Somewhere', '54321'),
(4, '321 Elm St', 'Newtown', '98765'),
(5, '654 Birch St', 'Smalltown', '13579'),
(6, '987 Maple St', 'Cityville', '24680'),
(101, '123 Main St', 'City1', '12345'),
(102, '456 Oak St', 'City2', '67890'),
(103, '789 Pine St', 'City3', '54321');

-- Insert data into email table
INSERT INTO email (person_number, email) VALUES
(1, 'john.doe@example.com'),
(2, 'jane.doe@example.com'),
(3, 'bob.smith@example.com'),
(4, 'alice.johnson@example.com'),
(5, 'charlie.brown@example.com'),
(6, 'eve.white@example.com'),
(101, 'john.doe@example.com'),
(102, 'jane.doe@example.com'),
(103, 'bob.smith@example.com');

-- Insert data into instructor table
INSERT INTO instructor (instructor_ID, person_number, can_host_ensembles) VALUES
(1, 101, B'1'),
(2, 102, B'0'),
(3, 103, B'1');

-- Insert data into instructor_payment table
INSERT INTO instructor_payment (instructor_ID, payment_amount) VALUES
(1, '1000'),
(2, '800'),
(3, '1200');

-- Insert data into instructor_schedule table
INSERT INTO instructor_schedule (instructor_ID, date) VALUES
(1, '2024-01-6'),
(2, '2024-01-7'),
(3, '2024-01-8');

-- Insert data into lesson table
INSERT INTO lesson (lesson_ID, instructor_ID, time, place, type, proficiency, spots, minimum_spots) VALUES
(1, 1, '2024-01-6 10:00:00', 'Studio A', 'Individual', 'Beginner', '5', '3'),
(2, 2, '2024-01-7 14:00:00', 'Room B', 'Group', 'Intermediate', '10', '8'),
(3, 3, '2024-01-8 16:30:00', 'Hall C', 'Ensemble', 'Beginner', '1', '1'),
(4, 3, '2024-01-9 16:30:00', 'Hall C', 'Ensemble', 'Advanced', '15', '10'),
(5, 3, '2024-01-10 16:30:00', 'Hall C', 'Ensemble', 'Intermediate', '2', '1');

-- Insert data into attendants table
INSERT INTO attendants (lesson_ID, student_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 2);

-- Insert data into ensemble table
INSERT INTO ensemble (lesson_ID, spots, genre) VALUES
(3, '0', 'Orchestra'),
(4, '15', 'Rock'),
(5, '2', 'Country');

-- Insert data into group_lesson table
INSERT INTO group_lesson (lesson_ID, instrument, spots) VALUES
(2, 'Piano', '5');

-- Insert data into individual_lesson table
INSERT INTO individual_lesson (lesson_ID, instrument) VALUES
(1, 'Guitar');

-- Insert data into student table
INSERT INTO student (student_ID, person_number) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Insert data into siblings table
INSERT INTO siblings (student_ID, siblingID) VALUES
(2, 3),
(3, 2),
(4, 5),
(4, 6),
(5, 4),
(5, 6),
(6, 4),
(6, 5);

-- Insert data into renting_fee table
INSERT INTO renting_fee (student_ID, instrument_ID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into lesson_fee table
INSERT INTO lesson_fee (lesson_ID, student_ID, cost) VALUES
(1, 1, 100.00),
(2, 2, 70.00),
(3, 2, 50.00),
(3, 3, 50.00);

-- Insert data into application table
INSERT INTO application (student_ID, lesson_ID, requestID, accepted) VALUES
(1, 1, 1, B'1');
