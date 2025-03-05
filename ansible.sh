#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y software-properties-common python3 python3-pip

# Add Ansible PPA repository and update
echo "Adding Ansible repository..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible and its core components
echo "Installing Ansible..."
sudo apt install -y ansible ansible-core

# Verify Ansible installation
echo "Checking Ansible version..."
ansible --version

# Install Boto for AWS integration
echo "Installing Boto and Boto3 for AWS support..."
sudo pip3 install boto boto3
sudo apt-get install -y python3-boto

# Verify Boto installation
echo "Checking Boto installation..."
pip list | grep boto

echo "Ansible installation completed successfully! 🎉"
