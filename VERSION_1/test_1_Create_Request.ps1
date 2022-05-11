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
$uri = "https://dev77211.service-now.com/api/now/table/sc_request"

# Specify HTTP method
$method = "post"

# Specify request body
$body = "{`"requested_for`":`"System Administrator`",`"short_description`":`"Change tool depth for lock milling of XYZ doors`",`"description`":`"Urgent! We have a bunch of XYZ doors here at the CNC mill we cannot produce as the tool depth for lock milling needs to be changed by 2mm for doors of type XYZ`",`"priority`":`"3`"}"

# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri -Body $body

# Print response
$response.result | 
    Select-Object number, requested_for, requested_by, region, priority, assignment_group, SCTASK

# REQ0010002
