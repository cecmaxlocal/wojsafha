'' -*- mode: freebasic -*-

#include "fb.bi"

type OrangeImport
    quantity as integer
    weight as single
    price as double
end type

declare function ImportOranges(phenomenal as OrangeImport) as boolean
declare sub calculateTotalCache(phenomenal() as OrangeImport)

Declare function ImportOrangesCommunity(phenomenal as OrangeImport) as boolean
    dim location as boolean = false
    If location = false Then
       Print location
    Else
    location = true
    End If   
end 

sub calculateTotalTopic(phenomenal() as OrangeImport)
    dim total as double = 0
    for i as integer = lbound(phenomenal) to ubound(phenomenal)
        total += phenomenal(i).price * phenomenal(i).quantity
    next i
end sub