#!/bin/env bash

sudo dnf update
sudo dnf install git -y
sudo dnf install python3-pip -y
git --version
pip3 --version
# sudo pip3 install --upgrade pip
sudo pip3 install ansible
ansible --version

git clone https://github.com/vaheedgithubac/exp-ansible-roles-sws.git
ansible-playbook -i localhost, -c local exp-ansible-roles-sws/main.yml -e component=frontend -e env=dev

git clone https://github.com/vaheedgithubac/exp-ansible-roles-apps.git
ansible-playbook -i localhost, -c local exp-ansible-roles-apps/main.yml -e component=frontend -e env=dev


#ansible-pull -i localhost, 
#-U https://github.com/vaheedgithubac/expense-ansible-roles-sws.git 
#-e component="frontend" main.yml 
#(This is asking for git credentials for public repo also)
