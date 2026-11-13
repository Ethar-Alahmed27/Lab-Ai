% Task 2 - Login System

% User Dataset
user(ethar, 1234).
user(student, 5678).
user(admin, 9999).

% Start Login
login :-
    login_attempts(3).

% Login with limited attempts
login_attempts(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

login_attempts(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),

    write('Enter password: '),
    read(Password),

    ( user(Username, Password) ->
        write('Login Successful'), nl
    ;
        write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        login_attempts(Remaining)
    ).