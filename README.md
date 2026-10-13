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