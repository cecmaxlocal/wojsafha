# Here is a PowerShell script named `pathLocal.ps1` that obtains and displays 
# the current local directory path and the script file's own directory path. 
# This helps in accessing local files relative to the current execution 
# environment:

# ```powershell
# pathLocal.ps1 - Display current local and script directory paths

# Get the current working directory (where PowerShell is running)
$currentDirectory = Get-Location
Write-Host "Current working directory (local path): $currentDirectory"

# Get the folder where this script file is located
# Uses $MyInvocation.MyCommand.Path to get full script path and extracts directory
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "Script file directory path: $scriptDirectory"
# ```

# Usage:
# - Save as `pathLocal.ps1`.
# - Run in PowerShell.
# - Prints the directory path where you are running PowerShell plus the folder where the script file itself resides.
# - Helpful for managing local file access and path-based operations within scripts.

# This method covers both your current session directory and the absolute location of the script, enabling flexible path handling in PowerShell automation workflows.[2][4][5]

# [1](https://www.reddit.com/r/PowerShell/comments/6ki2a4/how_do_i_search_for_a_file_and_return_the/)
# [2](https://www.sean-lloyd.com/post/get-path-relative-script-location-powershell/)
# [3](https://www.youtube.com/watch?v=5cKhJlEYJ50)
# [4](https://stackoverflow.com/questions/5466329/whats-the-best-way-to-determine-the-location-of-the-current-powershell-script)
# [5](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-location?view=powershell-7.5)
# [6](https://www.itprotoday.com/powershell/how-to-find-a-file-s-path-in-powershell)
# [7](https://learn.microsoft.com/en-us/powershell/scripting/samples/working-with-files-and-folders?view=powershell-7.5)
# [8](https://netwrix.com/en/resources/guides/how-to--check-if-file-exists-powershell/)
