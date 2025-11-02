(*mode: wolfram script*)
(*mode: wolfram script*)

ClearAll[parseTemps, simulateLives, usage];

usage[] := "Usage: wolframscript --script offlives.m [initialPop] [temps|file.csv] [optTemp] [scale]
 - initialPop: integer (default 1000)
 - temps: comma-separated temperatures (e.g. 18,20,22) or path to CSV with one column
 - optTemp: optimal temperature for survival (default 20)
 - scale: width of tolerance (default 5)
If no temps provided a 30-day random temperature series is used."

parseTemps[s_String] := Module[{str = StringTrim[s]},
    If[StringMatchQ[str, "*.csv" | "*.txt"],
        Quiet@Flatten@Import[str, "CSV"],
        ToExpression /@ StringSplit[str, {",", " ", ";", "\t"}]
    ]
]

simulateLives[init_Integer?Positive, temps_List, opt_:20., scale_:5.] := Module[
    {pop = init, rec = {}, newPop, survivProb},
    Do[
        survivProb = Exp[-(t - opt)^2/(2 scale^2)]; (* Gaussian survival vs temp *)
        newPop = Max[0, Floor[pop survivProb]];
        AppendTo[rec, <|"Day" -> i, "Temp" -> t, "Alive" -> newPop, "Died" -> (pop - newPop)|>];
        pop = newPop;
        If[pop == 0, Break[]],
        {i, 1, Length[temps]}, {t, temps[[i]]}]; (* loop aligns days to temps *)
    rec
]

(* main *)
Module[{args = Rest@$ScriptCommandLine, init = 1000, temps, opt = 20., scale = 5., res, daysToExt},
    If[Length[args] == 0, 
        Print["No args provided. Using defaults."]; 
        temps = Table[opt + RandomReal[{-8, 8}], {30}],
        (* parse args *)
        init = If[Length[args] >= 1 && StringLength[args[[1]]] > 0, ToExpression[args[[1]]], init];
        If[Length[args] >= 2 && StringLength[args[[2]]] > 0,
            temps = parseTemps[args[[2]]],
            temps = Table[opt + RandomReal[{-8, 8}], {30}]
        ];
        If[Length[args] >= 3 && StringLength[args[[3]]] > 0, opt = ToExpression[args[[3]]]];
        If[Length[args] >= 4 && StringLength[args[[4]]] > 0, scale = ToExpression[args[[4]]]];
    ];

    If[!ListQ[temps] || temps === {}, Print[usage[]]; Abort[]];
    temps = N[Flatten[temps]];

    res = simulateLives[init, temps, opt, scale];
    If[res === {}, Print["All died before first day."]; Abort[]];

    Print["Day\tTemp\tAlive\tDied"];
    Scan[Function[r, Print[r["Day"], "\t", NumberForm[r["Temp"], {6, 2}], "\t", r["Alive"], "\t", r["Died"]]], res];

    daysToExt = FirstCase[res, x_ /; x["Alive"] == 0 :> x["Day"], None];
    If[daysToExt === None,
        Print["Result: population survived through ", Length[temps], " days. Final alive: ", Last[res]["Alive"]],
        Print["Result: extinct on day ", daysToExt]
    ];
]