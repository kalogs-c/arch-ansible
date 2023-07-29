# Check if script is running with admin privileges
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script with administrative privileges (Run as administrator)." -ForegroundColor Red
    Exit 1
}

echo "Set Arch to Docker default"
echo @"
`$DOCKER_DISTRO = `"Arch`"
function docker {
    wsl -d $DOCKER_DISTRO docker -H unix:///mnt/wsl/shared-docker/docker.sock @Args
}
"@ >> $(echo $PROFILE)

Set-ExecutionPolicy RemoteSigned