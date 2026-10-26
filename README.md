# AZ-040-Project
This is my first repo that was cloned from Github

## Challenge 01 - List the Lab Computers

Run Location: LON-CL1

Result:
- Computer: LON-CL1
- Computer: LON-DC1
- Computer: LON-SVR1

Validation: Successfully displayed all three lab computers in the correct order.

Reflection: $computers stores the entire collection, while $computer holds one computer at a time.

## Challenge 02 - Build Domain Qualified Names

Run Location: LON-CL1

Result:
- LON-CL1.adatum.com
- LON-DC1.adatum.com
- LON-SVR1.adatum.com

Validation: Successfully displayed all three fully qualified domain names.

Reflection: No, displaying a domain name does not prove the computer is reachable. Thhe script only combines the computer name and domain into text without testing connectivity.

## Challenge 03 - Inspect Local Services

Run Location: LON-CL1

Result:
- EventLog: Running
- W32Time: Running
- Spooler: Running

Validation: Successfully displayed all three services and their current statuses.

Reflection: Service statuses can differ between students because their computers may have different configurations, settings, or running processes.

## Challenge 04 - Count Local Services

Run Location: LON-CL1

Result:
- Displayed all local service names
- Total services: 256

Validation: Successfully counted all 256 services using a foreach loop. Verified the total matched (Get-Service).Count.

Reflection: If the counter resets inside the loop, it starts back at zero each time, resulting in an incorrect total.

## Challenge 05 - Read the Domain Computer Inventory

Run Location: LON-CL1

Result:
- LON-CL1 | LON-CL1.Adatum.com | Windows 10 Enterprise
- LON-DC1 | LON-DC1.Adatum.com | Windows Server 2019 Datacenter Evaluation
- LON-SVR1 | LON-SVR1.Adatum.com | Windows Server 2019 Datacenter Evaluation

Validation: Successfully retrieved all three computer records from Active Directory.

Reflection: This is directory information stored in Active Directory, not a live operating system query. The information may not always reflect the computer's current state. 

## Challenge 06 - Flag Local Services for Review

Run Location: LON-CL1

Result:
- EventLog: OK
- W32Time: OK
- Spooler: OK
- Total services for REVIEW: 0

Validation: Successfully checked all three services using a foreach loop and if/else statements. All services were running, so none required review.

Reflection: A stopped service is not always a problem because some services are designed to run only when needed or may be intentionally disabled.

## Challenge 07 - Summarize Domain User Account States

Run Location: Lon-CL1

Result: 
- Enabled users: 251
- Disabled users: 12
- Total users: 263

Validation: Successfully retrieved all 263 Active Directory user accounts. The enabled and disabled counts add up to the total numbers of users.

Reflection: Enabled tells us whether an account is allowed to sign in, but it foes not confirm that the user is currently signed in or that a sign in attempt will succeed.

## Challenge 08 - Test Lab Network Responses

Run Location: LON-CL1

Results:
- LON-CL1,Adatum: ICMP reply
- LON-DC1.Adatum.com: ICMP reply
- LON-SVR1.Adatum.com: ICMP reply
- Total ICMP replies: 3

Validation: Successfully tested all three computers using Test-Connection. All three responded to ICMP requests.

Reflection: An ICMP reply confirms network responsiveness but does not prove PowerShell remoting works. PowerShell remoting requires additional configuration and permissions.

## Challenge 09 - Export a Computer Account Report

Run Location: LON-CL1

Results:
- LON-CL1 | Windows 10 Enterprise | Enabled
- LON-DC1 | Windows Server 2019 Datacenter Evaluation | Enabled
- LON-SVR1 | Windows Server 2019 Datacenter Evaluation | Enabled
- Total records: 3
- CSV exported successfully

Validation: Successfully eported and imported three computer records with four columns.

Reflection: Exporting objects instead of formatted strings preserves structured data, making it easier to filter, sort, and analyze.

## Challenge 10 - Review Services on the Member Server

Run Location: LON-CL1

Results:
- LON-SVR1.Adatum.com | EventLog | Running | OK
- LON-SVR1.Adatum.com | Spooler | Running | OK
- LON-SVR1.Adatum.com | W32Time | Running | OK

Validation: Successfully retrieved all three servicesremotely from LON-SVR1 using Invoke-Command.

Reflection: Invoke-Command runs the service query on LON-SVR1, while the foreach loops and status checks run on LON-CL1.


## Project - Disk Space Checker

Project Overview:
Created a PowerShell script to monitor local disk storage and identify drives with low available space.

Features:
- Retrieves local disk information using Get-CimInstance.
- Displays total storage and free space in GB.
- Calculates available disk space percentages.
- Displays a red warning below 15% free space.
- Displays a green message when spaace is sufficient.
- Exports results into a CSV file.

Tools Used:
- Windows PowerShell
- Visual Studio Code
- WMI/CIM
- GitHub

Testing:
Tested on LON;CL1 using the C: and E: drives. Temporarily changed the threshold to 90% to verify the warning system, then restored it to 15%.

Validation:
Successfully retrieved disk information, displayed the correct status messages, and exported a CSV report.

Reflection:
Learned how to use PowerShell variables, foreach loops, if/else conditions, calculated properties, and CSV exports.