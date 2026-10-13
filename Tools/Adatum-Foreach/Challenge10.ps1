# Challenge 10 - Review Services on the Member Server
# Purpose: Check remote services using foreach and if/else
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$targets = @('LON-SVR1.Adatum.com')  # Example targets, replace with actual server names

foreach ($target in $targets) {
    try {
        $services = @(Invoke-Command -ComputerName $target -ScriptBlock {
        Get-Service -Name 'EventLog', 'W32Time', 'Spooler' -ErrorAction Stop
        } -ErrorAction Stop)

    foreach ($service in $services) {
        if ($service.Status -eq 'Running') {
            Write-Output "$target | $($service.Name) | $($service.Status) | OK"
        }
        else {
            Write-Output "$target | $($service.Name) | $($service.Status) | REVIEW"
        }
    }
}
catch {
    Write-Output "QUERY FAILED: $target | $($_.Exception.Message)"
}
}