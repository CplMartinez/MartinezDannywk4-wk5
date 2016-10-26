#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2
sudo apt-get install -y git

sudo systemctl enable apache2
sudo systemctl start apache2

#sudo git clone https://github.com/CplMartinez/boostrap-website.git /var/www/html/

