# Pewlett_Hackard_Analysis
# **Employee Database with SQL** 
	
## **Overview of the analysis** 
* Pewlett Hackard is a large company hosting several thousands of employees. Many of its employees will begin to retire soon. PH is offering retirement package to those who meet the criteria and would also like to know which positions need to be filled. Bobby, an HR analyst his task is to perform employee research and answer the following questions 
	* Who will be retiring in the next few years and how many positions will PH need to fill
* We will help Bobby build an employee database with SQL by applying our data modelling, engineering and analysis skills. The analysis will help future proof PH by generating a list of all employees eligible for retirement package.

### Purpose 
* determine the number of retiring employees by title and identify employees who are eligible to participate in a mentorship program. Also, to create a summary report based on the analysis of employee database. The Analysis helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.


## **Results** 

* Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed 

![CurrentEmployees](./Data/Current_Employees.png)

* The total number of current employees working in Pewlett Hackard is `240124` employees and the total number of employees retiring by title is `72458`. The total of employees retiring is in the unique_titles.csv file. 30 percent of current employees will be retiring soon based on the filter used. 

* Employees retiring by title 

![Employees retiring title](./Data/retiring_titles.png)

* From the image above we can see the total number of retiring employees by title. 25916 are Senior Engineers and “36%" of total retiring, 24926 are Senior Staff and "34%" of total retiring, 9285 are Engineers and "13%" of total retiring, 7636 are Staff and "11%" of total retiring, 3603 are Technique Leaders and "10%" of total retiring, 1090 are Assistant Engineers and "2%" of total retiring and 2 are Managers. 
	 
* Employees retiring soon from each department  

![Employees retiring Dept](./Data/retiring_titles.png) 

* The departments with the highest number of potential employees to retire soon are 
		* Development with total of 18368 and "25%", Production with total of 16172 and "22%", and Sales with total of 11336 and "16%". 
		* Followed by Customer Service with total of 5320 and "7%", Research with total of 4738 and "7%", Quality Management with total of 4448 and "6%", 
		* Marketing with total of 4392 and "6%", Human Resources with total of 3925 and "5%", Finance with total of 3759 and "5%". 

* Employees Eligible for the Mentorship Program

![Employees mentorship eligibilty](./Data/mentorship_eligibilty.png)

* The total number of employees who qualify for Mentorship/training program are 1549 and details are in mentorship_eligibilty.csv file.
	
	
## **Summary** 

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
	* 72458 roles will need to be filled as the as the "silver tsunami" begins to impact. 
	* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
	* there are 1549 employees who qualify for the Mentorship program to mentor next generation. From the image below number might low but there are qualified senior employees in the mentorship program.

* The two queries are
* -- create a mentorship-eligibility table by title 
`SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	de.dept_no,
	t.title
INTO mentorship_title
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;`

* -- Mentorship count by title 

`SELECT COUNT(med.emp_no) AS mentor_count,	
	med.title	
INTO mentorship_title_count
FROM mentorship_title AS med
GROUP BY med.title
ORDER BY mentor_count DESC;`

* Employees Eligible for the Mentorship Program by title 

![Employees mentorship eligibiltytitle](./Data/mentorship_title_count.png)

* from the above image the employees who qualify for mentorship program by title are 
	* 476 are Senior Staff, 256 are Senior Engineers, 433 are Engineers  
	* 248 are Staff, 77 are Technique Leaders and 59 are Assistant Engineers 

* Based on the Analysis, there will be 72458 vacant positions soon as employees begin to retire and there are 1549 employees who qualify for the mentorship program. It looks like the number of employees that will be mentoring are low compared to the positions that needs to filled. Pewlett Hackard should start confirming the employees that qualify for mentorship program and looking closely into the position that need to be filled so that they are better prepared when "silver tsunami" begins to make an impact.

