# Challenge 06 - Flag Local Services for Review
# Purpose: Check services and flag stopped services
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$services = @('EventLog', 'W32Time', 'Spooler')
$reviewCount = 0

foreach ($name in $services) {
    $service = Get-Service -Name $name

    if ($service.Status -eq 'Running') {
        Write-Output "$($service.Name): OK"
    }
    else {
        Write-Output "$($service.Name): REVIEW - $($service.Status)"
        $reviewCount = $reviewCount + 1
    }
}

Write-Output "Total services for REVIEW: $reviewCount"