$cpu = Get-CimInstance -ClassName Win32_Processor |
Select-Object Name, LoadPercentage

if ($cpu.LoadPercentage -gt 85) {
    Write-Host "WARNING: CPU usage is high! ($($cpu.LoadPercentage)%)" -ForegroundColor Red
}
else {
    Write-Host "OK: CPU usage is normal. ($($cpu.LoadPercentage)%)" -ForegroundColor Green
}

$ram = Get-CimInstance -ClassName Win32_OperatingSystem |
Select-Object @{Name="TotalRAMGB";Expression={[math]::Round($_.TotalVisibleMemorySize / 1MB, 2)}},
    @{Name="FreeRAMGB";Expression={[math]::Round($_.FreePhysicalMemory / 1MB, 2)}},
    @{Name="RAMUsedPercent";Expression={[math]::Round((1 - ($_.FreePhysicalMemory / $_.TotalVisibleMemorySize)) * 100, 2)}}

if ($ram.RAMUsedPercent -gt 85) {
    Write-Host "WARNING: RAM usage is high! ($($ram.RAMUsedPercent)%)" -ForegroundColor Red
}
else {
    Write-Host "OK: RAM usage is normal. ($($ram.RAMUsedPercent)%)" -ForegroundColor Green
}


$disks = Get-CimInstance -ClassName Win32_logicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
    @{Name="TotalGB";Expression={[math]::Round($_.Size/1GB,2)}},
    @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace/1GB,2)}},
    @{Name="FreePercent";Expression={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}}

    foreach ($disk in $disks) {
        if ($disk.FreePercent -lt 15) {
            Write-Host "WARNING: $($disk.DeviceID) has low disk space! ($($disk.FreePercent)% free)" -ForegroundColor Red
        }
        else {
            Write-Host "OK: $($disk.DeviceID) has enough free space. ($($disk.FreePercent)% free)" -ForegroundColor Green
        }
    }

    $disks | Export-Csv -Path "$PSScriptRoot\DiskSpaceReport.csv" -NoTypeInformation

    $healthReport = [PSCustomObject]@{
        Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        ComputerName = $env:COMPUTERNAME
        CPUPercent = $cpu.LoadPercentage
        RAMPercent = $ram.RAMUsedPercent
        CDriveFreePercent = ($disks | Where-Object DeviceID -eq "C:").FreePercent
        EDriveFreePercent = ($disks | Where-Object DeviceID -eq "E:").FreePercent
    }

    $healthReport | Export-Csv -Path "$PSScriptRoot\SystemHealthReport.csv" -NoTypeInformation