#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update -y

# Add Adoptium repository for Java (Temurin 17 JDK)
echo "Adding Adoptium repository..."
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

# Update package list and install Temurin 17 JDK
echo "Installing Temurin 17 JDK..."
sudo apt update -y
sudo apt install temurin-17-jdk -y

# Verify Java installation
echo "Verifying Java installation..."
/usr/bin/java --version

# Add Jenkins repository key and source list
echo "Adding Jenkins repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list and install Jenkins
echo "Installing Jenkins..."
sudo apt-get update -y
sudo apt-get install jenkins -y

# Start and enable Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Jenkins status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins --no-pager

echo "Jenkins installation completed successfully! 🎉"