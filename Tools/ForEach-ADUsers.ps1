New-ADOrganizationalUnit -Name "Disabled Users" -Path "DC=Adatum,DC=com"
Get-ADOrganizationalUnit -Identity "OU=Disabled Users,DC=Adatum,DC=com"
Get-ADOrganizationalUnit -Filter 'Name -eq "Marketing"' | Select-Object Name, DistinguishedName
Get-ADUser -Filter 'Name -like "A*"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" | Select-Object Name, SamAccountName
Get-ADUser -Filter 'Name -like "A*"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" | Disable-ADAccount
Get-ADUser -Filter 'Name -like "A*"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" | Select-Object Name, Enabled
Set-ADUser -Identity "Annie" -Department "IT"
Get-ADUser -Identity "Annie" -Properties Department | Select-Object Name, Department
Get-ADUser -Filter 'Enabled -eq $false -and Department -eq "Marketing"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Properties Department | Select-Object Name, Department, Enabled
Get-ADUser -Filter 'Name -like "A*"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Properties Department | Select-Object Name, Department, Enabled
Get-ADUser -Filter {Name -like "A*" -and Name -ne "Annie Conner"} -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Properties Department | Select-Object Name, Department
Get-ADUser -Filter 'Enabled -eq $false' -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Properties Department | Select-Object Name, Department
$users = @(Get-ADUser -Filter 'Enabled -eq $false -and Department -eq "Business Development"' -SearchBase "OU=Marketing,DC=Adatum,DC=com" -Properties Department)
foreach ($user in $users) {
    Write-Host $user.Name
}
$users | Select-Object Name, Department | Export-Csv -Path "C:\DisabledMarketingUsers.csv" -NoTypeInformation
foreach ($user in $users) {
    Move-ADObject -Identity $user.DistinguishedName -TargetPath "OU=Disabled Users,DC=Adatum,DC=com"
}
$users =@(Get-ADUser -Filter 'Enabled -eq $false' -SearchBase "OU=Disabled Users,DC=Adatum,DC=com")

foreach ($user in $users) {
    Move-ADObject -Identity $user.DistinguishedName -TargetPath "OU=Marketing,DC=Adatum,DC=com"
}
$users = @(Get-ADUser -Filter 'Enabled -eq $false' -SearchBase "OU=Marketing,DC=Adatum,DC=com")

foreach ($user in $users) {
    Write-Host "Moving $($user.Name)"
    Move-ADObject -Identity $user.DistinguishedName -TargetPath "OU=Disabled Users,DC=Adatum,DC=com"
}