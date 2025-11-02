'' -*- mode: freebasic -*-
'' -*- mode: freebasic -*-
' Mega / "oranges" math utilities - FreeBASIC
' - Provides a small, safe hyper/mega-operation helper for small inputs.
' - Returns results as strings and guards against enormous results / overflow.

Const DOUBLE_DIGIT_LIMIT As Double = 19.0 ' ~ max digits for 64-bit integer safe output

Function powSafe(a As ULong, b As ULong, ByRef tooLarge As Boolean) As ULong
    tooLarge = False
    If b = 0 Then Return 1UL
    If a = 0 Then Return 0UL
    
    Dim digits As Double = b * Log(a) / Log(10)
    If digits > DOUBLE_DIGIT_LIMIT Then
        tooLarge = True
        Return 0UL
    End If
    Dim result As ULong = 1UL
    Dim i As ULong
    For i = 1UL To b
        result *= a
    Next
    Return result
End Function

Function megaOperation(a As ULong, b As ULong, level As Integer) As String
    ' level semantics used here (small, practical):
    ' 0 -> addition: a + b
    ' 1 -> multiplication: a * b
    ' 2 -> exponentiation: a ^ b
    ' 3 -> tetration: a ^^ b (a^(a^(...)) b times)
    ' 4+ -> iterated tetration (extremely huge) -> flagged as too large
    Select Case level
    Case 0
        ' safe addition
        Dim m as Double = CDbl(a) + CDbl(b)
        If a > 18446744073709551615# Then Return "too large"
        Return Str(a)
    Case 1
        ' multiplication (check roughly for overflow)
        Dim prodDigits As Double = Log(CDbl(a)) / Log(10) + Log(CDbl(b)) / Log(10)
        If prodDigits > DOUBLE_DIGIT_LIMIT Then Return "too large"
        Return Str(a * b)
    Case 2
        Dim tooLarge As Boolean
        Dim r As ULong = powSafe(a, b, tooLarge)
        If tooLarge Then Return "too large"
        Return Str(r)
    Case 3
        ' tetration: compute iterated exponentiation from top down,
        ' but stop if intermediate grows beyond safe digit threshold.
        If b = 0 Then Return "1" ' convention: 0-height tetration = 1
        Dim levelVal As ULong = a
        Dim i As ULong
        For i = 2UL To b
            Dim tooLarge As Boolean
            levelVal = powSafe(a, levelVal, tooLarge)
            If tooLarge Then Return "too large"
        Next
        Return Str(levelVal)
    Case Else
        Return "too large"
    End Select
End Function

Function orangesAfterMega(trees As ULong, orangesPerTree As ULong, opLevel As Integer) As String
    ' Example helper: apply megaOperation(orangesPerTree, trees, opLevel)
    ' - opLevel 0: total oranges by adding orangesPerTree + trees (unlikely)
    ' - opLevel 1: orangesPerTree * trees (normal total)
    ' - opLevel 2+: exponential-ish growth
    Return megaOperation(orangesPerTree, trees, opLevel)
End Function