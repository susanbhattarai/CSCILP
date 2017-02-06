/**Question1(All Test Cases Passed. SB)
Predicate Name: sum-up-numbers-simple
Parameters: L is list and N is a sum-up-numbers-simple
Return a Boolean
**/
sum-up-numbers-simple([], 0).  %Empty List with Sum 0
sum-up-numbers-simple([H|T], N) :-
    number(H) -> sum-up-numbers-simple(T, Remainder), 
    N is Remainder + H; %Case where the head is a number
    sum-up-numbers-simple(T, Remainder), N is Remainder. %All other cases

/**Question2
Predicate Name: sum-up-numbers-general
Parameters: L is a list and N is the sum of all numbers in L
Return a Boolean
**/
sum-up-numbers-general([], 0). %Empty list with sum 0
sum-up-numbers-general([H,T], N) :-
    %If head is a list, then use the Predicate sum-up-numbers-simple on head and add %
    is_list(H) -> sum-up-numbers-general(T, Remainder), 
    sum-up-numbers-general(H, HeadSum),
    N is Remainder + HeadSum;
    number(H) -> sum-up-numbers-general(T, Remainder),
    N is Remainder + H;
    sum-up-numbers-general(T, Remainder),
    N is Remainder.
