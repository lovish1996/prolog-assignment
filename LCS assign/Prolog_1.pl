/*--------------------------------------------------------------------------------------------
0. This code is for the first problem of the assignment.
1. For simplifying the required expression, the predicate 'prolog_1/2'
   is used and the expression is given as the first argument to it,
   while as the second argument a variable is given which will hold the
   simplified answer.
2. While feeding the expression, all the variables
   in it should be given in small and NOT capital. For eg:
   prolog_1((x*(y/y)-x)*x,A). should be the query which will return A=0.
3. The multiplication operator '*' should be written explicitly while
   feeding the expression.
4. The predicate 'isequal/2' is used to
   compare two expressions for equality. For eg: isequal(2*x/x,x+2-x).
   will return true.
5. Ignore the warnings that are thrown on running the code.
6. Few commented sections in the code represent our previous
   attempts of accomplishing certain functionality.
---------------------------------------------------------------------------------------------*/
prolog_1( X, X ):- atomic(X),!.

prolog_1( X+0, Y ):- prolog_1( X, Y ).
prolog_1( 0+X, Y ):- prolog_1( X, Y ).
prolog_1(X+X, 2*Y):-prolog_1(X,Y),!.
prolog_1( A*B, X ) :- checkit( A ),checkit( B ),X is A*B.

prolog_1( W*X*A, Q ):- (prolog_1( W*X, Y ), prolog_1( A, Z ),( W*X \== Y ; A \== Z), prolog_1( Z*Y, Q ));
		       (prolog_1( W*A, Y ), prolog_1( X, Z ),( W*A \== Y ; X \== Z), prolog_1( Y*Z, Q ));
		       (prolog_1( X*A, Y ), prolog_1( W, Z ),( X*A \== Y ; W \== Z), prolog_1( Z*Y, Q )).

prolog_1( W/X*A, Q ):- (prolog_1( W/X, Y ), prolog_1( A, Z ),( W/X \== Y ; A \== Z), prolog_1( Y*Z, Q ));
		       (prolog_1( W*A, Y ), prolog_1( X, Z ),( W*A \== Y ; X \== Z), prolog_1( Y/Z, Q ));
		       (prolog_1( A/X, Y ), prolog_1( W, Z ),( A/X \== Y ; W \== Z), prolog_1( Z*Y, Q )).

prolog_1( W*X/A, Q ):- (prolog_1( W*X, Y ), prolog_1( A, Z ),( W*X \== Y ; A \== Z), prolog_1( Y/Z, Q ));
		       (prolog_1( W/A, Y ), prolog_1( X, Z ),( W/A \== Y ; X \== Z), prolog_1( Y*Z, Q ));
		       (prolog_1( X/A, Y ), prolog_1( W, Z ),( X/A \== Y ; W \== Z), prolog_1( Y*Z, Q )).

prolog_1( W/X/A, Q ):- (prolog_1( W/X, Y ), prolog_1( A, Z ),( W/X \== Y ; A \== Z), prolog_1( Y/Z, Q ));
		       (prolog_1( W/A, Y ), prolog_1( X, Z ),( W/A \== Y ; X \== Z), prolog_1( Y/Z, Q ));
		       (prolog_1( X*A, Y ), prolog_1( W, Z ),( X*A \== Y ; W \== Z), prolog_1( Z/Y, Q )).

/*prolog_1((X+C)-X,Y):-prolog_1(C,Y),atomic(C),!.
prolog_1((X+C)+X,Y):-prolog_1(2*X+C,Y),atomic(C),!.
prolog_1((X-C)+X,Y):-prolog_1(2*X-C,Y),atomic(C),!.
prolog_1((X-C)-X,Y):-prolog_1((0-C),Y),atomic(C),!.

prolog_1((X+C)-D,Y):-prolog_1(X+(C-D),Y),atomic(C),atomic(D),!.
prolog_1((X+C)+D,Y):-prolog_1(X+(C+D),Y),atomic(C),atomic(D),!.
prolog_1((X-C)+D,Y):-prolog_1(X+(D-C),Y),atomic(C),atomic(D),!.
prolog_1((X-C)-D,Y):-prolog_1(X-(C+D),Y),atomic(C),atomic(D),!.*/
prolog_1(C*(D*X^N),Y):-number(C),number(D),prolog_1((C*D)*(X^N),Y),!.

prolog_1(C*X-B*X, Y):-prolog_1(C*X+(-1*B)*X,Y), number(B), number(C).
prolog_1(X-B*X,Y):- prolog_1(1*X-B*X,Y),number(B),X\==Y,!.
prolog_1(C*X-X,Y):- prolog_1(C*X-1*X,Y),number(C),X\==Y,!.

prolog_1(C*X+B*X,(C+B)*Y):- prolog_1(X,Y),number(C), number(B),X\==Y.
prolog_1(X+B*X,Y):- prolog_1(1*X+B*X,Y),number(B),X\==Y,!.
prolog_1(C*X+X,Y):- prolog_1(C*X+1*X,Y),number(C),X\==Y,!.

prolog_1( X-0, Y ):- prolog_1( X, Y ).
prolog_1( 0-X, -(Y) ):- prolog_1( X, Y ).
prolog_1( A+B, C ):- checkit(A),checkit(B),C is A+B.
prolog_1( A-A, 0 ).

prolog_1( A-B, C ):- checkit(A),checkit(B),C is A-B.
prolog_1( _*0, 0 ).
prolog_1( 0*_, 0 ).
prolog_1( 0/_, 0 ).

prolog_1( X*1, X ).
prolog_1( 1*X, X ).
prolog_1(C*X,C*Y):-number(C), prolog_1(X,Y),!.
prolog_1( X/1, X ).

prolog_1( X/X, 1 ) :- !.
prolog_1((C*X)/X, C).
prolog_1( X^1, X ) :- !.
prolog_1( _^0, 1 ) :- !.

/*prolog_1( A*B, X ) :- checkit( A ),checkit( B ),X is A*B.*/

prolog_1( X*X, Y) :- checkit(X),Y is X^2, !.
prolog_1( X*X, X^2) :- !.

/*prolog_1((X^M)*(X^N),Q):- prolog_1(M,A),prolog_1(N,B),prolog_1(X,Y),(M\==A;N\==B;X\==Y),
	prolog_1((Y^(A+B)),Q),!.*/
/*prolog_1((C*X^M)*(X^N),Q):- number(C),prolog_1(M,A),prolog_1(N,B),prolog_1(X,Y),(M\==A;N\==B;X\==Y),
	prolog_1(C*(Y^(A+B)),Q).
prolog_1((X^M)*(D*X^N),Q):- number(D),prolog_1(M,A),prolog_1(N,B),prolog_1(X,Y),(M\==A;N\==B;X\==Y),
	prolog_1(D*(Y^(A+B)),Q).*/
/*prolog_1((X^M)*(X),Q):- prolog_1(M,A),prolog_1(X,Y),(M\==A;X\==Y),
	prolog_1((Y^(A+1)),Q).
prolog_1((X)*(X^N),Q):- prolog_1(N,B),prolog_1(X,Y),(N\==B;X\==Y),
	prolog_1((Y^(B+1)),Q).*/

isequal(X,Y):-prolog_1(X,A),prolog_1(Y,B),(A==B).

prolog_1((X^M)*(D),Y):-number(D),prolog_1(D*X^M,Y),!.
prolog_1((C*X^M)*D,Y):-number(C),number(D),prolog_1(C*D*X^M,Y),!.
prolog_1(C*(X^A),Y):-number(C),prolog_1(C*X^A,Y),!.
prolog_1((X^A)*D,Y):-number(D),prolog_1(D*X^A,Y),!.
prolog_1( X*X^A, Y ) :-prolog_1( X^(A+1), Y ), !.

prolog_1((C*X^M)*(D*X^N),Y):-number(C),number(D),prolog_1(C*D*X^(M+N),Y),!.
prolog_1((X^M)*(D*X^N),Y):-number(D),prolog_1(D*X^(M+N),Y),!.
prolog_1((C*X^M)*(X^N),Y):-number(C),prolog_1(C*X^(M+N),Y),!.
prolog_1(X*(C*X^A),Y):-number(C),prolog_1(C*X^(A+1),Y),!.
prolog_1(X*C,C*X):-number(C),!.
prolog_1((D*X^A)*X,Y):-number(D),prolog_1(D*X^(A+1),Y),!.
prolog_1( X*X^A, Y ) :-prolog_1( X^(A+1), Y ), !.


prolog_1( X^A*X, Y ) :-prolog_1( X^(A+1), Y ), !.


prolog_1( A*X+B*X, Z ):- A\=X, B\=X,prolog_1( (A+B)*X, Z ).
prolog_1( (A+B)*(A-B), X^2-Y^2 ):-prolog_1( A, X ),prolog_1( B, Y ).
prolog_1( X^A/X^B, X^C ):-checkit(A), checkit(B),C is A-B.
prolog_1( (C*X^A)/(D*X^B), (C/D)*X^E ):-checkit(A), checkit(B),checkit(C),checkit(D),E is A-B.
prolog_1( A/B, X ) :- checkit(A), checkit(B),X is A/B.
prolog_1((A+B)*(C+D),X):-checkit(A),checkit(B),checkit(C),checkit(D),prolog_1(A+B,Y),prolog_1(C+D,Z),prolog_1(Y*Z,X). /*change*/
prolog_1( A^B, X ) :- checkit( A ),checkit( B ),X is A^B.

prolog_1( W+X, Q ):- prolog_1( W, Y ), prolog_1( X, Z ),( W \== Y ; X \== Z ), prolog_1( Y+Z, Q ).
prolog_1( W-X, Q ):- prolog_1( W, Y ),prolog_1( X, Z ),( W \== Y ; X \== Z ), prolog_1( Y-Z, Q ).
prolog_1( W*X, Q ):- prolog_1( W, Y ),prolog_1( X, Z ),( W \== Y  ; X \== Z ), prolog_1( Y*Z, Q ).
prolog_1( A/B, C ) :-prolog_1( A, X ),prolog_1( B, Y ),( A \== X ; B \== Y ),prolog_1( X/Y, C ).

prolog_1( W+X+A, Q ):- (prolog_1( W+X, Y ), prolog_1( A, Z ),( W+X \== Y ; A \== Z), prolog_1( Y+Z, Q ));
		       (prolog_1( W+A, Y ), prolog_1( X, Z ),( W+A \== Y ; X \== Z), prolog_1( Y+Z, Q ));
		       (prolog_1( X+A, Y ), prolog_1( W, Z ),( X+A \== Y ; W \== Z), prolog_1( Z+Y, Q )).

prolog_1( W-X+A, Q ):- (prolog_1( W-X, Y ), prolog_1( A, Z ),( W-X \== Y ; A \== Z), prolog_1( Y+Z, Q ));
		       (prolog_1( W+A, Y ), prolog_1( X, Z ),( W+A \== Y ; X \== Z), prolog_1( Y-Z, Q ));
		       (prolog_1( A-X, Y ), prolog_1( W, Z ),( A-X \== Y ; W \== Z), prolog_1( Z+Y, Q )).

prolog_1( W+X-A, Q ):- (prolog_1( W+X, Y ), prolog_1( A, Z ),( W+X \== Y ; A \== Z), prolog_1( Y-Z, Q ));
		       (prolog_1( W-A, Y ), prolog_1( X, Z ),( W-A \== Y ; X \== Z), prolog_1( Y+Z, Q ));
		       (prolog_1( X-A, Y ), prolog_1( W, Z ),( X-A \== Y ; W \== Z), prolog_1( Z+Y, Q )).

prolog_1( W-X-A, Q ):- (prolog_1( W-X, Y ), prolog_1( A, Z ),( W-X \== Y ; A \== Z), prolog_1( Y-Z, Q ));
		       (prolog_1( W-A, Y ), prolog_1( X, Z ),( W-A \== Y ; X \== Z), prolog_1( Y-Z, Q ));
		       (prolog_1( X+A, Y ), prolog_1( W, Z ),( X+A \== Y ; W \== Z), prolog_1( Z-Y, Q )).

/*prolog_1( W-X+A, Q ):- prolog_1( W, Y ), prolog_1( X, Z ),prolog_1(A,B),( W \== Y ; X \== Z; A\==B ), prolog_1( Y-Z+A, Q ).
prolog_1( W+X-A, Q ):- prolog_1( W, Y ), prolog_1( X, Z ),prolog_1(A,B),( W \== Y ; X \== Z; A\==B ), prolog_1( Y+Z-A, Q ).
prolog_1( W-X-A, Q ):- prolog_1( W, Y ), prolog_1( X, Z
),prolog_1(A,B),( W \== Y ; X \== Z; A\==B ), prolog_1( Y-Z-A, Q ).*/

prolog_1( X^A, C ) :-prolog_1( A, B ),A \== B,prolog_1( X^B, C).

prolog_1( X, X ).

checkit(A) :- float(A).
checkit(A) :- integer(A).
