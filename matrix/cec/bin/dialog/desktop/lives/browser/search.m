(*mode: wolfram script*)
NotebookLocate[{
    "Search/Reference",
    All,
    "AuxiliaryTools"
}];

SetOptions[$FrontEnd, 
    SearchContext -> {
        "Documentation",
        "AddOns",
        "System",
        "Tutorial"
    }
];

browserSearch[query_String] := Module[{results},
    results = SearchIndexObject["Documentation"][query];
    CreateDocument[
        Column[
            Map[DocumentationLink[#]&, results]
        ]
    ]
]