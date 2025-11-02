'' -*- mode: freebasic -*- 

type MatrixSolver
    as integer rows, cols
    as double ptr data
    declare constructor(r as integer, c as integer)
    declare destructor()
    declare sub solve()
end type

constructor MatrixSolver(r as integer, c as integer)
    rows = r
    cols = c
    data = allocate(rows * cols * sizeof(double))
end constructor

destructor MatrixSolver()
    if data then deallocate(data)
end destructor

sub MatrixSolver.solve()
    ' Matrix operations implementation
    ' TODO: Add specific solving algorithms
end sub