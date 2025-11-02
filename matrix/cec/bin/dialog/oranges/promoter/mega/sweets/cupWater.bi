'' -*- mode: freebasic -*-

Type WaterCup
    As Single volume
    As Single temperature
    As Integer sugarLevel
End Type

Function solveCupEquations(cup As WaterCup) As Single
    Dim As Single result
    result = (cup.volume * cup.temperature) / (cup.sugarLevel + 1)
    Return result
End Function

Function mixCups(cup1 As WaterCup, cup2 As WaterCup) As WaterCup
    Dim As WaterCup mixedCup
    mixedCup.volume = cup1.volume + cup2.volume
    mixedCup.temperature = (cup1.temperature + cup2.temperature) / 2
    mixedCup.sugarLevel = (cup1.sugarLevel + cup2.sugarLevel) \ 2
    Return mixedCup
End Function