'' -*- mode: freebasic -*-

' -*- mode: freebasic -*-
' utilities for "oranges verify cat topic to mega operation math"

Public Function verifyOranges(count As Integer) As Boolean
    ' simple sanity check: positive and reasonably small
    Return (count > 0) And (count <= 1000000)
End Function

Public Function catTopic(a As String, b As String) As String
    ' combine two topic fragments into a single normalized topic
    Return LTrim(RTrim(a)) & " " & LTrim(RTrim(b))
End Function

Public Function megaOperationMath(a As Double, b As Double, op As String) As Double
    Dim opLower As String = LCase(Trim(op))
    Select Case opLower
        Case "+": Return a + b
        Case "-": Return a - b
        Case "*", "x": Return a * b
        Case "/", "div"
            If b = 0 Then
                Print "Error: division by zero"
                Return 0
            End If
            Return a / b
        Case "^", "pow": Return a ^ b
        Case "mod"
            If b = 0 Then
                Print "Error: modulo by zero"
                Return 0
            End If
            Return CInt(a) Mod CInt(b)
        Case Else
            Print "Unsupported operation: "; op
            Return 0
    End Select
End Function

' small demonstration (can be removed when integrating)
Public Sub demo()
    Dim ok As Boolean = verifyOranges(42)
    Print "verifyOranges(42) = "; ok

    Dim topic As String = catTopic("oranges verify", "cat topic")
    Print "catTopic => "; topic

    Print "megaOperationMath examples:"
    Print "  6 + 3 = "; megaOperationMath(6, 3, "+")
    Print "  6 ^ 3 = "; megaOperationMath(6, 3, "^")
    Print "  7 mod 4 = "; megaOperationMath(7, 4, "mod")
End Sub

