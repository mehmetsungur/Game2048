#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt-get install wget apt-transport-https gnupg lsb-release -y

# Add Trivy repository key
echo "Adding Trivy repository key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

# Add Trivy repository to sources list
echo "Adding Trivy repository..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

# Update package list and install Trivy
echo "Updating package list and installing Trivy..."
sudo apt-get update -y
sudo apt-get install trivy -y

# Verify installation
echo "Verifying Trivy installation..."
trivy --version

echo "Trivy installation completed successfully! 🎉"
