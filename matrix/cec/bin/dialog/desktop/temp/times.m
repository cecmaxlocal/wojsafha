(* mode: wolfram *)
(* mode: wolfram *)
BeginPackage["TimesTools`"]

ParseTime::usage = "ParseTime[s] parses a time given as \"HH:MM\" or {HH,MM} into {HH,MM}."
TimeToMinutes::usage = "TimeToMinutes[{HH,MM}] -> total minutes."
MinutesToTime::usage = "MinutesToTime[n] -> {HH,MM} (HH may exceed 24)."
FormatTime::usage = "FormatTime[{HH,MM}] -> \"HH:MM\" with zero padding."
AddTimes::usage = "AddTimes[t1,t2] adds two times (returns {HH,MM})."
SubtractTimes::usage = "SubtractTimes[tEnd,tStart] -> difference in {HH,MM} (nonnegative)."
SchedulePages::usage = "SchedulePages[pages,rate,slots] distributes pages across slots. \
pages: integer number of pages. rate: pages per hour (numeric). \
slots: list of slot times, each slot as \"HH:MM\"->{\"HH:MM\"} or {HH,MM}->{HH,MM}. \
Returns an association with assignments, capacities, and remaining pages."

Begin["`Private`"]

parseListOrStringTime[t_List] := Module[{h, m},
    {h, m} = t /. {x_?NumericQ, y_?NumericQ} :> {x, y};
    {Floor[h], Floor[m]}
]
parseListOrStringTime[s_String] := Module[{parts},
    parts = StringSplit[StringTrim[s], ":"];
    If[Length[parts] == 2,
        {ToExpression[parts[[1]]], ToExpression[parts[[2]]]},
        Message[ParseTime::bad, s]; $Failed
    ]
]

ParseTime[t_] := Which[
    ListQ[t] && Length[t] == 2 && AllTrue[t, NumericQ], {Floor[t[[1]]], Floor[t[[2]]]},
    StringQ[t], parseListOrStringTime[t],
    True, Message[ParseTime::bad, t]; $Failed
]
ParseTime::bad = "Could not parse time `1`.";

TimeToMinutes[{h_, m_}] /; And[IntegerQ[h], IntegerQ[m]] := h*60 + m
TimeToMinutes[t_] := Module[{pt = ParseTime[t]}, If[pt === $Failed, $Failed, TimeToMinutes[pt]]]

MinutesToTime[n_?NumericQ] := Module[{mins = Round[n], h, m},
    h = Floor[mins/60];
    m = Mod[mins, 60];
    {h, m}
]

FormatTime[t_] := Module[{pt = ParseTime[t]},
    If[pt === $Failed, $Failed,
        StringJoin[
            IntegerString[pt[[1]], 10, 2], ":", IntegerString[pt[[2]], 10, 2]
        ]
    ]
]

AddTimes[t1_, t2_] := Module[{m = TimeToMinutes[t1] + TimeToMinutes[t2]},
    MinutesToTime[m]
]

SubtractTimes[tEnd_, tStart_] := Module[{me = TimeToMinutes[tEnd], ms = TimeToMinutes[tStart], d},
    If[me === $Failed || ms === $Failed, $Failed,
        d = Max[0, me - ms];
        MinutesToTime[d]
    ]
]

(* Helper: normalize slot to {startMin,endMin} in minutes from midnight; end may be <= start allowed for multi-day behavior *)
normalizeSlot[{a_, b_}] := Module[{sa = TimeToMinutes[a], sb = TimeToMinutes[b]},
    If[sa === $Failed || sb === $Failed, $Failed, {sa, sb}]
]
normalizeSlot[s_String] := $Failed

SchedulePages[pages_Integer?NonNegative, rate_?NumericQ, slots_List] := Module[
    {slotMins, capacities, assigned = {}, remaining = pages, perMin, slotAssign},
    perMin = rate/60.0; (* pages per minute, can be fractional *)
    slotMins = normalizeSlot /@ slots;
    If[MemberQ[slotMins, $Failed], Message[SchedulePages::badslots]; Return[$Failed]];
    capacities = Floor[perMin * (#[[2]] - #[[1]])] & /@ slotMins;
    slotAssign = Table[
        Module[{cap = capacities[[i]], take},
            take = Min[cap, remaining];
            remaining -= take;
            <|
                "slot" -> slots[[i]],
                "startMinutes" -> slotMins[[i]][[1]],
                "endMinutes" -> slotMins[[i]][[2]],
                "capacityPages" -> cap,
                "assignedPages" -> take
            |>
        ],
        {i, Length[slots]}
    ];
    <|
        "totalPages" -> pages,
        "ratePerHour" -> rate,
        "slots" -> slotAssign,
        "remainingPages" -> remaining
    |>
]
SchedulePages::badslots = "One or more slots could not be parsed. Slots must be {start,end} times like {\"09:00\",\"10:30\"} or {{9,0},{10,30}}."

End[]

EndPackage[]