#!/bin/env bash
# This script expects 2 parameters 1.component(frontend/backend/database) 2.env(dev/stage/prod) 
# usage: frontend.sh frontend dev
component=$1
env=$2

sudo dnf update
sudo dnf install git -y
sudo dnf install python3-pip -y
git --version
pip3 --version
# sudo pip3 install --upgrade pip
sudo pip3 install ansible
ansible --version

git clone https://github.com/vaheedgithubac/exp-ansible-roles-sws.git
ansible-playbook -i localhost, -c local exp-ansible-roles-sws/main.yml -e component=$component -e env=$env

git clone https://github.com/vaheedgithubac/exp-ansible-roles-apps.git
ansible-playbook -i localhost, -c local exp-ansible-roles-apps/main.yml -e component=$component -e env=$env


#ansible-pull -i localhost, 
#-U https://github.com/vaheedgithubac/expense-ansible-roles-sws.git 
#-e component="frontend" main.yml 
#(This is asking for git credentials for public repo also)
