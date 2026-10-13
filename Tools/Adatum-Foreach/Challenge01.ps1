# Challenge 01 - List the Lab Computers
# Purpose: Display the three lab computers
# Run on: LON-CL1
# Name: Sebasjan Alvarez

$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

foreach ($computer in $computers) {
    Write-Output "Computer: $computer"
}