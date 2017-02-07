/**Question1(All Test Cases Passed. SB)
Predicate Name: sum-up-numbers-simple
Parameters: L is list and N is a sum-up-numbers-simple
Return a Boolean
**/
sum-up-numbers-simple([], 0).  %Empty List with Sum 0
sum-up-numbers-simple([H|T], N) :-
    %Case where the head is a number
    number(H) -> sum-up-numbers-simple(T, Remainder), 
    N is Remainder + H; 
    sum-up-numbers-simple(T, Remainder), N is Remainder. %All other cases

/**Question2(All Test Cases Passed. SB)
Predicate Name: sum-up-numbers-general
Parameters: L is a list and N is the sum of all numbers in L
Return a Boolean
If the head is a number, use the same logic as question1
If the head is a list, add the predicate with head and the rest of list
Else, ignore the head value
**/
sum-up-numbers-general([], 0). %Empty list with sum 0
sum-up-numbers-general([H|T], N) :-
    %If head is a list, then use the Predicate sum-up-numbers-simple on head and add 
    is_list(H) -> sum-up-numbers-general(T, Remainder), %If the head is list, calcuate the sum of head
    sum-up-numbers-general(H, HeadSum),
    N is Remainder + HeadSum;
    number(H) -> sum-up-numbers-general(T, Remainder), 
    N is Remainder + H;
    sum-up-numbers-general(T, Remainder),
    N is Remainder.


/**Helper functions
PredicateName: is-member
Parameters: N is a number and L is a list
Return a boolean
**/
is-member(X, [X|_]). %Rule Statement
is-member(X, [_|Z]) :-
    is-member(X, Z). %If does not match with head, look at list

/**Question4
PredicateName: common-unique-elements\
Parameters: L1, L2, N
Result: Boolean
**/
common-unique-elements([], _, []). %Rule Statement
common-unique-elements([H|T], L2, [H|Tail]) :- %If member, add to the result list
    is-member(H, L2),
    common-unique-elements(T, L2, Tail).

common-unique-elements([H|T], L2, [Tail|Nested]) :- %If the head is a list
    is_list(H),
    common-unique-elements(H, L2, Nested),
    common-unique-elements(T, L2, Tail).

common-unique-elements([_|T], L2, Tail) :-   %If not, ignore the head
    common-unique-elements(T, L2, Tail).