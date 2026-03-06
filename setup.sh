#!/bin/bash
set -e

# Update system
sudo apt update -y
sudo apt upgrade -y

# Install basic utilities
sudo apt install -y curl wget unzip git software-properties-common

# Install Java 17
sudo apt install -y openjdk-17-jdk
java -version

# Install Maven
sudo apt install -y maven
mvn -version

# Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Allow ubuntu user to run docker without sudo
sudo usermod -aG docker ubuntu

# Install Trivy
sudo apt install -y wget apt-transport-https gnupg lsb-release

wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list
sudo apt update -y
sudo apt install -y trivy
trivy --version

# Create Azure DevOps agent directory
mkdir /home/ubuntu/azagent
cd /home/ubuntu/azagent

echo "Azure DevOps CI Agent setup completed successfully!"