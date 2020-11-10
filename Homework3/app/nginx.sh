#!/bin/bash

sudo apt update
sudo apt install nginx -y
sed -i 's/nginx/OpsSchool userip: '$IP' Rules/g ' /var/www/html/index.nginx-debian.html
sed -i '15,23d' /var/www/html/index.nginx-debian.html
service nginx restart

sudo apt install awscli -y
(crontab -l && echo "* 1 * * * /usr/bin/aws s3 cp /var/log/nginx/access.log s3://remote-state-opsschool-tf) | crontab -

