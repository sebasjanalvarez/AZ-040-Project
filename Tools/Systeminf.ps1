$Computer = "LON-SVR1"
$OS = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $Computer

$CDrive = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $Computer -Filter "DeviceID='C:'"

$Uptime = $OS.LocalDateTime - $OS.LastBootUpTime

$info = [PScustomObject]@{
    ComputerName = $computer
    OS = $OS.Caption
    LastBootUpTime = $OS.LastBootUpTime
    CDriveSize = $CDrive.Size
    CDriveFreeSpace = $CDrive.FreeSpace
    CDriveFreeSpaceGB = [math]::Round($CDrive.FreeSpace / 1GB, 2)
    UptimeHours = [math]::Round($Uptime.TotalHours, 2)
}
$info