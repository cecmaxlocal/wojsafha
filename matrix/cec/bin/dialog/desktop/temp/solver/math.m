(* mode: wolfram script*)
(* Define a function to solve a mathematical equation *)
SolveEquation[equation_, variable_] := Solve[equation == 0, variable]

(* Example usage *)
result = SolveEquation[x^2 - 4, x]
Print[result]