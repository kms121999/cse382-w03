-module(map_filter).

-export([c_map/2, c_filter/2, func/1, test/1]).

% This one works 
c_map([], _)->[];
c_map(List, Func)->
    [F|Rest] = List,
    [Func(F)|c_map(Rest, Func)].

func(X)->
    X + 2.

test(X)->
  if
    X < 10 -> true;
    true -> false
  end.

c_filter([], _)->[];
c_filter([H|T], Func)->
  Result = Func(H),
  if
    Result =:= true -> [H|c_filter(T, Func)];
    true -> c_filter(T, Func)
  end.
