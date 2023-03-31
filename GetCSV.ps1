# Split path
$Path = Split-Path -Parent "D:\Users\Documents\MDM\TCP\BoB\*.*"

# Create variable for the date stamp in log file
$LogDate = Get-Date -f yyyyMMddhhmm

# Define CSV and log file location variables
# They have to be on the same location as the script
$Csvfile = $Path + "\AllAzADUsers_$logDate.csv"

# Get all Azure AD users
$AzADUsers = Get-AzureADUser -All $true | Select-Object -Property *

# Display progress bar
$progressCount = 0
for ($i = 0; $i -le $AzADUsers.Count; $i++) {

Write-Progress `
-Id 0 `
-Activity "Retrieving User " `
-Status "$progressCount of $($AzADUsers.Count)" `
-PercentComplete (($progressCount / $AzADUsers.Count) * 100)

$progressCount++
}

# Create list
$AzADUsers | Sort-Object GivenName | Select-Object `
@{Label = "DisplayName"; Expression = { $_.DisplayName } },
@{Label = "UserPrincipalName"; Expression = { $_.UserPrincipalName } },
@{Label = "TelephoneNumber"; Expression = { $_.TelephoneNumber } } |


# Export report to CSV file
Export-Csv -Encoding UTF8 -Path $Csvfile -NoTypeInformation #-Delimiter ";"
