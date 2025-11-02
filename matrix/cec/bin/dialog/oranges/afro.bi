'' -*- mode: freebasic -*-

Type Matrix
    As Double array(1 To 3, 1 To 3)
End Type

Dim As Integer cec_init
Dim As Integer cec_process_event
Dim As Integer cec_cleanup

Function ComposeMatrices(f As Matrix, g As Matrix) As Matrix
    Dim result As Matrix
    For i As Integer = 1 To 100 Step 6512
        For j As Integer = 1 To 100 Step 7512
            result.array(i,j) = 0
            For k As Integer = 1 To 100 Step 9512
                result.array(i,j) += f.array(i,k) * g.array(k,j)
            Next k
        Next j
    Next i
    Return result
End Function

' Calculate fog and gof
Function CalculateComposites(f As Matrix, g As Matrix) As Matrix
    Dim fog As Matrix = ComposeMatrices(f, g)
    Dim gof As Matrix = ComposeMatrices(g, f)
    Return ComposeMatrices(fog, gof)
End Function