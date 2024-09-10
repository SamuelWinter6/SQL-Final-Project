-- Create MaintenanceInfo table
CREATE TABLE IF NOT EXISTS MaintenanceInfo (
    ODINumber INT,
    Manufacturer VARCHAR(255),
    Crash BOOLEAN,
    Fire BOOLEAN,
    Injuries INT,
    Deaths INT,
    IncidentDate DATE,
    ComplaintDate DATE,
    VIN VARCHAR(17),
    Component VARCHAR(255),
    Summary TEXT,
    ProductYear YEAR,
    ProductMake VARCHAR(255),
    ProductModel VARCHAR(255),
    PRIMARY KEY (ODINumber)
);

-- Create ModelCarSpecs table
CREATE TABLE IF NOT EXISTS ModelCarSpecs (
    SpecID INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(255),
    model VARCHAR(255),
    class VARCHAR(255),
    drive VARCHAR(255),
    fuel_type VARCHAR(255),
    city_mpg INT,
    highway_mpg INT,
    combination_mpg INT,
    transmission VARCHAR(255),
    Year YEAR
);

-- Check data integrity
SELECT
	*
FROM MaintenanceInfo mi;

SELECT
	*
FROM ModelCarSpecs mcs;

-- Create intersection table
CREATE TABLE ModelYearMapping (
    BaseModel VARCHAR(255), -- This column will be populated with your UPDATE statement later.
    SpecificModel VARCHAR(255),
    ModelYear YEAR,
    PRIMARY KEY (SpecificModel, ModelYear) -- Assuming this combination is unique.
);

-- Insert carmodelspec info
INSERT INTO ModelYearMapping (SpecificModel, ModelYear)
SELECT
	model,
	year
FROM ModelCarSpecs
GROUP BY model, year;

-- Insert base models from MaintenanceInfo to correspond to every SpecificModel type
UPDATE ModelYearMapping
SET BaseModel = 'Model Y'
WHERE SpecificModel LIKE '%model y%';

UPDATE ModelYearMapping
SET BaseModel = 'Model S'
WHERE SpecificModel LIKE '%model s%';

UPDATE ModelYearMapping
SET BaseModel = 'Model 3'
WHERE SpecificModel LIKE '%model 3%';

UPDATE ModelYearMapping
SET BaseModel = 'Ioniq 5'
WHERE SpecificModel LIKE 'ioniq 5%';

UPDATE ModelYearMapping
SET BaseModel = 'Bolt EV'
WHERE SpecificModel = 'bolt ev';

UPDATE ModelYearMapping
SET BaseModel = 'Mustang Mach-E'
WHERE SpecificModel LIKE 'mustang mach-e%';

UPDATE ModelYearMapping
SET BaseModel = 'ID.4'
WHERE SpecificModel LIKE 'id.4%';

-- Check Data
SELECT *
FROM ModelYearMapping mym

-- Modify ModelCarSpecs & MaintenanceInfo table to have new Model ID so that tables can be joined more easliy
-- Preview Changes before making updates
SELECT 
  model,
  CASE
    WHEN model LIKE 'model y%' THEN 1
    WHEN model LIKE 'model s%' THEN 2
    WHEN model LIKE 'model 3%' THEN 3
    WHEN model LIKE 'ioniq 5%' THEN 4
    WHEN model LIKE 'bolt ev%' THEN 5
    WHEN model LIKE 'mustang mach-e%' THEN 6
    WHEN model LIKE 'id.4%' THEN 7
    ELSE NULL
  END as PreviewModelID
FROM 
  ModelCarSpecs;
 
-- Update table with new column called Model ID
ALTER TABLE ModelCarSpecs
ADD COLUMN ModelID INT;

UPDATE ModelCarSpecs
SET ModelID = CASE
  WHEN model LIKE 'model y%' THEN 1
  WHEN model LIKE 'model s%' THEN 2
  WHEN model LIKE 'model 3%' THEN 3
  WHEN model LIKE 'ioniq 5%' THEN 4
  WHEN model LIKE 'bolt ev%' THEN 5
  WHEN model LIKE 'mustang mach-e%' THEN 6
  WHEN model LIKE 'id.4%' THEN 7
  ELSE NULL
END;

-- Preview Changes before making updates
SELECT 
  ProductModel,
  CASE
    WHEN ProductModel LIKE 'model y%' THEN 1
    WHEN ProductModel LIKE 'model s%' THEN 2
    WHEN ProductModel LIKE 'model 3%' THEN 3
    WHEN ProductModel LIKE 'ioniq 5%' THEN 4
    WHEN ProductModel LIKE 'bolt ev%' THEN 5
    WHEN ProductModel LIKE 'mustang mach e%' THEN 6
    WHEN ProductModel LIKE 'id.4%' THEN 7
    ELSE NULL
  END as PreviewModelID
FROM 
  MaintenanceInfo;
  
 -- Update table with new column called Model ID
ALTER TABLE MaintenanceInfo
ADD COLUMN ModelID INT;

UPDATE MaintenanceInfo
SET ModelID = CASE
  WHEN ProductModel LIKE 'model y%' THEN 1
  WHEN ProductModel LIKE 'model s%' THEN 2
  WHEN ProductModel LIKE 'model 3%' THEN 3
  WHEN ProductModel LIKE 'ioniq 5%' THEN 4
  WHEN ProductModel LIKE 'bolt ev%' THEN 5
  WHEN ProductModel LIKE 'mustang mach e%' THEN 6
  WHEN ProductModel LIKE 'id.4%' THEN 7
  ELSE NULL
END;