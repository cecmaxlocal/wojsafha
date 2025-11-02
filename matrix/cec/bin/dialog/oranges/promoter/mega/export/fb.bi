'' -*- mode: freebasic -*-
#macro orange_mega_productive_browser_ltr()
    dim as integer i, j
    for i = 1 to matrix_width
        for j = 1 to matrix_height
            if orange_matrix(i,j) > 0 then
                screen_buffer(i,j) = orange_matrix(i,j)
            end if
        next j
    next i
#endmacro