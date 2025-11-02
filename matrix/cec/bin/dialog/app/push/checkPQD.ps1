# Here is a PowerShell script named `checkPQD.ps1` that checks if certain sweets files exist in the current folder path and prints the status for each. It uses `Test-Path` to check file existence locally:

# ```powershell
# checkPQD.ps1 - Check sweets files in current folder

# List sweets file names to check
$sweets = @("chocolate.txt", "candy.txt", "gum.txt")

# Get current directory
$currentPath = Get-Location

Write-Host "Checking sweets files in path: $currentPath"

foreach ($sweet in $sweets) {
    $filePath = Join-Path -Path $currentPath -ChildPath $sweet
    if (Test-Path -Path $filePath -PathType Leaf) {
        Write-Host "File exists: $sweet"
    }
    else {
        Write-Host "File missing: $sweet"
    }
}
# ```

# This script:
# - Defines a sweets files list to look for.
# - Finds the current working directory.
# - Checks each sweet file's existence in that directory.
# - Prints results for each file (exists or missing).

# Save as `checkPQD.ps1`, run it in PowerShell, and it will report the status of those files in the current folder.

# This provides a simple local file path check tool in PowerShell for managing file system presence, adaptable for any file names or paths as needed.[1][2][3][4]

# [1](https://tachytelic.net/2019/05/check-file-exists-powershell/)
# [2](https://lazyadmin.nl/powershell/check-if-file-exists/)
# [3](https://stackoverflow.com/questions/31879814/check-if-a-file-exists-or-not-in-windows-powershell)
# [4](https://adamtheautomator.com/powershell-check-if-file-exists/)
# [5](https://www.youtube.com/watch?v=G10nIZo1uSI)
# [6](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-7.5)
# [7](https://netwrix.com/en/resources/guides/how-to--check-if-file-exists-powershell/)
# [8](https://www.lepide.com/how-to/find-a-file-and-check-if-it-exists-with-powershell.html)
# [9](https://www.pdq.com/blog/how-to-validate-powershell-to-check-for-existing-files/)
