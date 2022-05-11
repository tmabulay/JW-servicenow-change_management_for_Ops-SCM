# jwr create-release 2021-11-25 -complexity easy -verification moderate
# https://www.improvescripting.com/how-to-create-custom-powershell-cmdlet-step-by-step/


<# 1. CREATE CHANGE REQUEST
    INPUT DEFAULT

    INPUT TO ADD
        business_service
        caused_by_another_change: NO
        short_description
        description
        category
#> 
$business_service           = Read-Host -Prompt 'Business Service '
$caused_by_another_change   = Read-Host -Prompt 'Caused by another change(Y/N) '
$short_description          = Read-Host -Prompt 'Short Description '
$description                = Read-Host -Prompt 'Description '

<# 1. CREATE A RELEASE
    INPUT
        business_service
        priority
        change_request
        state
        assignment_group
        assigned_to
#> 














# PRINT ON SCREEN
    # Release RLSE0019760 and change CHG0140269 for "NCTool 2021-11-25" create in ServiceNow.
    # Risk assessed to "Moderate"

