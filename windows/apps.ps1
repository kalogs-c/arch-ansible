# Check if script is running with admin privileges
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script with administrative privileges (Run as administrator)." -ForegroundColor Red
    Exit 1
}

Write-Host "Set execution policy"
Set-ExecutionPolicy AllSigned

Write-Host "Install chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "Install postman"
choco install postman

Write-Host "Install docker desktop"
choco install docker-desktop

Write-Host "Install Discord"
choco install discord