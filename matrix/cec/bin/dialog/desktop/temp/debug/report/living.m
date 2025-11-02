(*mode: wolfram script*)
(* Report living safes path for current files *)
Module[{currentPath = Directory[]},
    safeFiles = FileNames["*.safe", currentPath, Infinity];
    Print["Found ", Length[safeFiles], " safe files in ", currentPath];
    Grid[{
        {"File", "Last Modified", "Size (KB)"},
        Sequence @@ (
            {
                FileNameTake[#],
                DateString[FileDate[#]],
                Round[FileByteCount[#]/1024, 0.1]
            }& /@ safeFiles
        )
    }, Frame -> All]
]