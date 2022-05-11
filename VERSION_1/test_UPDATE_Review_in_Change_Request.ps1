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
$uri = "https://dev77211.service-now.com/api/now/table/change_request/37758d36875b0110113aeb173cbb3591"

# Specify HTTP method
$method = "put"

# Specify request body
$body = "{`"review_status`":`"1`",`"close_code`":`"Successful`",`"close_notes`":`"All is okay and is working`"}"

# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri -Body $body

# Print response
$response.Result