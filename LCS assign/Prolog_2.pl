
prolog_2 :-nl,
  write('Enter the student\'s name: '),nl,read(Student_Name),
  write('Are student\'s dues cleared? Answer\'Yes\' or \'No\''),nl,read(Dues_Cleared),
  write('Is student\'s gradesheet withheld? Answer\'Yes\' or \'No\''),nl,read(Gs_Withheld),
  write('Is student\'s report incomplete? Answer\'Yes\' or \'No\''),nl,read(Rep_Incom),
  write('Is student debarred from the semester? Answer\'Yes\' or \'No\''),nl,read(Debarred),
  abc(Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,Z),write(Z),nl,
  write('Enter \'Single\' for single degree and \'Dual\' for dual degree student.'),nl,read(Read_Degree),
  (write('Do you want to pursue higher degree course? Answer\'Yes\' or \'No\''),nl,read(Answer)->((Read_Degree == 'Dual',Answer =='Yes')->
    write('You want to pursue the higher degree course in first discipline or second? Enter \'First\' or \'Second\' respectively.'),
    nl,read(Higher),  write('Enter the discipline code for student.'),nl,read(Branch_Code);  write('Enter the discipline code for student.'),nl,read(Branch_Code))),
  /*write('Enter the discipline code for student.'),nl,read(Branch_Code),*/
  /*write('Enter the last completed semester number.'),nl,read(Sem),*/
  write('Enter the course codes of courses done till now in the form of list.'),nl,read(X),append(X,[],Courses_Done),
  write('Enter the course codes of courses you want to register in the form of list.'),nl,read(Y),append(Y,[],Courses_Want),
  write('Enter code corresponding to your Query:-'),nl,read(Query),
  ((Read_Degree =='Dual',Answer =='Yes')->(Higher == 'First'->main_2(Query,Read_Degree,Branch_Code,Courses_Done,Courses_Want,Higher,P),write(P),nl;
    main_2(Query,Read_Degree,Branch_Code,Courses_Done,Courses_Want,Higher,P),write(P),nl);main(Query,Read_Degree,Branch_Code,Courses_Done,Courses_Want,P),write(P),nl).

/*details(Student_Name,Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,Read_Degree,Branch_Code,Sem),*/
/*transcript(Courses_Done),*/
/*registeration(Courses_Want),*//*write(Student_Name),*/

dues_cleared('Yes').
gs_withheld('No').
rep_incom('No').
debarred('No').
/*eligible('You are eligible to register').*/

dues_not_cleared('No').
gs_not_withheld('Yes').
rep_not_incom('Yes').
not_debarred('Yes').
/*not_eligible('You are not eligible to register').*/

/*details(Student_Name,Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,Read_Degree,Branch_Code,Sem).*/
/*transcript(Courses_Done).*/
/*registeration(Courses_Want).*/

/*abc(Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,X):-(dues_cleared(Dues_Cleared),gs_withheld(Gs_Withheld),rep_incom(Rep_Incom),debarred(Debarred),
eligible(X));((dues_not_cleared(Dues_Cleared);
gs_not_withheld(Gs_Withheld);rep_not_incom(Rep_Incom);not_debarred(Debarred)),not_eligible(X)).*/

abc(Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,'You are eligible to register'):-dues_cleared(Dues_Cleared),gs_withheld(Gs_Withheld),rep_incom(Rep_Incom),debarred(Debarred).
abc(Dues_Cleared,Gs_Withheld,Rep_Incom,Debarred,'You are not eligible to register'):-dues_not_cleared(Dues_Cleared);gs_not_withheld(Gs_Withheld);rep_not_incom(Rep_Incom);not_debarred(Debarred).


member(X,[X|T]).
member(X,[H|T]):-member(X,T),!.
/*----------------------    Query A ,D---------------------------------------------*/

main('A',Read_Degree,Branch_Code,Courses_Done,Courses_Want,'No conflict in pre-requisites and desired courses.'):- check1(Courses_Want,Courses_Done).
main('A',Read_Degree,Branch_Code,Courses_Done,Courses_Want,'Conflict in pre-requisites and desired courses.'):- \+ check1(Courses_Want,Courses_Done).

main('D',Read_Degree,Branch_Code,Courses_Done,Courses_Want,'No conflict in pre-requisites and desired courses.'):- check1(Courses_Want,Courses_Done).
main('D',Read_Degree,Branch_Code,Courses_Done,Courses_Want,'Conflict in pre-requisites and desired courses.'):- \+ check1(Courses_Want,Courses_Done).

/*check1(Courses_Done,Courses_Want):- check2(Courses_Want,Courses_Done).*/
check1([],Courses_Done).
check1([H|T],Courses_Done):-prereq(H,Y),check3(Y,Courses_Done),check1(T,Courses_Done).
/*check3([A,B,C|T],Courses_Done):-member([A],Courses_Done),member([B],Courses_Done),member([C] ,Courses_Done).*/
check3([A|[]],Courses_Done):-member(A,Courses_Done).
check3([A,B|[]],Courses_Done):-member(A,Courses_Done),member(B,Courses_Done).
check3([A,B,C|[]],Courses_Done):-member(A,Courses_Done),member(B,Courses_Done),member(C,Courses_Done).
check3([A,B,C,D|[]],Courses_Done):-member(A,Courses_Done),member(B,Courses_Done),member(C,Courses_Done),member(D,Courses_Done).
/*----------------------    Query A ends---------------------------------------------*/

/*----------------------    Query B ---------------------------------------------*/
main('B',Read_Degree,'A7',Courses_Done,Courses_Want,'Student is eligible for doing PS1.'):-branch('A7'),a7ps(Y),check4(Y,Courses_Done).
main('B',Read_Degree,'A7',Courses_Done,Courses_Want,'Student is not eligible for doing PS1.'):-branch('A7'),a7ps(Y),\+ check4(Y,Courses_Done).

main('B',Read_Degree,'A3',Courses_Done,Courses_Want,'Student is eligible for doing PS1.'):-branch('A3'),a3ps(Y),check4(Y,Courses_Done).
main('B',Read_Degree,'A3',Courses_Done,Courses_Want,'Student is not eligible for doing PS1.'):-branch('A3'),a3ps(Y),\+ check4(Y,Courses_Done).

main('B',Read_Degree,'A1',Courses_Done,Courses_Want,'Student is eligible for doing PS1.'):-branch('A1'),a1ps(Y),check4(Y,Courses_Done).
main('B',Read_Degree,'A1',Courses_Done,Courses_Want,'Student is not eligible for doing PS1.'):-branch('A1'),a1ps(Y),\+ check4(Y,Courses_Done).

main('B',Read_Degree,'B3A7',Courses_Done,Courses_Want,'Student is eligible for doing PS1.'):-branch('B3A7'),b3ps(Y),check4(Y,Courses_Done).
main('B',Read_Degree,'B3A7',Courses_Done,Courses_Want,'Student is not eligible for doing PS1.'):-branch('B3A7'),b3ps(Y),\+ check4(Y,Courses_Done).

check4([],Courses_Done).
check4([H|T],Courses_Done):-check5(H,Courses_Done),check4(T,Courses_Done).
check5(H,Courses_Done):-member(H,Courses_Done).
/*----------------------    Query B ends---------------------------------------------*/

/*----------------------    Query C ---------------------------------------------*/
main('C','Single','A7',Courses_Done,Courses_Want,'Student is eligible for doing a higher degree course in his/her discipline.'):-branch('A7'),a7hd(Y),check4(Y,Courses_Done).
main('C','Single','A7',Courses_Done,Courses_Want,'Student is not eligible for doing a higher degree course in his/her discipline.'):-branch('A7'),a7hd(Y),\+ check4(Y,Courses_Done).

main('C','Single','A3',Courses_Done,Courses_Want,'Student is eligible for doing a higher degree course in his/her discipline.'):-branch('A3'),a3hd(Y),check4(Y,Courses_Done).
main('C','Single','A3',Courses_Done,Courses_Want,'Student is not eligible for doing a higher degree course in his/her discipline.'):-branch('A3'),a3hd(Y),\+ check4(Y,Courses_Done).

main('C','Single','A1',Courses_Done,Courses_Want,'Student is eligible for doing a higher degree course in his/her discipline.'):-branch('A1'),a1hd(Y),check4(Y,Courses_Done).
main('C','Single','A1',Courses_Done,Courses_Want,'Student is not eligible for doing a higher degree course in his/her discipline.'):-branch('A1'),a1hd(Y),\+ check4(Y,Courses_Done).

main_2('C','Dual','B3A7',Courses_Done,Courses_Want,'First','Student is eligible for doing a higher degree course in his/her first discipline.'):-branch('B3A7'),b3a7hd1(Y),check4(Y,Courses_Done).
main_2('C','Dual','B3A7',Courses_Done,Courses_Want,'First','Student is not eligible for doing a higher degree course in his/her first discipline.'):-branch('B3A7'),b3a7hd1(Y),\+ check4(Y,Courses_Done).

main_2('C','Dual','B3A7',Courses_Done,Courses_Want,'Second','Student is eligible for doing a higher degree course in his/her second discipline.'):-branch('B3A7'),b3a7hd2(Y),check4(Y,Courses_Done).
main_2('C','Dual','B3A7',Courses_Done,Courses_Want,'Second','Student is not eligible for doing a higher degree course in his/her second discipline.'):-branch('B3A7'),b3a7hd2(Y),\+ check4(Y,Courses_Done).

check4([],Courses_Done).
check4([H|T],Courses_Done):-member(H,Courses_Done),check4(T,Courses_Done).
/*----------------------    Query C ends---------------------------------------------*/

branch('A7').
branch('A1').
branch('A3').
branch('B3A7').

/*------------------------------------DataBase--------------------------------------------*/

/*--------------------  First Year ----------------*/
/*----------First Sem -------------------*/
/* In the predicate prereq/2, the first parameter is a particular course code and the second parameter is the list of its
prerequisite courses.*/

prereq('BIO F110',[]).
prereq('BIO F111',[]).
prereq('CHEM F110',[]).
prereq('CHEM F111',[]).
prereq('MATH F111',[]).
prereq('PHY F110',[]).
prereq('PHY F111',[]).
prereq('BITS F110',[]).
/* -------------------------Second Sem ---------------*/
prereq('MATH F112',[]).
prereq('ME F110',[]).
prereq('CS F111',[]).
prereq('EEE F111',[]).
prereq('BITS F112',[]).
prereq('MATH F113',[]).
prereq('BITS F111',[]).
prereq('CHEM F110',[]).


/*-------------------Second Year,A7 -------------*/
/*---------------------Third Sem ----------------*/
prereq('MATH F211',[]).
prereq('CS F214',[]).
prereq('CS F222',[]).
prereq('CS F213',['CS F111']).
prereq('CS F215',[]).

/*-----------------------Fourth Sem ------------------------*/
prereq('ECON F211',[]).
prereq('CS F211',['CS F222']).
prereq('CS F241',[]).
prereq('CS F212',[]).

a7ps(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111'
,'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','CS F214','CS F222','CS F213','CS F215','ECON F211'
,'CS F211','CS F241','CS F212']). /*predicate including the list of courses covered till the end of 2nd year*/

a7hd(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','CS F214','CS F222','CS F213','CS F215','ECON F211',
'CS F211','CS F241','CS F212']). /*predicate including the list of core courses covered till the end of 2nd year*/

/*----------------Third year, A7-----------------------*/
/* ----------------- Fifth Sem --------------*/
prereq('CS F351',['CS F222','CS F214']).
prereq('CS F372',[]).
prereq('CS F301',['CS F211']).
prereq('CS F342',['CS F241','CS F215']).

/*------------------Sixth Sem ----------------*/
prereq('CS F363',['CS F351','CS F301']).
prereq('CS F364',['CS F211']).
prereq('CS F303',['CS F372']).


/*-------------------Second Year,A3 -------------*/
/*---------------------Third Sem ----------------*/
prereq('MATH F211',[]).
prereq('EEE F211',['EEE F111']).
prereq('EEE F212',[]).
prereq('EEE F214',['EEE F111']).
prereq('EEE F215',[]).

/*-----------------------Fourth Sem ------------------------*/
prereq('ECON F211',[]).
prereq('EEE F241',[]).
prereq('EEE F242',[]).
prereq('EEE F243',[]).
prereq('EEE F244',[]).

a3ps(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','EEE F211','EEE F212','EEE F214','EEE F215','ECON F211',
'EEE F241','EEE F242','EEE F243','EEE F244']). /*predicate including the list of courses covered till the end of 2nd year*/

a3hd(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','EEE F211','EEE F212','EEE F214','EEE F215','ECON F211',
'EEE F241','EEE F242','EEE F243','EEE F244']). /*predicate including the list of core courses covered till the end of 2nd year*/

/*----------------Third year, A3-----------------------*/
/* ----------------- Fifth Sem --------------*/
prereq('EEE F311',['EEE F243']).
prereq('MATH F212',['MATH F111','MATH F112']).
prereq('EEE F313',['EEE F244']).


/*------------------Sixth Sem ----------------*/
prereq('EEE F341',['EEE F244']).
prereq('EEE F342',[]).
prereq('EEE F312',[]).

/*-------------------Second Year,A1 -------------*/
/*---------------------Third Sem ----------------*/
prereq('MATH F211',[]).
prereq('CHE F211',[]).
prereq('CHE F214',['CHEM F111']).
prereq('CHE F213',['BITS F111']).
prereq('CHE F212',[]).

/*-----------------------Fourth Sem ------------------------*/
prereq('ECON F211',[]).
prereq('CHE F241',[]).
prereq('CHE F242',['MATH F211']).
prereq('CHE F243',[]).
prereq('CHE F244',[]).

a1ps(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','CHE F211','CHE F214','CHE F213','CHE F212','ECON F211',
'CHE F241','CHE F242','CHE F243','CHE F244']). /*predicate including the list of courses covered till the end of 2nd year*/

a1hd(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','CHE F211','CHE F214','CHE F213','CHE F212','ECON F211',
'CHE F241','CHE F242','CHE F243','CHE F244']). /*predicate including the list of core courses covered till the end of 2nd year*/

/*----------------Third year, A3-----------------------*/
/* ----------------- Fifth Sem --------------*/
prereq('CHE F312',['CHE F214','CHE F212','CHE F241','CHE F244']).
prereq('CHE F313',['CHE F244']).
prereq('CHE F311',[]).
prereq('CHE F314',[]).


/*------------------Sixth Sem ----------------*/
prereq('CHE F341',['CHE F311','CHE F312','CHE F313']).
prereq('CHE F342',[]).
prereq('CHE F343',['CHE F314','CHE F313']).


/*-------------------Second Year,B3A7 -------------*/
/*---------------------Third Sem ----------------*/
prereq('MATH F211',[]).
prereq('ECON F211',[]).
prereq('ECON F212',[]).
prereq('ECON F213',[]).
prereq('ECON F214',[]).

/*-----------------------Fourth Sem ------------------------*/
prereq('MGTS F211',[]).
prereq('ECON F241',[]).
prereq('ECON F242',['ECON F211']).
prereq('ECON F243',['ECON F211']).
prereq('ECON F244',['ECON F211']).

b3ps(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','ECON F211','ECON F212','ECON F213','ECON F214',
'MGTS F211','ECON F241','ECON F242','ECON F243','ECON F244']). /*predicate including the list of courses covered till the end of 2nd year*/

b3a7hd1(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','ECON F211','ECON F212','ECON F213','ECON F214',
'MGTS F211','ECON F241','ECON F242','ECON F243','ECON F244']). /*predicate including the list of core courses of  first branch covered till the end of 2nd year*/

b3a7hd2(['BIO F110','BIO F111','CHEM F110','CHEM F111','MATH F111','PHY F110','PHY F111','BITS F110','MATH F112','ME F110','CS F111',
'EEE F111','BITS F112','MATH F113','BITS F111','CHEM F110','MATH F211','ECON F211','ECON F212','ECON F213','ECON F214',
'MGTS F211','ECON F241','ECON F242','ECON F243','ECON F244','CS F214','CS F222','CS F213','CS F215',
'CS F211','CS F241','CS F212']). /*predicate including the list of core courses of second branch covered till the end of 3rd year*/

/*----------------Third year, B3A7-----------------------*/
/* ----------------- Fifth Sem --------------*/
prereq('CS F351',['CS F222','CS F214']).
prereq('CS F372',[]).
prereq('CS F301',['CS F211']).
prereq('CS F342',['CS F241','CS F215']).
prereq('ECON F311',['ECON F211']).
prereq('ECON F312',['ECON F211']).
prereq('ECON F313',['ECON F211']).

/*------------------Sixth Sem ----------------*/
prereq('CS F363',['CS F351','CS F301']).
prereq('CS F364',['CS F211']).
prereq('CS F303',['CS F372']).
prereq('ECON F341',['ECON F211']).
prereq('ECON F342',['ECON F241']).
prereq('ECON F343',[]).

/*------------------------------------DataBase ENDS--------------------------------------------*/
