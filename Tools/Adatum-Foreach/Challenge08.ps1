# Challenge 08 - Test Lab Network Responses
# Purpose: Test ICMP responses from lab computers
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
$replyCount = 0

foreach ($name in $computers) {
    $fqdn = "$name.Adatum.com"

    $reply = Test-Connection -ComputerName $fqdn -Count 1 -Quiet -ErrorAction SilentlyContinue

    if ($reply) {
        Write-Output "$fqdn : ICMP reply"
        $replyCount = $replyCount + 1
    }
    else {
        Write-Output "$fqdn : No ICMP reply"
    }
}

Write-Output "Total ICMP replies: $replyCount"