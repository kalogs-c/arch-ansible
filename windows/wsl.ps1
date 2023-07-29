# PowerShell script to install WSL 2, Arch Linux, enable virtualization, and set default WSL version

# Check if script is running with admin privileges
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script with administrative privileges (Run as administrator)." -ForegroundColor Red
    Exit 1
}

# Enable WSL and WSL 2
Write-Host "Enabling WSL and WSL 2 feature..."
wsl --install

Write-Host "Opening install wsl update web page"
Start-Process -FilePath msedge -ArgumentList '--new-tab https://learn.microsoft.com/pt-br/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package'

Write-Host "Opening ArchWSL latest release"
Start-Process -FilePath msedge -ArgumentList '--new-tab https://github.com/yuk7/ArchWSL/releases/latest'

# Enable virtualization (Hyper-V)
Write-Host "Enabling virtualization (Hyper-V)..."
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Set WSL 2 as the default version
Write-Host "Setting WSL 2 as the default version..."
wsl --set-default-version 2

Write-Host "WSL 2 and Arch Linux setup completed successfully."
