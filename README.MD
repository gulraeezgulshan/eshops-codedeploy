npm init
npm install nodemon express dotenv morgan mongoose cors
npm install bcryptjs jsonwebtoken express-jwt multer

#code deploye agent installation

#!/bin/bash
sudo yum -y update
sudo yum -y install ruby
sudo yum -y install wget
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto



#---------------------------------

#!/bin/bash
sudo yum update
sudo yum install ruby
sudo yum install wget

CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y

cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status



user ubuntu;
worker_processes auto;

events {
	worker_connections 1024;
}

http {

	server {
		server_name gulraeez.com www.gulraeez.com;
		location / {
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header Host $http_host;
			proxy_pass http://127.0.0.1:3000;
		}
	
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/gulraeez.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/gulraeez.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


	server {
    if ($host = gulraeez.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


		listen 80;
		server_name gulraeez.com www.gulraeez.com;
    return 404; # managed by Certbot


}}







