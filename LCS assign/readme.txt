Team members:
LOVISH ARORA: 2014B3A7749P
HARSHVARDHAN MAHESHWARI: 2014B3A7375P

----------------------Question 1----------------------
1. For simplifying the required expression, the predicate 'prolog_1/2' is used and the expression is given 
	as the first argument to it, while as the second argument a variable is given which will 
	hold the simplified answer.
2. While feeding the expression, all the variables in it should be given in small and NOT capital. For eg:
   prolog_1((x*(y/y)-x)*x,A). should be the query which will return A=0.
3. The multiplication operator '*' should be written explicitly while feeding the expression. Also, the user should 
   enter -1*x if he needs to evaluate -x.
4. The predicate 'isequal/2' is used to compare two expressions for equality. For eg: isequal(2*x/x,x+2-x).
   will return true.
5. Ignore the warnings that are thrown on running the code.
6. Few commented sections in the code represent our previous attempts of accomplishing certain functionality.

I/O Samples:

Input: prolog_1(x*x*x*4*x*3+y*2-2*y,A).
Output: 12*x^4.

Input: prolog_1((x+2)*(x+2+y/y-x)/(x+2),Y).
Output: 3.

Input: prolog_1(-1*a+b*3+2*a,X).
Output: a+3*b.

Input: isequal(3*x^2,(x^2)*3).
Output: true.

---------------------END of Q1.-----------------------

----------------------Question 2----------------------
1.	In our code for this problem, we are considering sample database for the 
	first 3 years courses for 3 branches of single degree:
	'A7', 'A3' and 'A1'. Also, the database includes the first 3 years courses 
	for a dual degree combination: 'B3A7'.
2.	The code interacts with the user through I/O.
3. 	Initial few prompts ask the student basic questions like: Dues cleared or not?, Is he debarred from registering? etc.
	Answer by writing 'Yes' or 'No'.
4.	When asked for the dicipline, the student should enter his branch code like: 'A7' for Computer Science, 'A3' for EEE,
	'A1'for Chemical. In case he is a dual degree student, he should enter the codes for both his branches together, like
	a student of Economics and Computer Science should enter 'B3A7'.
5.	The transcript of the student is taken as input in the form of a list from the student itself. Instead of course name,
	the course code should be given like 'CS F214' for 'Logic in Computer Science'. Note: "In the input list, also include an 
	empty list as the last element."
6.	The prompt also asks for the courses a student desires to register for in the current semester. Again, the codes for
	courses desired should be given as input in the form of list.
7.	When prompted to enter the code corresponding to your query, use the following index:
	Query code: 'A' - Is there a conflict in the list of courses scheduled for a student? i.e. Is there a conflict in the
					  courses desired and pre-requisites?
	Query code: 'B' - Is a student eligible for doing PS-1 course?
	Query code: 'C'	- Is a first degree student eligible for doing a higher degree course?
	Query code: 'D'	- Is a dual degree student eligible for doing a core course on his second degree?
8. 	The code will work even if you want to post queries for any other discipline, provided that branch's courses are written
	in the database.
9.	In database, for the predicate prereq/2, the first parameter is a particular course code and the second parameter is the list of its
	prerequisite courses.
10. Ignore the warnings that are thrown on running the code.
11. Few commented sections in the code represent our previous attempts of accomplishing certain functionality.

I/O Samples:

-------------------------------------------------------------------------------------------------
SAMPLE 1:

Input: prolog_2.
Output: Enter the student's name:
Input: 'Harsh Vardhan'.
Output: Are student's dues cleared? Answer'Yes' or 'No'
Input: 'Yes'.
Output: Is student's gradesheet withheld? Answer'Yes' or 'No'
Input: 'No'.
Output: Is student's report incomplete? Answer'Yes' or 'No'
Input: 'No'.
Output: Is student debarred from the semester? Answer'Yes' or 'No'
Input: 'No'.
Output: You are eligible to register
		Enter 'Single' for single degree and 'Dual' for dual degree student.
Input:	'Single'.
Output: Do you want to pursue higher degree course? Answer'Yes' or 'No'
Input:	'No'.
Output: Enter the discipline code for student
Input:	'A7'.
Output: Enter the course codes of courses done till now in the form of list.
Input:  ['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111'
		,'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','CS F214','CS F222','CS F213','CS F215','ECON F211'
		,'CS F211','CS F241','CS F212', []].
Output:	Enter the course codes of courses you want to register in the form of list.
Input: ['CS F351', 'CS F372', 'CS F301'].
Output: Enter code corresponding to your Query:-
Input:	'B'.
Output: Student is eligible for doing PS1.
		true 
----------------------------------------------------------------------------------------------------		

SAMPLE 2:

Input: prolog_2.
Output: Enter the student's name:
Input: 'Harsh Vardhan'.
Output: Are student's dues cleared? Answer'Yes' or 'No'
Input: 'Yes'.
Output: Is student's gradesheet withheld? Answer'Yes' or 'No'
Input: 'No'.
Output: Is student's report incomplete? Answer'Yes' or 'No'
Input: 'No'.
Output: Is student debarred from the semester? Answer'Yes' or 'No'
Input: 'No'.
Output: You are eligible to register
		Enter 'Single' for single degree and 'Dual' for dual degree student.
Input:	'Dual'.
Output: Do you want to pursue higher degree course? Answer'Yes' or 'No'
Input:	'Yes'.
Output:	You want to pursue the higher degree course in first discipline or second? Enter 'First' or 'Second' respectively.
Input:  'First'.
Output: Enter the discipline code for student
Input:	'B3A7'.
Output: Enter the course codes of courses done till now in the form of list.
Input:  ['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
		'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','ECON F211','ECON F212','ECON F213','ECON F214',
		'MGTS F211','ECON F241','ECON F242','ECON F243','ECON F244',[]].
Output:	Enter the course codes of courses you want to register in the form of list.
Input: ['CS F351', 'CS F372', 'CS F301'].
Output: Enter code corresponding to your Query:-
Input:	'C'.
Output: Student is eligible for doing a higher degree course in his/her first discipline.
		true 		

---------------------END of Q2.-----------------------		