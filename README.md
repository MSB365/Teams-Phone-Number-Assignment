This script is intended to help assign or change telephone numbers.
Especially when migrating to Microsoft Teams Enterprise Voice from other telephony solutions, an entire company can be processed with this script.

In order to be able to use the script, it requires a corresponding CSV file, which must have the following structure:
"UserPrincipalName", "DisplayName", "TelephoneNumber".

To make it easier and faster to collect this information, there is a second script in this repository (GetCSV.ps1).
This creates a CSV by exporting the current Azure Active Directory entries.
If the phone numbers are stored in Azure, the CSV file does not need to be edited and can be used directly for further processing.
Otherwise, the corresponding telephone numbers still have to be added.

Application example:

Login Azure Active Directory
Connect-AzureAD

Note: This module will be retired soon. After that, this module will no longer work.

Adjust destination in script GetCSV.ps1 (line 2)

GetCSV.ps1

If required: Modification created CSV

Connection to Microsoft Teams
Connect-MicrosoftTeams

PhoneNumberAssignment.ps1

Follow the instructions in the script. (This script does not need to be edited before use).

FAQ's.

Do either of the two scripts need to be edited before use?
Yes, the script GetCSV.ps1 must be edited in line 2! The path where the CSV is to be saved must be defined.

Which Phone Number Types are supported in the PhoneNumberAssignment.ps1 script?
The script supports the "-PhoneNumberType" DirectRouting and OperatorConnect.

What format must the CSV have?
"UserPrincipalName", "DisplayName", "TelephoneNumber".

Can I use these scripts commercially?
Yes! These scripts may be used commercially and modified. The scripts may not be sold and the source must be indicated when passing them on.
The source is: https://www.msb365.blog
However, we do not assume any liability for possible misconfigurations or problems. We therefore recommend that you first test these scripts in a LAB to see whether they meet the requirements.
