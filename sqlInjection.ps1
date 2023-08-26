cls
# $url = "http://localhost:3000/api/Users?role=admin"
$url = "http://localhost:3000/rest/products/search?q=id=1&id=2"
$headers = @{
    'Authorization'='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjYsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJzb21lYm9keTRAbm9ib2R5LmNvbSIsInBhc3N3b3JkIjoiNjUyYTkwNmYxMTZlYmZjZmU2OGMxMTExODA5NDQ5ZTUiLCJyb2xlIjoiY3VzdG9tZXIiLCJkZWx1eGVUb2tlbiI6IiIsImxhc3RMb2dpbklwIjoiMC4wLjAuMCIsInByb2ZpbGVJbWFnZSI6Ii9hc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHQuc3ZnIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJ1cGRhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2OTI1NTg1NDl9.n4QR7dGfXGF-mnNS-XvOzczM33UfMb0dsSmZn9iywXXzttZjze9T-oD_4iqzKmntS_5X44UjsVY8pynsT6p5EoxwCflRvENiIPwB1MWaMk9Av5Ch5_ArjAbHlRgAj97bGrLzSRP-Y5jka63R_LQdM7hSXI8dTAf9TUph8j7uhhs'
    'Cookie'='language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; continueCode=W9knXzKOZqYdwkhOt9U5HWIrCniJUWfxpSL1uYnIPwUabFKWdReEP2abL5JN'
}
$irmSplat = @{
    'Uri' = $url
    'Headers' = $headers
    'Method' = 'Get'
}
$sqlResponse = $null
$sqlResponse = Invoke-WebRequest @irmSplat
$sqlResponse.Content
(($sqlResponse.Content) | ConvertFrom-Json).data