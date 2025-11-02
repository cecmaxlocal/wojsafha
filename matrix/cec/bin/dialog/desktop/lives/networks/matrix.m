(*mode: wolfram script*)
BeginPackage["MatrixBrowser`"]

MatrixConnect::usage = "Connects matrix solver to live debugger"

Begin["`Private`"]

MatrixConnect[solver_, debug_] := Module[{conn},
    conn = CreateConnection[solver, debug];
    InitializeBulletSolver[conn];
    ApplyMathTransform[conn];
    conn
]

InitializeBulletSolver[conn_] := (
    BulletInit[conn];
    SetSolverParameters[conn]
)

End[]
EndPackage[]