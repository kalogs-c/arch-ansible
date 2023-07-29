if ! command -v ansible-playbook > /dev/null; then
    echo "Install Ansible"
    pacman -S ansible
fi

echo "Running Ansible Playbook"
ansible-playbook ansible/playbook.yaml

if ! command -v npm > /dev/null; then
    echo "Download Nodejs using asdf"
    asdf plugin add nodejs
    asdf install nodejs latest
    asdf global nodejs latest
fi

if command -v gh > /dev/null; then
    echo "Auth to github cli"
    gh auth login
fi

if command -v gcloud > /dev/null; then
    echo "Auth to gcloud cli"
    gcloud init
fi