# Here is a PowerShell script named `pathCurrent.ps1` that retrieves and displays 
# the current working directory path where the script is running:

# ```powershell
# pathCurrent.ps1 - Display current directory path

# Get current location path
$currentPath = Get-Location

# Print the current directory path to the console
Write-Host "Current directory path is: $currentPath"
```

# If you want the directory path of the script file itself (not necessarily 
# the working directory if run from another location), use:

# ```powershell
# Get directory of the running script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "Script directory path is: $scriptPath"
# ```

# Save this as `pathCurrent.ps1`. Running it in PowerShell will show 
# the current working folder or script folder path depending on which 
# approach you use.

# This script is helpful for local file handling or dynamic path 
# calculations within PowerShell scripts.[2][4][7]

# [1](https://www.youtube.com/watch?v=wUHIDsGfVL4)
# [2](https://learn.microsoft.com/en-us/powershell/scripting/samples/managing-current-location?view=powershell-7.5)
# [3](https://stackoverflow.com/questions/8343767/how-to-get-the-current-directory-of-the-cmdlet-being-executed)
# [4](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-location?view=powershell-7.5)
# [5](https://www.reddit.com/r/PowerShell/comments/mgbf0a/executing_script_in_current_location/)
# [6](https://forums.powershell.org/t/running-script-to-get-current-directory/5044)
# [7](https://www.tutorialspoint.com/how-to-get-the-path-of-the-currently-executing-script-in-powershell)
# [8](https://community.spiceworks.com/t/powershell-script-find-and-replace-directories/1235911)
