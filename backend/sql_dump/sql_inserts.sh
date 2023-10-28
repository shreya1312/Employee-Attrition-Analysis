#!/bin/bash

rm -f insertqueries.sql;

echo "DELETE FROM attrition;" >>insertqueries.sql
echo "DELETE FROM empworktime;" >>insertqueries.sql
echo "DELETE FROM manager;" >>insertqueries.sql
echo "DELETE FROM personaldetails;" >>insertqueries.sql
echo "DELETE FROM payroll;" >>insertqueries.sql
echo "DELETE FROM compensation;" >>insertqueries.sql
echo "DELETE FROM department;" >>insertqueries.sql

names=($(shuf -n4000  /usr/share/dict/words))

echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(1,13,286);" >>insertqueries.sql
echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(2,14,308);" >>insertqueries.sql
echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(3,15,330);" >>insertqueries.sql
echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(4,20,440);" >>insertqueries.sql
echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(5,16,352);" >>insertqueries.sql
echo "INSERT INTO compensation (RoleID, HourlyRate, monthlyrate) VALUES(6,10,220);" >>insertqueries.sql

for i in {1..2000};do 
num=$(expr 1 + $RANDOM % 30) && 
b=$(shuf -n1 yorn) && 
r="" && 
c="" && 
active=1 &&
if [[ $b == "'YES'" ]]
then
        c=" attrition_reason,";
	r=" $(shuf -n1 areason),";
        active=0;
fi &&

drate=$(expr 1 + $RANDOM % 1000) &&
hrate=$(($drate/12)) &&
mrate=$(($drate*20)) &&
mincome=$(($mrate - $(expr 1 + $RANDOM % 10))) &&
overtime=$(shuf -n1 yorn) &&
phike=$(expr 1 + $RANDOM % 100) &&
stockoptionlevel=$(expr 1 + $RANDOM % 3) &&

stdhrs=$(expr 1 + $RANDOM % 20) &&
twy=$(expr 1 + $RANDOM % 30) &&
yac=$(expr 1 + $RANDOM % $twy) &&
yar=$(expr 1 + $RANDOM % $yac) &&
tt=$(expr 1 + $RANDOM % 20) &&
btt=$(expr 1 + $RANDOM % $tt) &&

if [[ $i -lt 201 ]]
then
m=""
mid=""
ecount=$(expr 1 + $RANDOM % 10);
crole="'Manager'";
else
m=" managerid,";
mid=" $(expr 1 + $RANDOM % 200),";
crole=$(shuf -n1 crole);
fi &&
rID=$(expr 1 + $RANDOM % 6) &&
rName=$(sed ''$rID'q;d' crole| tail -1) &&
echo "INSERT INTO department (deptid, deptname, deptempcount) VALUES ($i, '${names[$i]}', $(expr 1 + $RANDOM % 10));" >> insertqueries.sql &&

echo "INSERT INTO payroll (payrollid, Overtime, PercentSalaryHike, StockOptionLevel, RoleID, RoleName) VALUES ($i,  $(expr 1 + $RANDOM % 100), $(expr 1 + $RANDOM % 100),$(expr 1 + $RANDOM % 5), $rID, $rName);" >>insertqueries.sql &&

echo "INSERT INTO personaldetails(empid, empname, age, educationfield, gender, maritalstatus, deptid, payrollid,$m performancerating, numcompaniesworked, active) VALUES($i, '${names[$((4000-$i))]}', $(expr 1 + $RANDOM % 60), $(shuf -n1 efield), $(shuf -n1 genders), $(shuf -n1 mstatus), $(expr 1 + $RANDOM % $i),$mid $i, $(expr 1 + $RANDOM % 5), $(expr 1 + $RANDOM % 10), $active);" >> insertqueries.sql &&

if [[ $i -lt 201 ]]
then
echo "INSERT INTO manager (managerid, attritioncount, empcount) VALUES($i, $(expr 1 + $RANDOM % $ecount), $ecount);" >>insertqueries.sql;
fi

echo "INSERT INTO attrition (attrition,$c deptid, empid, yearssincelastpromotion, yearswithcurrentmanager) VALUES ($b,$r $(expr 1 + $RANDOM % $i), $i,  $(expr 1 + $RANDOM % $num),  $(expr 1 + $RANDOM % $num));">>insertqueries.sql &&

echo "INSERT INTO empworktime (empid, standardhrs, totalworkingyears, yearsatcompany, yearsincurrentrole, traveltime, businesstraveltime) VALUES($i, $stdhrs, $twy, $yac, $yar, $tt, $btt);" >> insertqueries.sql;

done;
