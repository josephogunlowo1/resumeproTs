CREATE DATABASE resumepro;

USE resumepro;

CREATE TABLE `resumepro`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_initial` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  `postal_code` INT NOT NULL,
  `home_phone` INT NOT NULL,
  `office_phone` INT NOT NULL,
  `office_location` VARCHAR(45) NOT NULL,
  `manger_id` INT NOT NULL,
  `vacation_hours` VARCHAR(45) NOT NULL,
  `sick_leave_hours` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`));

CREATE TABLE `resumepro`.`job history` (
  `employee_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `title_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `pay` VARCHAR(45) NOT NULL,
  INDEX `title_id` (`title_id` ASC) INVISIBLE,
  INDEX `dept_id` (`department_id` ASC) VISIBLE);

  ALTER TABLE `resumepro`.`job history` 
ADD INDEX `emp_id_idx` (`employee_id` ASC) VISIBLE;
;
ALTER TABLE `resumepro`.`job history` 
ADD CONSTRAINT `emp_id`
  FOREIGN KEY (`employee_id`)
  REFERENCES `resumepro`.`employee` (`employee_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `resumepro`.`titles` (
  `title_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  `job_description` VARCHAR(45) NOT NULL,
  `low_pay` VARCHAR(45) NOT NULL,
  `high_pay` VARCHAR(45) NOT NULL);

CREATE TABLE `resumepro`.`departments` (
  `department_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `manger_id` INT NOT NULL,
  INDEX `mnger_id` (`department_id` ASC, `name` ASC, `manger_id` ASC) VISIBLE);
