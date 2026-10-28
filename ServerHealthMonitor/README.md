## Server Health Monitor

Project Overview:
Created a PowerShell-based system health monitoring tool that checks CPU utilization, RAM usage, and local disk storage. The script helps administrators identify potential resource issues and generates reports for system monitoring.

Features:
- Retrieves CPU utilization using Get-CimInstance.
- Calculates total RAM, available RAM, and RAM usage percentages.
- Monitors local disk storage and available free space.
- Displays red warnings when CPU or RAM usage exceeds 85%.
- Displays red warnings when disk free space falls below 15%.
- Displays green messages when resources are within configured thresholds.
- Shows actual CPU, RAM, and disk percentages.
- Exports disk information to DiskSpaceReport.csv.
- Generates a consolidated SystemHealthReport.csv with timestamps.

Tools Used:
- Windows PowerShell
- Visual Studio Code
- WMI/CIM
- GitHub

Testing:
Tested on LON-CL1 using CPU, RAM, and local disk information. Temporarily adjusted warning thresholds to confirm that both normal and warning messages displayed correctly.

Validation:
Successfully retrieved system resource information, calculated utilization percentages, displayed color-coded status messages, and generated CSV reports containing accurate system measurements.

Reflection:
Strengthened my understanding of PowerShell variables, calculated properties, foreach loops, if/else conditions, PSCustomObject, and CSV exports.