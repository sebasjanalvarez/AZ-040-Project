## Disk Space Checker

Project Overview:
Created a PowerShell script that monitors local disk storage and identifies drives with low available space. This project demonstrates basic system administration automation using PowerShell.

Features:
- Retrieves local disk information using Get-CimInstance.
- Displays total storage and available free space in GB.
- Calculates the percentage of free disk space.
- Displays red warnings when free space falls below 15%.
- Displays green messages when disk space is sufficient.
- Exports disk information to DiskSpaceReport.csv.

Tools Used:
- Windows PowerShell
- Visual Studio Code
- WMI/CIM
- GitHub

Testing:
Tested on LON-CL1 using the C: and E: drives. Temporarily increased the warning threshold to 90% to verify that warning messages appeared correctly, then restored it to 15%.

Validation:
Successfully retrieved disk information, calculated available storage percentages, displayed the correct warning messages, and exported a CSV report.

Reflection:
Learned how to use PowerShell variables, calculated properties, foreach loops, if/else statements, and CSV exports to automate disk monitoring.
