EPI5143 Winter 2020 Quiz 6.
Due Tuesday March 31st at 11:59PM via Github (link will be provided)

Using the Nencounter table from the class data:;

libname classdat '/folders/myfolders/database/class_data';

libname ex '/folders/myfolders/database/EPI5143 work folder/data';

data ex.nencounter;
set classdat.nencounter;
if year(datepart(EncStartDtm)) in:(2003);
if EncVisitTypeCd='INPT' then inptencounter=1; 
else inptencounter=0; 
if EncVisitTypeCd='EMERG' then emergencounter=1; 
else emergencounter=0;
run; 
Proc means data=ex.nencounter noprint;
class EncPatWID;
types EncPatWID;
var inptencounter emergencounter;
Output out=ex.count max(inptencounter)=inptencounter n(inptencounter)=count1 sum(inptencounter)=inptencounter_count
max(emergencounter)=emergencounter n(emergencounter)=count2 sum(emergencounter)=emergencounter_count;
run;
a) How many patients had at least 1 inpatient encounter that started in 2003?; 
*1074 patients;

proc freq data=ex.count order=freq; 
table inptencounter; 
run; 


b) How many patients had at least 1 emergency room encounter that started in 2003?;
*1978 patients;

proc freq data=ex.count order=freq; 
table emergencounter; 
run;

c) How many patients had at least 1 visit of either type (inpatient or emergency room encounter) that started in 2003?;
*2891 patients;

proc freq data=ex.count order=freq; 
table inptencounter*emergencounter; 
run; 

d) In patients from c) who had at least 1 visit of either type, create a variable that counts the total number encounters 
(of either type)-for example, a patient with one inpatient encounter and one emergency room encounter 
would have a total encounter count of 2. 
Generate a frequency table of total encounter number for this data set, and paste the (text) table into your assignment- 
use the SAS tip from class to make the table output text-friendly
ie:;
data ex.countd; 
set ex.count; 
totcount=inptencounter_count+emergencounter_count; 
run; 
options formchar="|----|+|---+=|-/\<>*";
proc freq data=ex.countd order=freq; 
table totcount; 
run; 


Answers:
a) How many patients had at least 1 inpatient encounter that started in 2003?; 
*1074 patients;
b) How many patients had at least 1 emergency room encounter that started in 2003?;
*1978 patients;
c) How many patients had at least 1 visit of either type (inpatient or emergency room encounter) that started in 2003?;
*2891 patients;
d)Generate a frequency table of total encounter number:;
*                                                       The FREQ Procedure


                                                                        Cumulative    Cumulative
                                   totcount    Frequency     Percent     Frequency      Percent
                                   -------------------------------------------------------------
                                          1        2556       88.41          2556        88.41  
                                          2         270        9.34          2826        97.75  
                                          3          45        1.56          2871        99.31  
                                          4          14        0.48          2885        99.79  
                                          5           3        0.10          2888        99.90  
                                          6           1        0.03          2889        99.93  
                                          7           1        0.03          2890        99.97  
                                         12           1        0.03          2891       100.00  

 
 
