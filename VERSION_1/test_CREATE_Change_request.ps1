# Eg. User name="admin", Password="admin" for this code sample.
$user = "admin"
$pass = "w$%MUvEm0c6C"

# Build auth header
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))

# Set proper headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',('Basic {0}' -f $base64AuthInfo))
$headers.Add('Accept','application/json')
$headers.Add('Content-Type','application/json')

# Specify endpoint uri
$uri = "https://dev77211.service-now.com/api/now/table/change_request"

# Specify HTTP method
$method = "post"

# Specify request body
# `"Downtime_Required`":`"True`" OR `"False`"
# `"Validator`":`"True`" OR `"False`"
# `"Test_Results`":`"N/A`"
# `"Training Plan`":`"N/A`"
# `"Communication Plan`":`"user will be informed after deployment`"
# `"SOX`":`"True`" OR `"False`"
$body = "{`"requested_by`":`"Teodoro Gaboury`",`"cab_required`":`"true`",`"cab_date`":`"13-07-2022`",`"short_description`":`"Active Directory Clean-up`",`"description`":`"Clean Up ACtive Directory for old un-used accounts`",`"type`":`"Normal`",`"justification`":`"We have too many accounts that are not used in or AD`",`"implementation_plan`":`"Create exports lists from the AD with Last Log-on Date and file the old unused account for decision`",`"risk`":`"Active accounts can be deleted by mistakes`",`"backout_plan`":`"Deleted accounts can be restored within 30 days`",`"test_plan`":`"N/A`",`"start_date`":`"19-07-2021 14:00:00`", `"assignment_group`":`"App Engine Admins`", `"end_date`":`"19-07-2021 15:00:00`"}"

# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri -Body $body

# Print response
$response.result | Select-Object number, sys_id, sys_updated_by
