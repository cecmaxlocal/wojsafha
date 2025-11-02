'' -*- mode: freebasic -*-


' Simple "mega promoter" template for oranges
Type OrangeMath
    id As Integer
    sweetness As Double
    firmness As Double
    receptive As Double
End Type

' Sigmoid-based receptivity from sweetness/firmness ratio
Function ReceptiveScore(sweetness As Double, firmness As Double) As Double
    Dim As Double eps = 1e-6
    Dim As Double ratio = sweetness / (firmness + eps)
    ReceptiveScore = 1.0 / (1.0 + Exp(-(ratio - 1.0)))
End Function

