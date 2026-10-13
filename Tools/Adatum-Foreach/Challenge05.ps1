# Challenge 05 - Read the Domain Computer Inventory
# Purpose: Retrieve computer information from Active Directory
# Run on: LON-CL1
# Name: Sebasjan Alvarez

Import-Module ActiveDirectory

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

foreach ($name in $computers) {
    $computer = Get-ADComputer -Identity $name -Server LON-DC1.Adatum.com -Properties OperatingSystem

    Write-Output "$($computer.Name) | $($computer.DNSHostName) | $($computer.OperatingSystem)"
}