echo "Set Arch to Docker default"
echo @"
`$DOCKER_DISTRO = `"Arch`"
function docker {
    wsl -d $DOCKER_DISTRO docker -H unix:///mnt/wsl/shared-docker/docker.sock @Args
}
"@ >> $(echo $PROFILE)

Set-ExecutionPolicy RemoteSigned