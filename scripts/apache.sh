#!/bin/bash

sudo yum install httpd -y

sudo service httpd start

sudo mkdir -p /var/www/html/sampledir
sudo cd /var/www/html
sudo chown  ec2-user sampledir
sudo chmod -R o+r sampledir
cd sampledir
echo "<h1> Java Home App </h1>" > /var/www/html/sampledir/index.html

#echo "<h1> Java Home App </h1>" > /var/www/html/index.html
