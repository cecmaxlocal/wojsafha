(*the wolfram script mathematic *)
BeginPackage["CEC.Dialog.Desktop.Browser`"]

browserDialog::usage = "browserDialog[] opens a small desktop dialog with a math input, local evaluation and quick links to common online solvers.";

Begin["`Private`"]

(* list of solver templates; the expression will be appended or interpolated where {q} appears *)
solverTemplates = <|
    "WolframAlpha" -> "https://www.wolframalpha.com/input?i={q}",
    "Symbolab" -> "https://www.symbolab.com/solver?query={q}",
    "Mathway" -> "https://www.mathway.com/Calculator?exp={q}",
    "Desmos (calculator)" -> "https://www.desmos.com/calculator"
|>;

urlFor[site_String, expr_String] := Module[{tmpl, enc},
    tmpl = Lookup[solverTemplates, site, Missing[]];
    If[tmpl === Missing[], Return[$Failed]];
    enc = If[StringTrim[expr] === "", "", URLEncode[expr, "UTF-8"]];
    StringReplace[tmpl, "{q}" -> enc]
]

openSolverPage[site_, expr_String:""] := Module[{url = urlFor[site, expr]},
    If[url === $Failed, MessageDialog["Unknown solver: " <> ToString[site]], SystemOpen[url]]
]

browserDialog[] := Module[{expr = "", result = "", sites, nb},
    sites = Keys[solverTemplates];
    nb = CreateDialog[
        Column[{
            Style["Math Solver Browser", Bold, Larger],
            Row[{
                "Expression: ",
                InputField[Dynamic[expr], String, FieldSize -> 40]
            }],
            Row[{
                Button["Evaluate locally",
                    result = Quiet@Check[ToExpression[expr], "Invalid expression", {Syntax::sntxi}],
                    ImageSize -> Medium
                ],
                Spacer[10],
                PopupMenu[Dynamic[#site], sites] & /; False (* placeholder to show how PopupMenu could be used *)
            }],
            Row[
                Button[#, openSolverPage[#, Dynamic[expr] /. d_Dynamic :> expr], ImageSize -> Medium] & /@ sites,
                Spacings -> 2
            ],
            Style["Result:", Bold],
            Dynamic@Pane[If[result === "", "<no result>", result], {400, 120}, Scrollbars -> True],
            DefaultButton[]
        }],
        WindowTitle -> "Browser Math Solver"
    ];
    nb
]

End[]
EndPackage[]