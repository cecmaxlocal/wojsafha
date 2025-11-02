(* mode: wolfram script*)
(* Stream solver for mathematical tables *)
StreamFunction[f_, {x_, xmin_, xmax_}, {y_, ymin_, ymax_}, n_] := 
    Table[{x, y, f[x, y]}, {x, xmin, xmax, (xmax - xmin)/n}, 
        {y, ymin, ymax, (ymax - ymin)/n}]

TableVisualize[data_] := 
    ListPlot3D[Flatten[data, 1], 
        PlotStyle -> Opacity[0.8], 
        Mesh -> None, 
        ColorFunction -> "Rainbow"]