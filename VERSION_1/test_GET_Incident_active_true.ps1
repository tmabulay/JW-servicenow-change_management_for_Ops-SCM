﻿# Eg. User name="admin", Password="admin" for this code sample.
$user = "admin"
$pass = "w$%MUvEm0c6C"

# Build auth header
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))

# Set proper headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',('Basic {0}' -f $base64AuthInfo))
$headers.Add('Accept','application/json')


# Specify endpoint uri
$uri = "https://dev77211.service-now.com/api/now/table/incident?sysparm_query=active%3Dtrue&sysparm_fields=number%2Csys_created_by&sysparm_limit=10"

# Specify HTTP method
$method = "get"




# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri 

# Print response
$response.result | select number, sys_id, sys_updated_by