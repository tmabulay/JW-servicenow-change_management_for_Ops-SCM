# JW-servicenow-change_management_for_Ops-SCM

Project Sponsor - Markus Ellinger
Stake holders 
- Internal: Jaya Alakkat
- External: N/A
Next Stage Gate - 
Scope: Production IT mainly using Azure DevOps repositories to make any changes on the system.

REASON FOR ACTION: 
1. Emergency“ (or at least „expedited“ / „urgent“) changes happen frequently(CAB meeting is the limiting factor)
2. Technical changes so difficult for CAB to actually assess risk of change
3. Small teams size (sometimes 1 developer per plant) does not allow segregation of duties
4. UAT before deployment not possible as test environments not available. If UAT is possible, second developer needs to manually confirm UAT due to licensing restrictions
5. High administrative burden for manual creation of necessary „paperwork“ in ServiceNow(especially prohibitive for small teams)

CHALLENGE/SOLUTION
?. Frequent and urgent changes
•. Offline review or ad-hoc meeting with approver instead of fixed dates for CAB meetings

?. Technically complicated changes
•. Separate CAB for Ops & SCM IT composed of IT managers instead of compliance managers (not required for SoX compliance)

?. Small teams size
•. Lift requirement for segregation of duties as long as process has been followed & CAB approval gained

?. UAT before deployment not possible / no test environments available
•. Verify change using other means (e.g. NC code simulation) before deployment, or
•. Jointly deploy software with user & confirm UAT immediately after

?. Manual confirmation for UAT by second developer
•. Use SCTASK email interaction for UAT confirmation

?. High administrative burden / manual „paperwork“
•. ServiceNow / Azure DevOps automation script


TASK
Create a powershell command Jwr that will automatically creates release and change requests in ServiceNow:
eg. jwr  create_release 2021-05-21 -complexity easy -verification moderate

•• stage1 •• Records are created with the given release number and preconfigured application name.
•• stage2 •• Risk assessment is filled out automatically using the given complexity / verification effort parameters.
•• stage3 •• History of changes is collected from Git commit history and recorded in the ServiceNow change request.

Note Required fields in change request generated from project defaults – can be overridden if needed.


Key Risk and Issue update
1. 

Planned Activity before next update
1.
