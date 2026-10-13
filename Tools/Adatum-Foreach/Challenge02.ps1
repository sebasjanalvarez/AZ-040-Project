# Challenge 02 - Build Domain Qualified Names
# Purpose: Display fully qualified domain names
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
$domain = 'adatum.com'

foreach ($computer in $computers) {
    Write-Output "$computer.$domain"
}