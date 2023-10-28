
















































CREATE TYPE public.reason AS ENUM (
    'LOW PAY',
    'Environment Satisfaction',
    'LONG WORKING HOURS',
    'LACK OF VISIBILTY',
    'LACK OF SKILL DEVELOPMENT',
    'PERSONAL ISSUES'
);


ALTER TYPE public.reason OWNER TO postgres;










CREATE TABLE public.attrition (
    attrition character varying(3),
    attrition_reason public.reason,
    deptid integer,
    empid integer,
    yearssincelastpromotion integer,
    yearswithcurrentmanager integer
);


ALTER TABLE public.attrition OWNER TO postgres;






CREATE TABLE public.compensation (
    payrollid integer NOT NULL,
    dailyrate integer,
    hourlyrate integer,
    monthlyincome integer,
    monthlyrate integer,
    overtime character varying(3),
    percentsalaryhike integer,
    stockoptionlevel integer
);


ALTER TABLE public.compensation OWNER TO postgres;






CREATE TABLE public.department (
    deptid integer NOT NULL,
    deptname character varying(10),
    deptempcount integer
);


ALTER TABLE public.department OWNER TO postgres;






CREATE TABLE public.empworktime (
    empid integer,
    standardhrs integer,
    totalworkingyears integer,
    yearsatcompany integer,
    yearsincurrentrole integer,
    traveltime integer,
    businesstraveltime integer
);


ALTER TABLE public.empworktime OWNER TO postgres;






CREATE TABLE public.manager (
    managerid integer,
    attritioncount integer,
    empcount integer
);


ALTER TABLE public.manager OWNER TO postgres;






CREATE TABLE public.personaldetails (
    empid integer NOT NULL,
    age integer,
    educationfield character varying(100),
    gender character varying(6),
    maritalstatus character varying(9),
    deptid integer,
    payrollid integer,
    managerid integer,
    performancerating integer,
    numcompaniesworked integer,
    currentrole character varying(10)
);


ALTER TABLE public.personaldetails OWNER TO postgres;







INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('YES', 'LOW PAY', 1, 1, 1, 2);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('NO', NULL, 2, 2, 1, 2);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('YES', 'LONG WORKING HOURS', 1, 3, 2, 2);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('YES', 'LONG WORKING HOURS', 1, 4, 3, 2);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('NO', NULL, 1, 5, 3, 4);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('NO', NULL, 1, 6, 4, 5);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('YES', 'LACK OF SKILL DEVELOPMENT', 3, 7, 3, 2);
INSERT INTO public.attrition (attrition, attrition_reason, deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ('YES', 'LONG WORKING HOURS', 3, 8, 3, 2);








INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (1, 100, 12, 1500, 2000, 'Yes', 10, 0);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (2, 101, 13, 1502, 2002, 'No', 10, 1);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (3, 102, 14, 1504, 2004, 'Yes', 10, 0);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (4, 103, 15, 1506, 2006, 'No', 10, 2);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (5, 104, 16, 1508, 2008, 'Yes', 10, 0);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (6, 105, 17, 1510, 2010, 'No', 10, 1);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (7, 105, 17, 1510, 2010, 'No', 10, 1);
INSERT INTO public.compensation (payrollid, dailyrate, hourlyrate, monthlyincome, monthlyrate, overtime, percentsalaryhike, stockoptionlevel) VALUES (8, 105, 17, 1510, 2010, 'No', 10, 1);








INSERT INTO public.department (deptid, deptname, deptempcount) VALUES (1, 'Infra', 4);
INSERT INTO public.department (deptid, deptname, deptempcount) VALUES (2, 'Media', 5);
INSERT INTO public.department (deptid, deptname, deptempcount) VALUES (3, 'Tech', 7);
INSERT INTO public.department (deptid, deptname, deptempcount) VALUES (4, 'Finance', 8);
INSERT INTO public.department (deptid, deptname, deptempcount) VALUES (5, 'HR', 9);








INSERT INTO public.empworktime (empid, standardhrs, totalworkingyears, yearsatcompany, yearsincurrentrole, traveltime, businesstraveltime) VALUES (1, 10, 100, 1, 1, 1, 4);
INSERT INTO public.empworktime (empid, standardhrs, totalworkingyears, yearsatcompany, yearsincurrentrole, traveltime, businesstraveltime) VALUES (2, 12, 200, 2, 2, 2, 4);
INSERT INTO public.empworktime (empid, standardhrs, totalworkingyears, yearsatcompany, yearsincurrentrole, traveltime, businesstraveltime) VALUES (3, 10, 100, 1, 1, 2, 5);








INSERT INTO public.manager (managerid, attritioncount, empcount) VALUES (2, 1, 2);
INSERT INTO public.manager (managerid, attritioncount, empcount) VALUES (4, 2, 3);
INSERT INTO public.manager (managerid, attritioncount, empcount) VALUES (6, 1, 1);








INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (1, 34, 'Graduate', 'F', 'Married', 1, 1, 2, 4, 3, 'SDE2');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (2, 50, 'Graduate', 'F', 'Single', 1, 2, 3, 2, 4, 'Director');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (3, 40, 'Undergraduate', 'F', 'Married', 1, 3, 4, 2, 4, 'VP');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (4, 35, 'Graduate', 'F', 'Married', 2, 4, 4, 4, 3, 'SDE1');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (5, 25, 'Graduate', 'M', 'Single', 1, 5, 6, 4, 3, 'SDE1');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (6, 22, 'Graduate', 'M', 'Single', 3, 6, 4, 4, 1, 'SDE2');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (7, 23, 'Graduate', 'M', 'Single', 3, 7, 4, 4, 1, 'SDE2');
INSERT INTO public.personaldetails (empid, age, educationfield, gender, maritalstatus, deptid, payrollid, managerid, performancerating, numcompaniesworked, currentrole) VALUES (8, 24, 'Graduate', 'M', 'Single', 3, 8, 4, 4, 1, 'SDE2');







ALTER TABLE ONLY public.compensation
    ADD CONSTRAINT compensation_pkey PRIMARY KEY (payrollid);







ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (deptid);







ALTER TABLE ONLY public.personaldetails
    ADD CONSTRAINT personaldetails_pkey PRIMARY KEY (empid);







ALTER TABLE ONLY public.attrition
    ADD CONSTRAINT attrition_deptid_fkey FOREIGN KEY (deptid) REFERENCES public.department(deptid);







ALTER TABLE ONLY public.attrition
    ADD CONSTRAINT attrition_empid_fkey FOREIGN KEY (empid) REFERENCES public.personaldetails(empid);







ALTER TABLE ONLY public.empworktime
    ADD CONSTRAINT empworktime_empid_fkey FOREIGN KEY (empid) REFERENCES public.personaldetails(empid);







ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.personaldetails(empid);







ALTER TABLE ONLY public.personaldetails
    ADD CONSTRAINT personaldetails_deptid_fkey FOREIGN KEY (deptid) REFERENCES public.department(deptid);







ALTER TABLE ONLY public.personaldetails
    ADD CONSTRAINT personaldetails_payrollid_fkey FOREIGN KEY (payrollid) REFERENCES public.compensation(payrollid);








