echo "Install Ansible"
pacman -S ansible

echo "Running Ansible Playbook"
ansible-playbook ansible/playbook.yaml

echo "Download Nodejs using asdf"
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

echo "Opening Neovim"
vim