'' -*- mode: freebasic -*-

#include once "fbgfx.bi"
#include once "crt.bi"

type OrangeSweetSolver
    private:
        dim as double tolerance
        dim as integer maxIterations
        
    public:
        declare constructor()
        declare function solve(value as double) as double
        declare sub setTolerance(t as double)
end type

constructor OrangeSweetSolver()
    tolerance = 0.0001
    maxIterations = 1000
end constructor

function OrangeSweetSolver.solve(value as double) as double
    dim as double result = value / 2
    dim as double temp
    
    for i as integer = 1 to maxIterations
        temp = result
        result = (result + value/result) / 2
        if abs(result - temp) < tolerance then exit for
    next
    
    return result
end function

sub OrangeSweetSolver.setTolerance(t as double)
    tolerance = t
end sub