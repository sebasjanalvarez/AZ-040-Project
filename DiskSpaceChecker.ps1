$disks = Get-CimInstance -ClassName Win32_logicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
    @{Name="TotalGB";Expression={[math]::Round($_.Size/1GB,2)}},
    @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace/1GB,2)}},
    @{Name="FreePercent";Expression={[math]::Round(($_.FreeSpace/$_.Size)*100,2)}}

    foreach ($disk in $disks) {
        if ($disk.FreePercent -lt 15) {
            Write-Host "WARNING: $($disk.DeviceID) has low disk space!" -ForegroundColor Red
        }
        else {
            Write-Host "OK: $($disk.DeviceID) has enough free space." -ForegroundColor Green
        }
    }

    $disks | Export-Csv -Path "$PSScriptRoot\DiskSpaceReport.csv" -NoTypeInformation