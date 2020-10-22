apt update
apt install -y nginx
sed -i 's/Welcome to nginx!/Ops-School Rules!/g' /var/www/index.nginx-debian.html 
sed -i '15,23d;' /var/www/html/index.nginx-debian.html 
systemctl restart nginx
