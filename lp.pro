%Question1
%Predicate Name: sum-up-numbers-simple
%Parameters: L is list and N is a sum-up-numbers-simple
%Return a Boolean
sum-up-numbers-simple([], 0).  %Empty List with Sum 0
sum-up-numbers-simple([H|T], N) :-
    (number(H) -> sum-up-numbers-simple(T, Remainder), N is Remainder + H;
     sum-up-numbers-simple(T, Remainder), N is Remainder).