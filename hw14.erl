-module(hw14).
-export([start/0]).

% ====================
% Complete the following functions and submit your file to Canvas.
% ====================
% Do not change the names of the functions. 
% Do not change the number of arguments in the functions.
% If your file cannot be loaded by the Erlang compiler, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each function. In order to state that your function
% "works as described", your output must be similar to the expected one in each case.

% === pow ===

pow(X, N) -> powAux(X, N, X).
powAux(_, 0, _ ) -> 1;
powAux(_, 1, X ) -> X;
powAux(X, N, R) -> powAux(X, N - 1, X * R).
% === fibinacci ===

fibonacci(X) -> fibonacciAux(0, 1, X).
fibonacciAux(X, _ , 0) -> X;
fibonacciAux(X, Y, Z) -> fibonacciAux(Y, X + Y, Z - 1).

% === reverse ===

reverse(Lst) -> reverseAux(Lst, []).
reverseAux([], Lst) -> Lst;
reverseAux([H | T], Lst) -> reverseAux(T, [H] ++ Lst).

% === count ===

count(Lst, X) -> countAux(Lst, X, 0).
countAux([], _ , C) -> C;
countAux([H | T], X, C) -> if
  H == X -> countAux(T, X, C + 1);
  true -> countAux(T, X, C)
end.

% === sum ===

sum(Lst) -> sumAux(Lst, 0).
sumAux([], C) -> C;
sumAux([H | T], C) -> sumAux(T, C + H).

% === Test cases ===

start() -> 
	io:format("=== pow ===~n"),
	io:format("~p~n", [pow(2, 10)]), % 1024
	io:format("~p~n", [pow(5, 3)]), % 125
	io:format("=== fibonacci ===~n"),
	io:format("~p~n", [fibonacci(5)]), % 5
	io:format("~p~n", [fibonacci(10)]), % 55
	io:format("=== reverse ===~n"),	
	io:format("~p~n", [reverse([33, 45, 18, 17, 25, 62, 100])]), % [100,62,25,17,18,45,33]
	io:format("~p~n", [reverse([10, 20, 30, 40, 50])]), % [50,40,30,20,10]
	io:format("=== count ===~n"),
	io:format("~p~n", [count([1, 2, 3, 4, 5, 5, 4, 3, 2, 1, 1], 1)]), % 3
	io:format("~p~n", [count([1, 2, 3, 4, 5, 3, 10, 3, 5, 3, 4, 3, 2, 1, 1, 3], 3)]), % 6
	io:format("=== sum ===~n"),
	io:format("~p~n", [sum([33, 45, 18, 17, 25, 62, 100])]), % 300
	io:format("~p~n", [sum([10, 20, 30, 40, 50])]). % 150