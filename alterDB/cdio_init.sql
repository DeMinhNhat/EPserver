DROP DATABASE IF EXISTS cdio;

CREATE DATABASE cdio;

USE cdio;
CREATE TABLE `Faculty` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`NameFaculty` NVARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Program` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`NameProgram` NVARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `OutcomeStandard` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`NameOutcomeStandard` NVARCHAR(255) NOT NULL,
	`IdFaculty` INT NOT NULL,
	`IdProgram` INT NOT NULL,
	`IdUser` INT NOT NULL,
  `SchoolYear` VARCHAR(15),
	`DateCreated` DATETIME,
	`DateEdited` DATETIME,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `DetailOutcomeStandard` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`IdOutcomeStandard` INT NOT NULL,
	`KeyRow` VARCHAR(63) NOT NULL,
	`NameRow` NVARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Revision` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`IdOutcomeStandard` INT NOT NULL,
	`IdUser`INT  NOT NULL,
	`NameRevision` NVARCHAR(255) NOT NULL,
	`DateUpdated` DATETIME,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `DetailRevision` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`IdRevision` INT NOT NULL,
	`KeyRow` VARCHAR(63) NOT NULL,
	`NameRow` NVARCHAR(255) NOT NULL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `User` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `NameUser` NVARCHAR(127) NOT NULL,
  `Password` VARCHAR(127) NOT NULL,
  PRIMARY KEY (`Id`)
);
CREATE TABLE `Subject`(
	`Id` INT NOT NULL AUTO_INCREMENT,
	`SubjectCode` VARCHAR(255) NOT NULL,
	`SubjectName` VARCHAR(255) NOT NULL,
	`SubjectEngName` VARCHAR(255),
	`Credit` INT NOT NULL,
	`TheoryPeriod` INT NOT NULL,
	`PracticePeriod` INT NOT NULL,
	`ExercisePeriod` INT NOT NULL,
	`Description` VARCHAR(255)
	PRIMARY KEY(`Id`)
);

ALTER TABLE `OutcomeStandard` ADD CONSTRAINT `OutcomeStandard_fk0` FOREIGN KEY (`IdFaculty`) REFERENCES `Faculty`(`Id`);

ALTER TABLE `OutcomeStandard` ADD CONSTRAINT `OutcomeStandard_fk1` FOREIGN KEY (`IdProgram`) REFERENCES `Program`(`Id`);

ALTER TABLE `OutcomeStandard` ADD CONSTRAINT `OutcomeStandard_fk2` FOREIGN KEY (`IdUser`) REFERENCES `User`(`Id`);

ALTER TABLE `DetailOutcomeStandard` ADD CONSTRAINT `DetailOutcomeStandard_fk0` FOREIGN KEY (`IdOutcomeStandard`) REFERENCES `OutcomeStandard`(`Id`);

ALTER TABLE `Revision` ADD CONSTRAINT `Revision_fk0` FOREIGN KEY (`IdOutcomeStandard`) REFERENCES `OutcomeStandard`(`Id`);

ALTER TABLE `Revision` ADD CONSTRAINT `Revision_fk1` FOREIGN KEY (`IdUser`) REFERENCES `User`(`Id`);

ALTER TABLE `DetailRevision` ADD CONSTRAINT `DetailRevision_fk0` FOREIGN KEY (`IdRevision`) REFERENCES `Revision`(`Id`);