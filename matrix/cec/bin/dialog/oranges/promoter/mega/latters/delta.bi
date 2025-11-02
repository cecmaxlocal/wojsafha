'' -*- mode: freebasic -*-

' Define a function to perform a mathematical operation
Function MegaDeltaLatterServerCupWithWaterMath(a As Double, b As Double) As Double
    Return (a * b) + (a / b) - (b ^ 2)
End Function

' Example usage of the function
Dim result As Double
result = MegaDeltaLatterServerCupWithWaterMath(10, 5)
Print "Result: "; result