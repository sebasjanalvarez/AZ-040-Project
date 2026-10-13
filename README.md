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