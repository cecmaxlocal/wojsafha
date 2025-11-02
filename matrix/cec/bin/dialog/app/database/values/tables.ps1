# Here is a PowerShell script named `values.ps1` that creates and displays 
# tables of values. It demonstrates creating a simple data table using 
# PowerShell objects and outputting it in a readable table format:

# ```powershell
# values.ps1 - Create and display tables of values in PowerShell

# Define an array of custom objects representing table rows
$valuesTable = @(
    [PSCustomObject]@{ID=1; Name="Apple"; Category="Fruit"; Price=0.5},
    [PSCustomObject]@{ID=2; Name="Carrot"; Category="Vegetable"; Price=0.3},
    [PSCustomObject]@{ID=3; Name="Banana"; Category="Fruit"; Price=0.2},
    [PSCustomObject]@{ID=4; Name="Broccoli"; Category="Vegetable"; Price=0.8}
)

# Display the table in a formatted way
Write-Host "Values Table:"
$valuesTable | Format-Table -AutoSize

# Example: Filter and display only fruits
Write-Host "`nFiltered Table (Fruits only):"
$valuesTable | Where-Object { $_.Category -eq "Fruit" } | Format-Table -AutoSize
# ```

# Save this as `values.ps1`. Run it in PowerShell to see a table of values and an 
# example of filtered output.

# This approach uses built-in PowerShell objects and formatting cmdlets to simulate 
# structured tables and query/filter operations efficiently.
