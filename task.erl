-module(task).
-export([findLargestProduct/0]).

isPalindromic(N) when is_list(N) ->
	N == lists:reverse(N).

	
start(Max) -> sieve(lists:seq(2, Max), Max).
sieve([H|T], Max) -> if H * H > Max -> [H] ++ T; true -> [H] ++ sieve(mark(H, T), Max) end.

mark(X, List) -> lists:filter(fun(Y) -> (Y rem X =/= 0)  end, List).

findLargestProduct() ->
	C = [X || X <- start(99999), X > 10000],
	List = [X * Y || X <- C , Y <- C ,  isPalindromic(integer_to_list(X * Y))],
	lists:max(List).
