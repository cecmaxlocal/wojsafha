(* mode: wolfram script*)

(* Function to move an interval by a specified time *)
moveInterval[interval_, time_] := Module[{newInterval},
    newInterval = interval + time;
    Return[newInterval];
]

(* Example usage *)
currentInterval = 5; (* Current interval *)
timeChange = 2;      (* Time to move the interval *)
newInterval = moveInterval[currentInterval, timeChange];
Print["New Interval: ", newInterval];