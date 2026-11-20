% Lab 12

% ----- Facts: one edge(From, To) per arrow in the figure -----

edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').

edge('Tabuk', 'Taif').

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

edge('Riyadh', 'Dammam').

% ----- Rules -----

% travel(Start, Finish, Path_List)
% Starts the search with the start city already visited,
% then reverses the accumulated list to get the path in order.
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% path(From, To, Visited_List, Path_List)
% Base case: we reached the destination, the visited list is the path.
path(X, X, P, P).

% Recursive case: take an edge to a city we have not visited yet
% (the not(member(...)) check avoids going around in circles).
path(From, To, Visited, Path) :-
    edge(From, Z),
    not(member(Z, Visited)),
    path(Z, To, [Z|Visited], Path).