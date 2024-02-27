-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center; 

CREATE DATABASE medical_center; 

\c medical_center

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    date_of_visit DATE NOT NULL,
    employee_id INT NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    disease_name VARCHAR(255) NOT NULL,
    disease_description TEXT
);

CREATE TABLE diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL,
    disease_id INT NOT NULL,
    notes TEXT,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (disease_id) REFERENCES diseases(disease_id)
);

INSERT INTO employees (first_name, last_name, specialty) VALUES
('John', 'Doe', 'Cardiologist'),
('Jane', 'Smith', 'Neurologist'),
('Emily', 'Jones', 'Pediatrician');

INSERT INTO patients (first_name, last_name, date_of_birth) VALUES
('Michael', 'Brown', '2005-04-21'),
('Sarah', 'Davis', '1988-11-02'),
('William', 'Wilson', '1995-07-30');

INSERT INTO visits (date_of_visit, employee_id, patient_id) VALUES
('2024-02-25', 1, 1),
('2024-02-26', 2, 2),
('2024-02-27', 3, 3);

INSERT INTO diseases (disease_name, disease_description) VALUES
('Common Cold', 'A common viral infection of the nose and throat.'),
('Hypertension', 'A condition in which the force of the blood against the artery walls is too high.'),
('Diabetes', 'A disease that occurs when your blood glucose, also called blood sugar, is too high.');

INSERT INTO diagnoses (visit_id, disease_id, notes) VALUES
(1, 1, 'Recommended rest and increased fluid intake.'),
(2, 2, 'Prescribed medication to manage blood pressure.'),
(3, 3, 'Advised on diet and exercise, and prescribed insulin.');

