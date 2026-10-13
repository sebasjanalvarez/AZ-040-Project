param(
    [string]$ComputerName,
    [switch]$AlternateCredentials
)

if (-not $ComputerName) {
    $ComputerName = Read-Host "Enter computer name"
}

if ($AlternateCredentials) {
    $Credential = Get-Credential
}

$SessionOptions =@{}

if ($AlternateCredentials) {
    $SessionOptions.Credential = $Credential
}

$Session = New-CimSession -ComputerName $ComputerName @SessionOptions

Get-CimInstance -ClassName Win32_LogicalDisk -CimSession $Session -Filter "DriveType=3"

Remove-CimSession -CimSession $Session