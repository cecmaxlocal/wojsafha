(* mode: wolfram script*)
(* drizzle: browser time select good views - static helper library *)

(* Compute a simple sharpness/quality score for an image or image file *)
ImageQualityScore[input_] := Module[{img, gray, lap},
    img = If[StringQ[input], Quiet@Import[input], input];
    If[!MatchQ[img, _Image], Return[0]];
    gray = ColorConvert[img, "Grayscale"];
    lap  = ImageConvolve[gray, {{1, 1, 1}, {1, -8, 1}, {1, 1, 1}}];
    First@ImageMeasurements[lap, "Variance"]
];

(* Default time extractor: for file paths use file modification date, for Image objects attempt Metadata "Date" else Now *)
DefaultTimeExtractor[item_] := Which[
    StringQ[item], DateObject[FileDate[item, "Modification"]],
    MatchQ[item, _Image], With[{md = Quiet@Developer`ReadImageData@item},
        If[AssociationQ[md] && KeyExistsQ[md, "DateTime"], DateObject[md["DateTime"]], DateObject[]]
    ],
    True, DateObject[]
];

Options[SelectGoodViewsByTime] = {
    "WindowMinutes" -> 10,
    "TopPerWindow"  -> 3,
    "TimeExtractor" -> Automatic
};

(* SelectGoodViewsByTime[list] ->
     groups items into sliding time windows and picks the top-scoring items per window.
     Accepts file paths or Image objects.
     Options:
         "WindowMinutes" (integer) - size of time window in minutes
         "TopPerWindow"  (integer) - how many items to keep per window
         "TimeExtractor" (function or Automatic) - function mapping item -> DateObject
*)
SelectGoodViewsByTime[items_List, opts : OptionsPattern[]] := Module[
    {win = OptionValue["WindowMinutes"], top = OptionValue["TopPerWindow"],
     tex = OptionValue["TimeExtractor"], timeFn, times, absTimes, scores, data, groups, pick},
    
    timeFn = Which[
        tex === Automatic, DefaultTimeExtractor,
        True, tex &];

    (* obtain times and absolute times *)
    times = Quiet@Map[timeFn, items];
    absTimes = Map[
        Function[t, If[Head[t] === DateObject, AbsoluteTime[t], AbsoluteTime[DateObject[t]]]], times];

    (* compute quality scores (cached) *)
    scores = AssociationThread[items, Map[ImageQualityScore, items]];

    (* pair items with abs times *)
    data = Transpose[{items, absTimes}];

    (* group into contiguous windows by integer window index *)
    groups = GatherBy[data, Floor[Last[#]/(win*60)] &];

    (* select top items per group by score *)
    pick = Flatten[
        Map[
            Function[group,
                Module[{sorted = Reverse@SortBy[group, scores[First[#]] &]},
                    Take[sorted[[All, 1]], Min[top, Length[sorted]]]
                ]
            ],
            groups
        ],
        1
    ];

    (* return unique selection in original order *)
    Intersection[items, pick]
];

(* convenience alias for UI or scripts *)
drizzleBrowserTimeSelectGoodViews[items_List, opts : OptionsPattern[]] := SelectGoodViewsByTime[items, opts];
