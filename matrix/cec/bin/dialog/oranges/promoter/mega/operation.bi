'' -*- mode: freebasic -*-

#include once "oranges.bi"
#include once "math.bi"

Type MegaOrangeOperator
    Private:
        m_value As Double
        m_matrix(1 To 3, 1 To 3) As Double
    
    Public:
        Declare Constructor()
        Declare Function Calculate(byval x As Double) As Double
        Declare Sub SetMatrixValue(byval row As Integer, byval col As Integer, byval value As Double)
End Type

Constructor MegaOrangeOperator()
    m_value = 1.0
    For i As Integer = 1 To 3
        For j As Integer = 1 To 3
            m_matrix(i,j) = 0
        Next j
    Next i
End Constructor