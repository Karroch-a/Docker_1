FROM ubuntu
RUN apt update && apt upgrade -y && apt install -y curl vim
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash 
RUN apt-get install -y nodejs
RUN npm install -g create-react-app
ADD ./1337 ./1337
WORKDIR 1337
ENTRYPOINT npm i && npm start
