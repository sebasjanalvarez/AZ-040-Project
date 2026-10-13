# Challenge 04 - Count Local Services
# Purpose: Count all local services using foreach
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$services = @(Get-Service)
$total = 0

foreach ($service in $services) {
    Write-Output $($service.Name)
    $total = $total + 1
}

Write-Output "Total services: $total"