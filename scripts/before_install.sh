#!/bin/bash

#download node and npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node

#create our working directory if it doesnt exist
DIR="/home/ec2-user/express-app"
if [ -d "$DIR" ]; then
  echo "${DIR} exists"
else
  echo "Creating ${DIR} directory"
  mkdir ${DIR}
  cd ${DIR}
  cat > .env <<message

  API_URL=/api/v1
  PORT=3000
  CONNECTION_STRING=mongodb+srv://aptech:123456789abc@mydemocluster.6ihvf.mongodb.net/eshops?retryWrites=true&w=majority
  secret=this-is-my-secret
  
  message
fi
