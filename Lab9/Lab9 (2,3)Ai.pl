% Task 2 - Sum of List

sumlist([], 0).

sumlist([Head|Tail], Sum) :-
    sumlist(Tail, Rest),
    Sum is Head + Rest.


% Task 3 - Total and Average

total_average :-
    write('Enter the first number: '),
    read(N1),

    write('Enter the second number: '),
    read(N2),

    write('Enter the third number: '),
    read(N3),

    Total is N1 + N2 + N3,
    Average is Total / 3,

    write('Total = '),
    write(Total),
    nl,

    write('Average = '),
    write(Average),
    nl.