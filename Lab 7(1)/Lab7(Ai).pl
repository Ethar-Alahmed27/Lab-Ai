% Lab 7

% =========================
% Part 1 - Shopping Program
% =========================

start :-
    shopping_list([coffee, milk, chocolate, apple, juice]).

shopping_list(List) :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE: '),
    read(Choice),
    process_choice(Choice, List).

process_choice(d, List) :-
    display_items(List),
    shopping_list(List).

process_choice(a, List) :-
    write('Enter the item you want to add: '),
    read(Item),
    add(Item, List, NewList),
    write('The item has been added.'), nl,
    shopping_list(NewList).

process_choice(e, _) :-
    write('Goodbye!'), nl.

process_choice(_, List) :-
    write('Invalid choice. Please try again.'), nl,
    shopping_list(List).

display_items([]).

display_items([Head|Tail]) :-
    write(Head), nl,
    display_items(Tail).


% =========================
% Part 1 - List Operations
% =========================

member1(X, [X|_]).

member1(X, [_|Tail]) :-
    member1(X, Tail).


conc([], List, List).

conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).


add(X, List, [X|List]).


del(X, [X|Tail], Tail).

del(X, [Y|Tail], [Y|Tail1]) :-
    del(X, Tail, Tail1).


% =========================
% Part 2 - Task 1
% Delete Every Occurrence
% =========================

deleteElement(_, [], []).

deleteElement(X, [X|Tail], Result) :-
    deleteElement(X, Tail, Result).

deleteElement(X, [Head|Tail], [Head|Result]) :-
    X \= Head,
    deleteElement(X, Tail, Result).


% =========================
% Part 2 - Task 2
% Add at the End
% =========================

add_at_the_end(X, [], [X]).

add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).