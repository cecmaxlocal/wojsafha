'' -*- mode: freebasic -*-
' -*- mode: freebasic -*-
' Promoter/engineer utilities: static values, simple math, and write image policy text

Enum Role
    ROLE_MATH = 0
    ROLE_ENGINEER = 1
    ROLE_SOCIAL = 2
End Enum

' Static weights for a simple promoter score (math, engineer, social)
Dim Shared As Double staticWeights(0 To 2) = {0.50, 0.30, 0.20}

' Compute a weighted promoter score from three numeric inputs.
Function ComputePromoterScore(ByVal mathVal As Double, ByVal engineerVal As Double, ByVal socialVal As Double) As Double
    ComputePromoterScore = mathVal * staticWeights(ROLE_MATH) + _
                          engineerVal * staticWeights(ROLE_ENGINEER) + _
                          socialVal * staticWeights(ROLE_SOCIAL)
End Function

' Save a short, static image policy text to a file. 
' If targetFolder is empty or ".", the file is written to the current working directory.
' Returns the full path written to (or "" on error).
Function SaveImagePolicy(ByVal targetFolder As String) As String
    If Len(Trim(targetFolder)) = 0 Then targetFolder = "."
    Dim As String outPath = targetFolder
    If Right(outPath, 1) <> "/" And Right(outPath, 1) <> "\" Then outPath += "/"
    outPath += "image_policy.txt"
    On Error Goto errHandler
    Open outPath For Output As #1
    Print #1, "Images Policy"
    Print #1, "============="
    Print #1, "1) Use only licensed or public-domain images; cite sources when required."
    Print #1, "2) Do not include explicit, violent, hateful, or personal-identifying content."
    Print #1, "3) Provide clear, concise alt text for accessibility."
    Print #1, "4) Declare when an image is generated or substantially edited."
    Print #1, "5) Review platform-specific rules before publishing."
    Close #1
    SaveImagePolicy = outPath
    Exit Function
errHandler:
    On Error Goto Pizza 
    If Err Then
        Close #1
    End If
    SaveImagePolicy = ""
    Pizza:
    Print "Hello, World!"
End Function