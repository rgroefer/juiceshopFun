# Generate a new user in the shop
$url = 'http://localhost:3000/api/Users/'
# 4..4 | ForEach-Object {
    $email = "nobody@nobody.com"
    $password = "friends"
    $passwordRepeat = "friends"
    $payload = @{
        'email' = $email
        # 'email' = ''
        'password' = $password
        'passwordRepeat' = $passwordRepeat
        'securityAnswer' = 'somebody'
        'role' = 'customer'
        # 'deluxeToken' = '8f70e0f4b05685efff1ab979e8f5d7e39850369309bb206c2ad3f7d51a1f4e40'
        # 'isActive' = 'true'
        'securityQuestion' = @{
            'createdAt' = '2023-08-11T23:36:08.954Z'
            'id' = 1
            'question' = 'Your eldest siblings middle name?'
            'updatedAt' = '2023-08-11T23:36:08.954Z'
        }
    }
# }
$headers = @{
    'Host'= 'localhost:3000'
    'User-Agent'= 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0'
    'Accept'= 'application/json, text/plain, */*'
    'Accept-Language'= 'en-US,en;q=0.5'
    'Accept-Encoding'= 'gzip, deflate, br'
    'Content-Type'= 'application/json'
    'Content-Length'= '254'
    'Origin'= 'http://localhost:3000'
    'Connection'= 'keep-alive'
    'Referer'= 'http://localhost:3000/'
    'Cookie'= 'language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; continueCode=r7RY2V5yXolm4nLzP6Eadj5twUrHjC5fbkUgeF3rAQ9Mb1kJOpqDWg38xBwj'
    # 'Sec-Fetch-Dest'= 'empty'
    # 'Sec-Fetch-Mode'= 'cors'
    # 'Sec-Fetch-Site'= 'same-origin'
    # 'Authorization' = $null
    # 'Authorization'='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MSwidXNlcm5hbWUiOiIiLCJlbWFpbCI6ImFkbWluQGp1aWNlLXNoLm9wIiwicGFzc3dvcmQiOiIwMTkyMDIzYTdiYmQ3MzI1MDUxNmYwNjlkZjE4YjUwMCIsInJvbGUiOiJhZG1pbiIsImRlbHV4ZVRva2VuIjoiIiwibGFzdExvZ2luSXAiOiJ1bmRlZmluZWQiLCJwcm9maWxlSW1hZ2UiOiJhc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHRBZG1pbi5wbmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjMtMDgtMDUgMTQ6NTQ6MjkuNzE0ICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjMtMDgtMDUgMTg6NDQ6MzIuNTAyICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY5MTQ0MTU3N30.h7lJOUwtJyTbAWTvLfEf5r_sarxlay1mxqJad6y_ItmiUmMYnr5sfaF8lHFdhDUhPXfJQ9EUYI4X2vHK0J7eWg8tT-uGe7fnpzhBl6CeyqDTeyCrCKtLQhM_3mijRzHm05lOEFjik9AeAA2qN0UJMRzpxD3Lc--a8dUrYCyIDw0'
}
$response = $null
$response = Invoke-RestMethod -Method Post -Uri $url -Body $payload #-Headers $headers 
$response