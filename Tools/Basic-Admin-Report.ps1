Get-CimInstance -ClassName Win32_ComputerSystem |
Select-Object Name, Manufacturer, Model, Domain
$system = Get-CimInstance -ClassName Win32_ComputerSystem
$system
$system.Name
$system.Manufacturer
$system.Model
$system.Domain
$system | Select-Object Name, Model
$system | Get-Member -MemberType Property
$system.NumberOfLogicalProcessors
$computerReport = $system |
Select-Object Name, Manufacturer, Model, Domain,
NumberOfLogicalProcessors
$computerReport
$bios = Get-CimInstance -ClassName Win32_BIOS
$bios
$bios.Manufacturer
$bios.SMBIOSBIOSVersion
$bios.SerialNumber
$biosReport = $bios |
Select-Object Manufacturer, SMBIOSBIOSVersion, SerialNumber
$biosReport
$reportProperties = @{
    ComputerName = $system.Name
    Manufacturer = $system.Manufacturer
    Model = $system.Model
    Domain = $system.Domain
    LogicalProcessors = $system.NumberOfLogicalProcessors
    BIOSManufacturer = $bios.Manufacturer
    BIOSVersion = $bios.SMBIOSBIOSVersion
    SerialNumber = $bios.SerialNumber  
    BIOSReleaseDate = $bios.ReleaseDate
}
$reportProperties
$reportProperties['ComputerName']
$adminReport = [PSCustomObject]$reportProperties
$adminReport
$adminReport | Get-Member -MemberType NoteProperty
$adminReport.ComputerName
$adminReport | Select-Object ComputerName, Model, BIOSVersion
$reportFolder = $env:USERPROFILE
$reportFolder
$csvPath = Join-Path $reportFolder "AdminReport.csv"
$adminReport | Export-Csv -Path $csvPath -NoTypeInformation
Test-Path $csvPath
Import-Csv -Path $csvPath
Import-Csv -Path $csvPath | Format-Table -AutoSize
Import-Csv -Path $csvPath | Format-List
Invoke-Item -Path $csvPath
$adminReport | Select-Object ComputerName, Domain
$adminReport | Select-Object Domain, ComputerName
$bios | Get-Member
$bios.ReleaseDate