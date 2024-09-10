-- Initialize Schema
CREATE DATABASE IF NOT EXISTS sql_project;
USE sql_project;

-- Create cusomter review table
CREATE TABLE IF NOT EXISTS CustomerReviews (
    reviewID INT AUTO_INCREMENT PRIMARY KEY,
    car_model VARCHAR(255),
    overall_rating DECIMAL(3, 2),
    title VARCHAR(255),
    date_posted DATETIME,
    user_name VARCHAR(255),
    review_text TEXT,
    comfort INT,
    interior INT,
    performance INT,
    value INT,
    reliability INT
);

-- Check data integrity
SELECT *
FROM CustomerReviews cr;

/*
Two different types of date formats exist within table

The following statement below updates these rows with the appropiate date format MM/DD/YY
*/

-- Preview the changes before making them
SELECT 
    date_posted,
    STR_TO_DATE(date_posted, '%m/%d/%Y') AS new_date_format
FROM 
    CustomerReviews
WHERE 
    STR_TO_DATE(date_posted, '%m/%d/%Y') IS NOT NULL;
   
-- Update the rows
UPDATE CustomerReviews
SET date_posted = STR_TO_DATE(date_posted, '%m/%d/%Y')
WHERE STR_TO_DATE(date_posted, '%m/%d/%Y') IS NOT NULL;

-- Modify ModelCarSpecs table to have new Model ID so that tables can be joined more easliy
-- Preview Changes before making updates
SELECT 
  CarModel,
  CASE
    WHEN CarModel = 'Tesla Model Y' THEN 1
    WHEN CarModel = 'Tesla Model S' THEN 2
    WHEN CarModel = 'Tesla Model 3' THEN 3
    WHEN CarModel = 'Hyundai Ioniq 5' THEN 4
    WHEN CarModel = 'Chevrolet Bolt EV' THEN 5
    WHEN CarModel = 'Ford Mustang Mach-E' THEN 6
    WHEN CarModel = 'Volkswagen ID.4' THEN 7
    ELSE NULL
  END as PreviewModelID
FROM 
  CustomerReviews;
  
 -- Update table with new column called Model ID
ALTER TABLE CustomerReviews
ADD COLUMN ModelID INT;

UPDATE CustomerReviews
SET ModelID = CASE
  WHEN CarModel = 'Tesla Model Y' THEN 1
  WHEN CarModel = 'Tesla Model S' THEN 2
  WHEN CarModel = 'Tesla Model 3' THEN 3
  WHEN CarModel = 'Hyundai Ioniq 5' THEN 4
  WHEN CarModel = 'Chevrolet Bolt EV' THEN 5
  WHEN CarModel = 'Ford Mustang Mach-E' THEN 6
  WHEN CarModel = 'Volkswagen ID.4' THEN 7
  ELSE NULL
END;