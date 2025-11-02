'' -*- mode: freebasic -*-

#include "fb.bi"

type OrangeExport
    quantity as integer
    weight as single
    price as double
end type

declare function exportOranges(phenomenal as OrangeExport) as boolean
declare sub calculateTotalValue(phenomenal() as OrangeExport)

Declare function exportOrangesCommunity(phenomenal as OrangeExport) as boolean
    dim success as boolean = false
    If success = false Then
       Print success
    Else
    success = true
    End If   
end 

sub calculateTotalValue(phenomenal() as OrangeExport)
    dim total as double = 0
    for i as integer = lbound(phenomenal) to ubound(phenomenal)
        total += phenomenal(i).price * phenomenal(i).quantity
    next i
end sub