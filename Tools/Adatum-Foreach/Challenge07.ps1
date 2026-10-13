# Challenge 07 - Summarize Domain User Account States
# Purpose: Count enabled and disabled AD user accounts
# Run on: LON-CL1
# Name: Sebasjan Alvarez

Import-Module ActiveDirectory

$users = @(Get-ADUser -Filter * -SearchBase "DC=adatum,DC=com" -Server LON-DC1.Adatum.com -Properties Enabled)

$enabledCount = 0
$disabledCount = 0

foreach ($user in $users) {
    if ($user.Enabled) {
        Write-Output "$($user.SamAccountName): Enabled"
        $enabledCount = $enabledCount + 1
    }
    else {
        Write-Output "$($user.SamAccountName): Disabled"
        $disabledCount = $disabledCount + 1
    }
}

Write-Output "Enabled users: $enabledCount"
Write-Output "Disabled users: $disabledCount"
Write-Output "Total users: $($users.Count)"