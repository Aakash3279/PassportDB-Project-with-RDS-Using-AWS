-- Create the database
CREATE DATABASE passport_applicants;

-- Use the database
USE passport_applicants;

-- Create the applicants table
CREATE TABLE applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    passport_number VARCHAR(20) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- Create the travel_history table
CREATE TABLE travel_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    country_visited VARCHAR(100),
    date_of_entry DATE,
    date_of_exit DATE,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id)
);
