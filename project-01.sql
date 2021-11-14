DROP DATABASE IF EXISTS ivcompany;

CREATE DATABASE IF NOT EXISTS ivcompany; 
USE ivcompany;

DROP TABLE IF EXISTS departments,
					 employees,
					 positions,
                     salaries;
                     
				
CREATE TABLE departments (
    dept_no CHAR(6) NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE KEY (dept_name)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE positions (
    emp_no INT NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    salary INT NOT NULL,
    dept_no CHAR(6) NOT NULL,
    FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
        ON DELETE CASCADE,
    PRIMARY KEY (emp_no , job_title , from_date)
); 

INSERT INTO departments (dept_no, dept_name) VALUES
('dp001','Human Resources'),
('dp002','Data Analytics'),
('dp003','Finance'),
('dp004','Marketing'),
('dp005','Production'),
('dp006','Customer Service'),
('dp007','IT'),
('dp008','Management'),
('dp009','Sales');


INSERT INTO employees (emp_no, birth_date, first_name, last_name, hire_date, gender) VALUES 
(1001,'1963-09-02','Roman','Farell','1980-07-01','M'),
(1002,'1967-01-02','Elizabeth','Brown','1989-01-21','F'),
(1003,'1978-11-04','Joan','Oliver','2005-09-02','F'),
(1004,'1969-04-05','Peter','Ross','1989-12-04','M'),
(1005,'1965-01-21','Garry','Chower','1989-09-12','M'),
(1006,'1969-05-29','Monica','Chylinski','1987-09-12','F'),
(1007,'1980-06-27','Andrzej','Wierzbowski','2011-01-01','M'),
(1008,'1978-05-15','Sylvia','Michielletti','1999-10-20','F'),
(1009,'1968-04-30','Clara','Jobs','1989-03-17','F'),
(1010,'1972-10-11','Dona','Johns','1990-07-01','F'),
(1011,'1982-01-06','Olivia','Wilson','2021-01-22','F'),
(1012,'1963-01-04','Fintain','Gear','1991-12-19','M'),
(1013,'1969-08-05','Erin','Rossenberg','1988-08-27','F'),
(1014,'1980-02-12','Hunter','Green','1999-10-12','M'),
(1015,'1984-01-20','Olga','Kruch','2011-01-04','F'),
(1016,'1976-12-03','Ryan','Shulc','2000-02-01','M'),
(1017,'1969-01-05','Hennry','Blair','1999-07-12','M'),
(1018,'1968-06-20','Karen','Dean','1989-09-06','F'),
(1019,'1981-02-01','Shoun','Vick','2001-02-01','M'),
(1020,'1982-01-02','Pearl','Fernandes','2010-05-21','F'),
(1021,'1969-09-01','Johathan','Wild','1989-05-12','M'),
(1022,'1980-11-19','Sebastian','Burdot','2011-01-25','M'),
(1023,'1981-10-01','Hellen','Wilson','2009-09-30','F'),
(1024,'1982-04-04','Monica','Gabs','2011-03-14','F'),
(1025,'1971-01-09','Anna','Harrison','1990-03-12','F'),
(1026,'1973-09-09','Greame','McGibs','1999-09-28','M'),
(1027,'1969-09-28','Charlotte','Milward','1990-09-01','F'),
(1028,'1978-01-08','Gabriel','Moss','1998-11-01','M'),
(1029,'1989-01-01','Steven','Padlin','2010-09-08','M'),
(1030,'1976-04-13','William','Greenaway','2001-07-12','M');

UPDATE employees 
SET 
    birth_date = '1982-01-02',
    first_name = 'Pearl',
    last_name = 'Fernandes',
    hire_date = '2010-05-21',
    gender = 'M'
WHERE
    emp_no = 1020;

INSERT INTO positions (emp_no, job_title, from_date, to_date, salary, dept_no) VALUES
(1001,'General Manager','1986-06-26','9999-01-01',13000,'dp008'),
(1002,'Statistician','1980-07-01','1986-06-2',70000,'dp002'),
(1003,'Senior Engineer','2005-09-02','9999-01-01',50000,'dp005'),
(1004,'Accountant','1989-12-04','1990-12-04',30000,'dp003'),
(1004,'Account Executive','1990-12-04','9999-01-01',60000,'dp003'),
(1005,'Office Assistant','1989-09-12','1991-09-12',25000,'dp008'),
(1005,'Data Scientist','1991-09-12','1996-09-12',55000,'dp002'),
(1006,'Computer Systems Analyst','1987-09-12','9999-01-01',54000,'dp007'),
(1007,'Senior Staff','2011-01-011','9999-01-01',45000,'dp001'),
(1008,'Staff','1999-10-20','2000-02-11',27000,'dp001'),
(1008,'Information Systems Manager','2000-02-11','2017-07-01',60000,'dp007'),
(1009,'Assistant Engineer','1989-03-17','1990-02-18',28000,'dp005'),
(1009,'Engineer','1990-02-18','1995-02-18',44500,'dp005'),
(1009,'Senior Engineer','1995-02-18','2000-01-03',55000,'dp005'),
(1010,'Staff','1990-07-01','9999-01-01',23000,'dp009'),
(1011,'Staff','2021-01-22','9999-01-01',31000,'dp009'),
(1012,'Staff','1991-12-19','2000-12-18',25000,'dp006'),
(1012,'Senior Staff','2000-12-18','9999-01-01',41500,'dp006'),
(1013,'Senior Staff','1988-08-27','9999-01-01',42000,'dp004'),
(1014,'Engineer','1999-10-12','9999-01-01',45000,'dp005'),
(1015,'	Senior Staff','2011-01-04','9999-01-01',46000,'dp001'),
(1016,'Staff','2000-02-01','9999-01-01',28000,'dp004'),
(1017,'Data Scientist','2000-08-03','9999-01-01',70000,'dp002'),
(1017,'Staff','1999-07-12','2000-08-03',45000,'dp002'),
(1018,'Staff','1989-09-06','1995-04-03',30500,'dp006'),
(1018,'Data Analyst','1995-04-03','9999-01-01',56000,'dp006'),
(1019,'Staff','001-02-01','9999-01-01',46000,'dp007'),
(1020,'Engineer','2010-05-21','2019-05-21',47000,'dp007'),
(1021,'Technique Leader','1989-05-12','2005-07-31',55000,'dp005'),
(1022,'Engineer','2011-01-25','9999-01-01',61000,'dp005'),
(1023,'Office Manager','2009-09-30','9999-01-01',39000,'dp008'),
(1024,'Assistant Engineer','2011-03-14','9999-01-01',33500,'dp005'),
(1025,'Financial Advisor','1990-03-12','9999-01-01',43000,'dp003'),
(1026,'Acountant','1995-03-20','2001-03-19',55000,'dp003'),
(1026,'Senior Acountant','2001-03-19','9999-01-01',67000,'dp003'),
(1027,'Engineer','1990-09-01','2001-04-01',53000,'dp005'),
(1027,'Senior Data Analyst','2001-04-01','9999-01-01',88000,'dp002'),
(1028,'Staff','1998-11-01','1990-04-06',28000,'dp009'),
(1029,'Staff','2010-09-08','2015-09-17',27000,'dp006'),
(1029,'Senior Staff','2015-09-17','9999-01-01',43000,'dp004'),
(1030,'Staff','2001-07-12','2012-02-17',27000,'dp008');

INSERT INTO positions (emp_no, job_title, from_date, to_date, salary, dept_no) VALUES
(1031,'Staff','2016-09-01','9999-01-01',30000,'dp004'),
(1032,'Staff','20016-01-01','9999-01-01',27000,'dp008');

UPDATE positions 
SET 
    job_title = 'Head of Marketing dept ',
    salary = 55000
WHERE
    emp_no = 1013;


-- using simple select 

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, emp_no
FROM
    employees
WHERE
    hire_date > '2000-01-01';


SELECT DISTINCT
    job_title
FROM
    positions;
    
    
SELECT 
    *
FROM
    employees
WHERE
    last_name REGEXP '^gree';
    
  
 UPDATE positions 
SET 
    salary = 130000
WHERE
    job_title = 'General Manager';
    

-- using aggregate functions

SELECT 
    emp_no, 
    MAX(salary) AS top_salary,
    SUM(salary) AS total 
FROM
    positions
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no WITH ROLLUP;

    
-- group by / having  
    
 SELECT 
    emp_no,
    MAX(salary) AS top_salary,
    COUNT(salary) AS nr_of_employments
FROM
    positions
GROUP BY emp_no
ORDER BY nr_of_employments DESC;

 SELECT 
 emp_no,
    MAX(salary) AS top_salary,
    COUNT(salary) AS nr_of_employments
FROM
    positions
GROUP BY emp_no
HAVING nr_of_employments > 1;


-- joins

SELECT 
    e.emp_no, e.first_name, e.last_name, p.to_date, d.dept_name
FROM
    employees e
        JOIN
    positions p ON e.emp_no = p.emp_no
        JOIN
    departments d ON p.dept_no = d.dept_no
WHERE
    p.to_date IN (SELECT 
            to_date
        FROM
            positions
        WHERE
            YEAR(to_date) = '9999-01-01');
            
            
-- using unions

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
		e.first_name,
		e.last_name,
		NULL AS dept_no,
		NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Ross' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            d.dept_no,
            d.dept_name
    FROM
        departments d) AS a
ORDER BY - a.emp_no DESC;

            
-- creating additional table in order to practice IFNULL AND COALESCE functions

DROP TABLE IF EXISTS empl_contact_details;

CREATE TABLE empl_contact_details (
    emp_no INT NOT NULL,
    tel_no VARCHAR(255),
    email_address VARCHAR(255),
    FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
        ON DELETE CASCADE,
    PRIMARY KEY (emp_no),
    UNIQUE KEY (email_address)
); 

INSERT INTO empl_contact_details (emp_no) VALUES 
(1001),
(1002),
(1003),
(1004),
(1005),
(1006),
(1007),
(1008),
(1009),
(1010),
(1011),
(1012),
(1013),
(1014),
(1015),
(1016),
(1017),
(1018),
(1019),
(1020),
(1021),
(1022),
(1023),
(1024),
(1025),
(1026),
(1027),
(1028),
(1029),
(1030);

SELECT 
    emp_no, IFNULL(tel_no, 'Not assigned') AS tel_no
FROM
    empl_contact_details;
    
SELECT 
    emp_no, COALESCE(email_address, tel_no, 'N/A') AS tel_no
FROM
    empl_contact_details;
    
    
-- IF function

SELECT 
    emp_no,
    to_date,
    IF(to_date = CURDATE(),
        'employed',
        'P45') AS status
FROM
    positions
ORDER BY status; 


-- using case operator

SELECT 
    emp_no,
    CASE
        WHEN salary > 70000 THEN 'top'
        WHEN salary BETWEEN 40000 AND 70000 THEN 'mid'
        WHEN salary BETWEEN 30000 AND 40000 THEN 'low'
        ELSE 'basic'
    END AS salary_range
FROM
    positions;

    
SELECT 
    e.first_name,
    e.last_name,
    p.salary,
    CASE
        WHEN salary > 70000 THEN salary + (salary * 0.10)
        WHEN salary BETWEEN 40000 AND 70000 THEN salary + (salary * 0.05)
        WHEN salary BETWEEN 30000 AND 40000 THEN salary + (salary * 0.03)
        ELSE salary + (salary * 0.01)
    END AS bonus
FROM
    employees e
        JOIN
    positions p USING (emp_no)
WHERE
    YEAR(p.to_date) = '9999-01-01'
ORDER BY p.salary DESC;


-- creating views

CREATE VIEW employee_num_by_year AS
SELECT 
    e.gender,
    YEAR(p.from_date) AS calendar_year,
    COUNT(e.emp_no) AS number_of_employees
FROM
    employees e
        JOIN
    positions p ON e.emp_no = p.emp_no
GROUP BY e.gender , calendar_year
HAVING calendar_year > 1990;

    
-- creating stored procedure

DROP PROCEDURE IF EXISTS emp_avg_salary;

DELIMITER $$

CREATE PROCEDURE emp_avg_salary (IN p_emp_no INTEGER)
BEGIN
	SELECT 
		e.first_name,
        e.last_name,
		AVG(po.salary) AS salary
	FROM
		employees e
			JOIN
		positions po ON e.emp_no = po.emp_no
	WHERE e.emp_no = p_emp_no;
    END$$
    
DELIMITER ;

CALL emp_avg_salary(1020);






