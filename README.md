## Prolog Assignment
#### CS/IS F214 Logic in Computer Science

**Team Members**
- LOVISH ARORA: 2014B3A7749P
- HARSHVARDHAN MAHESHWARI: 2014B3A7375P

----------

#### Question 1
- For simplifying the required expression, the *predicate* `prolog_1/2` is used and the expression is given as the first argument to it, while as the second argument a variable is given which will hold the simplified answer.
- While feeding the expression, all the variables in it should be given in small and **NOT** capital. For eg: `prolog_1((x*(y/y)-x)*x, A).` should be the query which will return `A = 0`.
- The multiplication operator `*` should be written explicitly while feeding the expression. Also, the user should enter `-1*x` if he needs to evaluate `-x`.
- The predicate `isequal/2` is used to compare two expressions for equality. For eg: `isequal(2*x/x, x+2-x).` will return true.
- Ignore the warnings that are thrown on running the code.
- Few commented sections in the code represent our previous attempts of accomplishing certain functionality.

#### I/O Samples

| Input                                   | Output            |
| :---                                    | :---              |
| `prolog_1(x*x*x*4*x*3+y*2-2*y,A).`      | `12*x^4.`         |
| `prolog_1((x+2)*(x+2+y/y-x)/(x+2),Y).`  | `3.`              |
| `prolog_1(-1*a+b*3+2*a,X).`             | `a+3*b.`          |
| `isequal(3*x^2,(x^2)*3).`               | `true.`           |

----------

#### Question 2
- In our code for this problem, we are considering sample database for the first 3 years courses for 3 branches of single degree:
  `A7`, `A3` and `A1`. Also, the database includes the first 3 years courses for a dual degree combination: `B3A7`.
- The code interacts with the user through `I/O`.
- Initial few prompts ask the student basic questions like: 
  - Dues cleared or not?
  - Is he debarred from registering? etc. \
Answer by writing `Yes` or `No`.
- When asked for the discipline, the student should enter his branch code like: 
  - `A7` for Computer Science
  - `A3` for EEE
  - `A1` for Chemical \
  In case he is a dual degree student, he should enter the codes for both his branches together, like:
  - `B3A7` for Economics and Computer Science
- The transcript of the student is taken as input in the form of a list from the student itself. Instead of course name, the course code should be given like `CS F214` for `Logic in Computer Science`[^1].
[^1]: In the input list, also include an empty list as the last element.
- The prompt also asks for the courses a student desires to register for in the current semester. Again, the codes for courses desired should be given as input in the form of list.
- When prompted to enter the code corresponding to your query, use the following index:
  - Query code: `A` - Is there a conflict in the list of courses scheduled for a student? i.e. Is there a conflict in the courses desired and pre-requisites?
  - Query code: `B` - Is a student eligible for doing PS-1 course?
  - Query code: `C` - Is a first degree student eligible for doing a higher degree course?
  - Query code: `D` - Is a dual degree student eligible for doing a core course on his second degree?
- The code will work even if you want to post queries for any other discipline, provided that branch's courses are written in the database.
- In database, for the predicate `prereq/2`, the first parameter is a particular course code and the second parameter is the list of its prerequisite courses.
- Ignore the warnings that are thrown on running the code.
- Few commented sections in the code represent our previous attempts of accomplishing certain functionality.

#### I/O Samples


----------
