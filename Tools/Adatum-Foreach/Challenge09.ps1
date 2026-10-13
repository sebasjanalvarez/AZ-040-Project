# Challenge 09 - Export a Computer Account Report
# Purpose: Export AD computer information to CSV
# Run on: LON-CL1
# Name: Sebasjan Alvarez

Import-Module ActiveDirectory

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

$report = @(foreach ($name in $computers) {

    $computer = Get-ADComputer -Identity $name -Server LON-DC1.Adatum.com -Properties OperatingSystem, Enabled

    if ($computer.Enabled) {
       $accountState = 'Enabled'
    }
    else {
        $accountState = 'Disabled'
    }
    [PSCustomObject]@{
        ComputerName = $computer.Name
        DNSHostName = $computer.DNSHostName
        OperatingSystem = $computer.OperatingSystem
        AccountState = $accountState
    }
})

$csvPath = Join-Path $PSScriptRoot 'Challenge09-ComputerReports.csv'

$report | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Write-Output "CSV exported to: $csvPath"
Write-Output "Total records: $(@(Import-Csv -Path $csvPath).Count)"

Import-CSV -Path $csvPath