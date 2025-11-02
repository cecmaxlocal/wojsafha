'' -*- mode: freebasic -*-
#lang "fb"
#include "matrix/cec/bin/dialog/oranges/afro.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/engineer.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/operation.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/export/oranges.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/import/oranges.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/option/caches.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/sweets/cupWater.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/browser/firefox.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/templates/orangeSweets.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/color/yellowGreen.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/topic/mathSolver.bi"
#include "matrix/cec/bin/dialog/oranges/promoter/mega/wiki/wikipedia.bi"
SUB main()
    ' Initialize CEC system
    DIM AS INTEGER result
    IF result <> 0 THEN
        PRINT "Failed to initialize CEC"
        EXIT SUB
    END IF
    
    ' Main program loop
    DO
        SLEEP 1
    LOOP UNTIL INKEY = CHR(27)  ' ESC to exit
    
END SUB

main()