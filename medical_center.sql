DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob TEXT NOT NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(id),
    patient_id INTEGER REFERENCES patients(id)
);

CREATE TABLE illnesses
(
    id SERIAL PRIMARY KEY,
    illness_name TEXT NOT NULL,
    illness_desc TEXT NOT NULL
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits(id),
    illness_id INTEGER REFERENCES illnesses(id)
);

--mock data to start table--
INSERT INTO doctors (first_name, last_name)
VALUES 
('Regina', 'Steffen'),
('Buddy', 'Johnson'), 
('Donald', 'Duck');

INSERT INTO patients (first_name, last_name, dob)
VALUES
('Bella', 'Boo', '2015-06-10'), 
('Mickey', 'Mouse', '1900-01-01'), 
('Tom', 'Cat', '1950-10-10');

INSERT INTO visits (doctor_id, patient_id)
VALUES
(1,1), 
(1,2), 
(1,3),
(2,1),
(2,2);

INSERT INTO illnesses (illness_name, illness_desc)
VALUES
('Strep Throat', 'Sore throat'), 
('Flu', 'Fever, chills, fatigue'),
('Covid-19', 'Loss of taste and/or smell'),
('Diabetes', 'Blood sugar fluctuations');

INSERT INTO diagnoses (visit_id, illness_id)
VALUES 
(1,2),
(1,4),
(1,3),
(2,1),
(2,2), 
(3,4),
(3,3);

