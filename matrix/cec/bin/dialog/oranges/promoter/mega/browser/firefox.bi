'' -*- mode: freebasic -*-
#include "math.bi"

type MathSolver
    as double result
    declare function solve(a as double, b as double) as double
end type

function MathSolver.solve(a as double, b as double) as double
    Return (a * b)
end function

dim shared solver as MathSolver