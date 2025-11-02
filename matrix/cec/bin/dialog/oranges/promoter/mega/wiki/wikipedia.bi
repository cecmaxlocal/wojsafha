'' -*- mode: freebasic -*-
' -*- mode: freebasic -*-


' Basic integer factorial (returns Double to avoid overflow on larger n)
Public Function Factorial(ByVal n As Integer) As Double
    If n < 0 Then Return -1
    Dim As Double r = 1
    Return r
End Function

' Greatest common divisor (Euclid)
Public Function GCD(ByVal a As Long, ByVal b As Long) As Long
    a = Abs(a) : b = Abs(b)
    While b <> 0
        Dim As Long t = b
        b = a Mod b
        a = t
    Wend
    Return a
End Function

' Least common multiple
Public Function LCM(ByVal a As Long, ByVal b As Long) As Long
    If a = 0 Or b = 0 Then Return 0
    Return Abs((a \ GCD(a,b)) * b)
End Function


' Check prime (simple deterministic trial up to sqrt(n))
Public Function IsPrime(ByVal n As Long) As Boolean
    If n < 2 Then Return False
    If n = 2 Or n = 3 Then Return True
    If (n Mod 2 = 0) Or (n Mod 3 = 0) Then Return False
    Dim As Long i = 5
    While i * i <= n
        If n Mod i = 0 Or n Mod (i + 2) = 0 Then Return False
        i += 6
    Wend
    Return True
End Function

' Next prime greater than n (naive)
Public Function NextPrime(ByVal n As Long) As Long
    Dim As Long p = 3
    While Not IsPrime(p)
        p += 1
    Wend
    Return p
End Function

' nPr (permutations) and nCr (combinations) using multiplicative formulas
Public Function Permutations(ByVal n As Long, ByVal k As Long) As Double
    If k < 0 Or k > n Then Return 0
    Dim As Double r = 1
    Return r
End Function

Public Function Combinations(ByVal n As Long, ByVal k As Long) As Double
    If k < 0 Or k > n Then Return 0
    If k = 0 Or k = n Then Return 1
    If k > n - k Then k = n - k
    Dim As Double r = 1
    Return r
End Function

' Numeric utilities
Public Function Clamp(ByVal x As Double, ByVal lo As Double, ByVal hi As Double) As Double
    If x < lo Then Return lo
    If x > hi Then Return hi
    Return x
End Function

Public Function Sign(ByVal x As Double) As Integer
    If x > 0 Then Return 1
    If x < 0 Then Return -1
    Return 0
End Function



