(*mode: wolfram script*)
(* Matrix Connection and Solver Module *)
BeginPackage["MatrixSolver`"]

MatrixConnect::usage = "MatrixConnect[matrix1, matrix2] connects compatible matrices"
MatrixSolve::usage = "MatrixSolve[matrix] solves the system of equations"

Begin["`Private`"]

MatrixConnect[m1_, m2_] := Module[{},
    If[Dimensions[m1][[2]] === Dimensions[m2][[1]],
        Dot[m1, m2],
        Message[MatrixConnect::dims, "Incompatible matrix dimensions"]
    ]
]

MatrixSolve[matrix_] := LinearSolve[matrix]

End[]
EndPackage[]