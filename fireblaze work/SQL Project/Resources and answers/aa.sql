show databases;
USE Bank_management;

CREATE TABLE account_type (
Account_no int NOT NULL,
Type_Account varchar(255) NOT NULL,
Manager_id int NOT NULL,
Department_name varchar(255) NOT NULL,
Opening_Date DATE NOT NULL,
PRIMARY KEY (Account_no)
);

CREATE TABLE Department (
Department_id int NOT NULL,
Department_name varchar(255) NOT NULL,
Manager_id int NOT NULL,
Employee_id int NOT NULL,
Account_no int NOT NULL,
PRIMARY KEY (Department_id),
FOREIGN KEY (Account_no)
REFERENCES account_type (Account_no)
);


CREATE TABLE bank_details (
Branch_code int NOT NULL,
Address varchar(255) NOT NULL,
Department_id int NOT NULL,
Branch_name varchar(255) NOT NULL,
State varchar(255) NOT NULL,
PRIMARY KEY (Branch_code),
FOREIGN KEY (Department_id)
REFERENCES Department (Department_id)
);


CREATE TABLE Job_Details (
Job_id varchar(255) NOT NULL,
Department_id int NOT NULL,
Branch_code int NOT NULL,
PRIMARY KEY (Job_id),
FOREIGN KEY (Department_id)
REFERENCES Department (Department_id),
FOREIGN KEY (Branch_code)
REFERENCES bank_details (Branch_code)
);

CREATE TABLE Employees (
Employee_id int NOT NULL,
First_Name varchar(255) NOT NULL,
Department_id int NOT NULL,
Manager_id int NOT NULL,
Job_id varchar(255) NOT NULL,
Email varchar(255) NOT NULL,
Hire_Date DATE NOT NULL,
Phone_no varchar(255) NOT NULL,
Salary int NOT NULL,
PRIMARY KEY (Employee_id),
FOREIGN KEY (Department_id)
REFERENCES Department (Department_id),
FOREIGN KEY (Job_id)
REFERENCES Job_Details (Job_id)
);

CREATE TABLE customer (
Account_No int NOT NULL,
First_Name varchar(255) NOT NULL,
City varchar(20) NOT NULL,
Branch_code int NOT NULL,
Employee_id int NOT NULL,
Phone_no varchar(255) NOT NULL,
ATM_no int NOT NULL UNIQUE,
Exp_date DATE NOT NULL,
Pin_no int NOT NULL UNIQUE,
PRIMARY KEY (Account_No),
FOREIGN KEY (Branch_code)
REFERENCES bank_details (Branch_code),
FOREIGN KEY (Employee_id)
REFERENCES Employees (Employee_id)
);

INSERT INTO account_type
(Account_no,
Type_Account,
Manager_id,
Department_name,
Opening_Date)
VALUES
-- (12345,'Saving',20,'Account','2003-04-23'),
(67899,'loan',21,Loan,'2004-05-24'),
(10112,'Saving',22,HR,'2006-01-04'),
(13145,'loan',23,Admin,'2003-04-23'),
(15167,'current',24,Sales,'2004-05-24'),
(18190,'business',25,Security,'2006-01-04'),
(20210,'loan',26,Account,'2003-04-23'),
(22230,'Saving',27,Loan,'2004-05-24'),
(24250,loan,28,HR,'2006-01-04'),
(26270,current,29,Admin,'2003-04-23'),
(28290,business,30,Sales,'2004-05-24'),
(30310,current,31,Security,'2006-01-04'),
(32330,Saving,32,Account,'2003-04-23'),
(34350,loan,33,Loan,'2004-05-24'),
(36370,current,34,HR,'2006-01-04'),
(38390,current,35,Admin,'2003-04-23'),
(40410,business,36,Sales,'2004-05-24'),
(42430,loan,37,Security,'2006-01-04'),
(44450,Saving,38,Account,'2003-04-23'),
(46470,loan,39,Loan,'2004-05-24'),
(48490,Saving,40,HR,'2006-01-04');

select * from account_type


