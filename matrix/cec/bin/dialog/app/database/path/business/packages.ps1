# Here is a PowerShell script named `businessPackages.ps1` that lists 
# installed software packages on the local machine with their installation 
# paths, leveraging PowerShell's PackageManagement module. It retrieves 
# package names and their install location paths in a simple table:

# ```powershell
# businessPackages.ps1 - List installed packages with their install paths

# Get all installed packages
$packages = Get-Package

# Create output table with Name and Installed Location if available
$result = foreach ($pkg in $packages) {
    $installPath = ""
    
    # Try to get installation path if available (not all packages have this)
    if ($pkg.PSObject.Properties.Match("InstallLocation")) {
        $installPath = $pkg.InstallLocation
    }

    [PSCustomObject]@{
        Name = $pkg.Name
        Version = $pkg.Version
        Source = $pkg.Source
        InstallLocation = $installPath
    }
}

# Display the table sorted by package name
$result | Sort-Object Name | Format-Table -AutoSize
# ```

# Usage:
# - Save as `businessPackages.ps1`.
# - Run in an elevated PowerShell prompt.
# - It shows installed packages with their version, source, and install location if available.

# This script helps locate business-related software packages and their installation paths on Windows using PowerShell's built-in PackageManagement capabilities.[4][5][6]

# [1](https://www.powershellgallery.com/packages/batarang/1.2/Content/Apps%5CGet-NAVAppDependencies.ps1)
# [2](https://learn.microsoft.com/en-us/powershell/module/packagemanagement/find-package?view=powershellget-2.x)
# [3](https://learn.microsoft.com/en-us/answers/questions/1182407/how-to-retrieve-appx-package-install-location-in-p)
# [4](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-location?view=powershell-7.5)
# [5](https://stackoverflow.com/questions/47884710/how-to-get-a-programs-installation-path-using-powershell)
# [6](https://learn.microsoft.com/en-us/powershell/module/packagemanagement/get-package?view=powershellget-2.x)
# [7](https://docs.chocolatey.org/en-us/create/functions/)
# [8](https://www.youtube.com/watch?v=L7d-f7mcDto)
# [9](https://github.com/PowerShell/PowerShell)
