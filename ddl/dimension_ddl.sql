
--------------------------------------------------------------
-- Database creation Script

-- Auto-Generated by QSEE-SuperLite (c) 2001-2004 QSEE-Technologies Ltd.

-- Verbose generation: ON

-- note: spaces within table/column names have been replaced by underscores (_)

-- Target DB: SQL2

-- Entity Model :Entity Relationship Diagram

-- To drop the tables generated by this script run -
--   'C:\Users\LENOVO\Desktop\ddl\dimension_ddl_drop.sql'

--------------------------------------------------------------



--------------------------------------------------------------
-- Table Creation --

-- Each entity on the model is represented by a table that needs to be created within the Database.
-- Within SQL new tables are created using the CREATE TABLE command.
-- When a table is created its name and its attributes are defined.
-- The values of which are derived from those specified on the model.
-- Certain constraints are sometimes also specified, such as identification of primary keys.

-- Create a Database table to represent the "DIM_TIME" entity.
CREATE TABLE DIM_TIME(
	time_id	INTEGER NOT NULL,
	year	INTEGER,
	quarter	INTEGER,
	month	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "DIM_TIME".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_TIME PRIMARY KEY (time_id)
);

-- Create a Database table to represent the "DIM_CASE" entity.
CREATE TABLE DIM_CASE(
	case_id	INTEGER NOT NULL,
	case_status	VARCHAR(8),
	case_type	VARCHAR(8),
	-- Specify the PRIMARY KEY constraint for table "DIM_CASE".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_CASE PRIMARY KEY (case_id)
);

-- Create a Database table to represent the "DIM_REGION" entity.
CREATE TABLE DIM_REGION(
	region_id	INTEGER NOT NULL,
	region_name	VARCHAR(8),
	area_name	VARCHAR(8),
	-- Specify the PRIMARY KEY constraint for table "DIM_REGION".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_REGION PRIMARY KEY (region_id)
);

-- Create a Database table to represent the "DIM_OFFICER" entity.
CREATE TABLE DIM_OFFICER(
	officer_id	INTEGER NOT NULL,
	officer_name	VARCHAR(8),
	-- Specify the PRIMARY KEY constraint for table "DIM_OFFICER".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_OFFICER PRIMARY KEY (officer_id)
);

-- Create a Database table to represent the "DIM_STATION" entity.
CREATE TABLE DIM_STATION(
	station_id	INTEGER NOT NULL,
	station_name	VARCHAR(8),
	-- Specify the PRIMARY KEY constraint for table "DIM_STATION".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_STATION PRIMARY KEY (station_id)
);

-- Create a Database table to represent the "FACT_CRIME" entity.
CREATE TABLE FACT_CRIME(
	fact_crime_id	INTEGER NOT NULL,
	region_id	INTEGER,
	officer_id	INTEGER,
	case_id	INTEGER,
	time_id	INTEGER,
	witness_id	INTEGER,
	station_id	INTEGER,
	number_of_crimes	INTEGER,
	fk1_region_id	INTEGER NOT NULL,
	fk2_case_id	INTEGER NOT NULL,
	fk3_time_id	INTEGER NOT NULL,
	fk4_witness_id	INTEGER NOT NULL,
	fk5_station_id	INTEGER NOT NULL,
	fk6_officer_id	INTEGER NOT NULL,
	-- Specify the PRIMARY KEY constraint for table "FACT_CRIME".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_FACT_CRIME PRIMARY KEY (fact_crime_id)
);

-- Create a Database table to represent the "DIM_WITNESS" entity.
CREATE TABLE DIM_WITNESS(
	witness_id	INTEGER NOT NULL,
	witness_type	VARCHAR(8),
	-- Specify the PRIMARY KEY constraint for table "DIM_WITNESS".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_WITNESS PRIMARY KEY (witness_id)
);


--------------------------------------------------------------
-- Alter Tables to add fk constraints --

-- Now all the tables have been created the ALTER TABLE command is used to define some additional
-- constraints.  These typically constrain values of foreign keys to be associated in some way
-- with the primary keys of related tables.  Foreign key constraints can actually be specified
-- when each table is created, but doing so can lead to dependency problems within the script
-- i.e. tables may be referenced before they have been created.  This method is therefore safer.

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_REGION" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_REGION"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk1_FACT_CRIME_to_DIM_REGION FOREIGN KEY(fk1_region_id) REFERENCES DIM_REGION(region_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_CASE" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_CASE"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk2_FACT_CRIME_to_DIM_CASE FOREIGN KEY(fk2_case_id) REFERENCES DIM_CASE(case_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_TIME" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_TIME"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk3_FACT_CRIME_to_DIM_TIME FOREIGN KEY(fk3_time_id) REFERENCES DIM_TIME(time_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_WITNESS" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_WITNESS"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk4_FACT_CRIME_to_DIM_WITNESS FOREIGN KEY(fk4_witness_id) REFERENCES DIM_WITNESS(witness_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_STATION" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_STATION"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk5_FACT_CRIME_to_DIM_STATION FOREIGN KEY(fk5_station_id) REFERENCES DIM_STATION(station_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Alter table to add new constraints required to implement the "FACT_CRIME_DIM_OFFICER" relationship

-- This constraint ensures that the foreign key of table "FACT_CRIME"
-- correctly references the primary key of table "DIM_OFFICER"

ALTER TABLE FACT_CRIME ADD CONSTRAINT fk6_FACT_CRIME_to_DIM_OFFICER FOREIGN KEY(fk6_officer_id) REFERENCES DIM_OFFICER(officer_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


--------------------------------------------------------------
-- End of DDL file auto-generation
--------------------------------------------------------------
