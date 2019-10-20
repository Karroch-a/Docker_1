From debian
ENV TS3SERVER_LICENSE=accept
RUN apt-get update -y && apt-get upgrade -y
RUN apt install wget tar bzip2 -y
RUN wget https://files.teamspeak-services.com/releases/server/3.9.1/teamspeak3-server_linux_amd64-3.9.1.tar.bz2
RUN tar -xf teamspeak3-server_linux_amd64-3.9.1.tar.bz2
WORKDIR teamspeak3-server_linux_amd64
CMD ["./ts3server_minimal_runscript.sh"]
#docker run -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -e TS3SERVER_LICENSE=accept
