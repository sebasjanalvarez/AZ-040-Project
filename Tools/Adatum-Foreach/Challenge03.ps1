# Challenge 03 - Inspect Local Services
# Purpose: Check local service statuses
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$services = @('EventLog', 'W32Time', 'Spooler')

foreach ($name in $services) {
    $service = Get-Service -Name $name
    Write-Output "$($service.Name): $($service.Status)"
}