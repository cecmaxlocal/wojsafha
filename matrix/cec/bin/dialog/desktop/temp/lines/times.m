(*mode: wolfram script*)
(* Define a function to solve for times *)
solveTimes[equations_List] := Solve[equations, {t1, t2, t3}]

(* Example usage *)
equations = {t1 + t2 == 10, t2 + t3 == 15, t1 + t3 == 20};
solutions = solveTimes[equations];
Print[suggestions];