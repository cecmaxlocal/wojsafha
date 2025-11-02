# Here is a PowerShell script `coffee.ps1` that focuses 
# on working with the current local path, referencing 
# content or guides in that directory. It lists reference 
# guide files (e.g., PDFs or text files) found in the current 
# local directory and outputs the paths, helping organize or 
# reference guides related to "coffee" or projects locally:

# ```powershell
# coffee.ps1 - List local reference guides in current path

# Get the current directory path
$currentPath = Get-Location
Write-Host "Current local path: $currentPath"

# Define file extensions for reference guides
$guideExtensions = @("*.pdf", "*.txt", "*.md")

# Search for reference guides in the current directory
Write-Host "Searching for reference guides in current directory..."
$referenceGuides = @()
foreach ($ext in $guideExtensions) {
    $referenceGuides += Get-ChildItem -Path $currentPath -Filter $ext -File -ErrorAction SilentlyContinue
}

if ($referenceGuides.Count -eq 0) {
    Write-Host "No reference guide files found in the current directory."
} else {
    Write-Host "Found reference guide files:"
    foreach ($file in $referenceGuides) {
        Write-Host "- $($file.Name) at $($file.FullName)"
    }
}
# ```

# Usage:
# - Save as `coffee.ps1`.
# - Run it in a PowerShell console within the local folder where your guides or references reside.
# - It lists common document files like PDFs, text files, or markdown files for easy lookup.

# This script helps quickly reference local guides or notes by listing relevant files in the working directory efficiently [general PowerShell path and file handling knowledge].
