# Eg. User name="admin", Password="admin" for this code sample.
$user = "admin"
$pass = "w$%MUvEm0c6C"

# Build auth header
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))

# Test Documentation must be attached each Feature ticket
# to-do