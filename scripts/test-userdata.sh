#!/bin/bash
# Update the package repository
apt-get update -y

# Install Apache web server
apt-get install -y apache2

# Write "Hello, World!" to the default Apache index.html
echo "Hello, World!" > /var/www/html/index.html

# Ensure the Apache service is started
systemctl start apache2

# Enable the Apache service to start on boot
systemctl enable apache2
