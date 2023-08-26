0..12 | ForEach-Object {
    Write-Host "Fetching Cart: $_"
    $url = "http://localhost:3000/rest/basket/$($_)"
    $headers = @{
        'Authorization' = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjQsInVzZXJuYW1lIjoiU29tZW9uZSIsImVtYWlsIjoic29tZWJvZHkzQG5vYm9keS5jb20iLCJwYXNzd29yZCI6ImY0M2ViMzFhMWExYjk0ZWMyOGY3NTY5ODM2NWJiMDlmIiwicm9sZSI6ImFkbWluIiwiZGVsdXhlVG9rZW4iOiIiLCJsYXN0TG9naW5JcCI6IjAuMC4wLjAiLCJwcm9maWxlSW1hZ2UiOiIvYXNzZXRzL3B1YmxpYy9pbWFnZXMvdXBsb2Fkcy9kZWZhdWx0QWRtaW4ucG5nIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIwVDE4OjA3OjU1LjE1N1oiLCJ1cGRhdGVkQXQiOiIyMDIzLTA4LTIwVDE4OjU1OjQ2LjAwMVoiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2OTI1NTc3NDZ9.DId9-wA54pzwyk74-vcWqoRLjkESG-vJKLoSRyf7MGyqp1KGaBk7kEWCnbN4Ky_DkLxFBjIaPFfgKYrxkdePGeKBPmq8IUt97SHhQNmJSdKCaE3fI6XWIkkx4wokO3buh9SsMO56eqDxGqyUPnCrZBKEniujAzXaTsD_TmJmw50'
        'Cookie' = 'language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; continueCode=Mxl9Om3NR6bJBAJ3hYt9UjHOIjC3iQUwfEBSoauJ5IQxUkwdyWVZXQzL7rKv; token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjQsInVzZXJuYW1lIjoiU29tZW9uZSIsImVtYWlsIjoic29tZWJvZHkzQG5vYm9keS5jb20iLCJwYXNzd29yZCI6ImY0M2ViMzFhMWExYjk0ZWMyOGY3NTY5ODM2NWJiMDlmIiwicm9sZSI6ImFkbWluIiwiZGVsdXhlVG9rZW4iOiIiLCJsYXN0TG9naW5JcCI6IjAuMC4wLjAiLCJwcm9maWxlSW1hZ2UiOiIvYXNzZXRzL3B1YmxpYy9pbWFnZXMvdXBsb2Fkcy9kZWZhdWx0QWRtaW4ucG5nIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIwVDE4OjA3OjU1LjE1N1oiLCJ1cGRhdGVkQXQiOiIyMDIzLTA4LTIwVDE4OjU1OjQ2LjAwMVoiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2OTI1NTc3NDZ9.DId9-wA54pzwyk74-vcWqoRLjkESG-vJKLoSRyf7MGyqp1KGaBk7kEWCnbN4Ky_DkLxFBjIaPFfgKYrxkdePGeKBPmq8IUt97SHhQNmJSdKCaE3fI6XWIkkx4wokO3buh9SsMO56eqDxGqyUPnCrZBKEniujAzXaTsD_TmJmw50'
    }
    $cartResponse = Invoke-RestMethod -Method Get -Uri $url -Headers $headers
    $cartResponse
    $cartResponse.data
    $cartResponse.data.Products
}

# Add to carts
1..10 | Foreach-Object {
    $basketId = $_
    $url = 'http://localhost:3000/api/BasketItems/'
    $headers = @{
        # 'Authorization' = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjYsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJzb21lYm9keTRAbm9ib2R5LmNvbSIsInBhc3N3b3JkIjoiNjUyYTkwNmYxMTZlYmZjZmU2OGMxMTExODA5NDQ5ZTUiLCJyb2xlIjoiY3VzdG9tZXIiLCJkZWx1eGVUb2tlbiI6IiIsImxhc3RMb2dpbklwIjoiMC4wLjAuMCIsInByb2ZpbGVJbWFnZSI6Ii9hc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHQuc3ZnIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJ1cGRhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2OTI1NTg1NDl9.n4QR7dGfXGF-mnNS-XvOzczM33UfMb0dsSmZn9iywXXzttZjze9T-oD_4iqzKmntS_5X44UjsVY8pynsT6p5EoxwCflRvENiIPwB1MWaMk9Av5Ch5_ArjAbHlRgAj97bGrLzSRP-Y5jka63R_LQdM7hSXI8dTAf9TUph8j7uhhs'
        # 'Cookie' = 'language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; continueCode=W9knXzKOZqYdwkhOt9U5HWIrCniJUWfxpSL1uYnIPwUabFKWdReEP2abL5JN; token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjYsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJzb21lYm9keTRAbm9ib2R5LmNvbSIsInBhc3N3b3JkIjoiNjUyYTkwNmYxMTZlYmZjZmU2OGMxMTExODA5NDQ5ZTUiLCJyb2xlIjoiY3VzdG9tZXIiLCJkZWx1eGVUb2tlbiI6IiIsImxhc3RMb2dpbklwIjoiMC4wLjAuMCIsInByb2ZpbGVJbWFnZSI6Ii9hc3NldHMvcHVibGljL2ltYWdlcy91cGxvYWRzL2RlZmF1bHQuc3ZnIiwidG90cFNlY3JldCI6IiIsImlzQWN0aXZlIjp0cnVlLCJjcmVhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJ1cGRhdGVkQXQiOiIyMDIzLTA4LTIwIDE5OjA4OjM5LjMxMyArMDA6MDAiLCJkZWxldGVkQXQiOm51bGx9LCJpYXQiOjE2OTI1NTg1NDl9.n4QR7dGfXGF-mnNS-XvOzczM33UfMb0dsSmZn9iywXXzttZjze9T-oD_4iqzKmntS_5X44UjsVY8pynsT6p5EoxwCflRvENiIPwB1MWaMk9Av5Ch5_ArjAbHlRgAj97bGrLzSRP-Y5jka63R_LQdM7hSXI8dTAf9TUph8j7uhhs'
        'Content-Type' = 'application/json'
    }
    $payload = @{
        'BasketId' = "$basketId"
        'ProductId' = 24
        'quantity' = 1
    }
    $response = Invoke-WebRequest -Method Post -Uri $url -Headers $headers -Body $payload -SkipHttpErrorCheck
    # $response.StatusCode
    [PSCustomObject]@{
        'BasketId' = $basketId
        'StatusCode' = $response.StatusCode
    }
    # Invoke-RestMethod -Uri $url -Headers $headers -Method Post -Body $payload
}