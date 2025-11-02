# Here is a PowerShell script named `audiDrizzleStart.ps1` 
# designed to work with the current local path and list 
# cloud-related files or reference guides (e.g., text/pdf/md files) 
# in that local directory, helping you organize reference materials 
# or resources:

# ```powershell
# audiDrizzleStart.ps1 - List cloud reference guides in current local path

# Get current local directory path
$currentPath = Get-Location
Write-Host "Current local path: $currentPath"

# Define file extensions relevant to reference guides or documentation
$referenceExtensions = @("*.pdf", "*.txt", "*.md")

# Find files matching defined extensions in the current directory
Write-Host "Searching for cloud or guide reference files..."
$referenceFiles = @()
foreach ($ext in $referenceExtensions) {
    $referenceFiles += Get-ChildItem -Path $currentPath -Filter $ext -File -ErrorAction SilentlyContinue
}

if ($referenceFiles.Count -eq 0) {
    Write-Host "No reference guide or cloud-related files found in the current directory."
} else {
    Write-Host "Found the following reference files:"
    foreach ($file in $referenceFiles) {
        Write-Host "- $($file.Name) at $($file.FullName)"
    }
}
```

# Usage:
# - Save as `audiDrizzleStart.ps1`.
# - Run it within PowerShell while in your working directory.
# - It searches and lists common document files that could serve as local cloud references or guides.

# This script is adaptable to other extensions or folders and helps maintain good awareness of local reference materials for cloud or "audio drizzle" related projects or documentation.[1][3][6]

# [1](https://stackoverflow.com/questions/66859219/how-to-list-all-files-in-a-folder-do-cmds-dir-a-in-powershell)
# [2](https://www.youtube.com/watch?v=RTswBWeQ6o0)
# [3](https://www.sqlservercentral.com/blogs/powershellbasics-get-a-list-of-files-from-a-directory)
# [4](https://devblogs.microsoft.com/scripting/list-files-in-folders-and-subfolders-with-powershell/)
# [5](https://activedirectorypro.com/how-to-list-folders-using-cmd-and-powershell-commands/)
# [6](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.5)
# [7](https://www.reddit.com/r/PowerShell/comments/10f7768/list_files_in_a_directory_and_enable_user_to/)
# [8](https://gist.github.com/657e940bc3802047ea7b314e80d65d15)
# [9](https://community.spiceworks.com/t/powershell-script-to-list-folders-that-have-files-with-date-modified-in-a-range/658146)
