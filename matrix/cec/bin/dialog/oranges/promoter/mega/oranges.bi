'' -*- mode: freebasic -*-

Enum OrangeOperation
    Add = 0
    Subtract
    Multiply
    Divide
    Power
    Root
    Log
End Enum

Type OrangeMatrix
    As Double ptr data
    As Integer rows, cols
End Type

Declare Function PerformOperation(op As OrangeOperation, matrix1 As OrangeMatrix, matrix2 As OrangeMatrix) As OrangeMatrix
Declare Sub InitMatrix(matrix As OrangeMatrix, rows As Integer, cols As Integer)
Declare Sub DeleteMatrix(matrix As OrangeMatrix)