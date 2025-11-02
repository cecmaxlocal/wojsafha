(*mode: wolfram script*)
(* Function to select arguments based on changes in times and spaces *)
selectArguments[args_List] := Module[{filteredArgs},
    filteredArgs = Select[args, ! StringContainsQ[#, " "] && ! StringContainsQ[#, "time"] &];
    Return[filteredArgs];
]

(* Example usage *)
args = {"arg1", "arg2 time", "arg3", "arg4 space", "arg5"};
selectedArgs = selectArguments[args];
Print[selectedArgs];