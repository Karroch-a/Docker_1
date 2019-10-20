FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install -y vim git fail2ban portsentry openssh-server ufw apache2 cron
#ssl
RUN mkdir /etc/apache2/ssl && chmod 700 /etc/apache2/ssl && openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/apache2/ssl/ab.key" -out "/etc/apache2/ssl/ab.crt" -subj "/C=MA/"
ADD /default-ssl.conf /etc/apache2/sites-available/
ADD /000-default.conf /etc/apache2/sites-available/
ADD /script.sh /etc/apache2/ssl/
#cron
ADD /script-1.sh /root/
WORKDIR /root/
RUN chmod +x script-1.sh
RUN echo "* 4 * * 1 sh /root/script-1.sh" >> /var/spool/cron/crontabs/root
RUN echo "@reboot sh /root/script-1.sh" >> /var/spool/cron/crontabs/root
#add user
RUN adduser roger
RUN usermod -aG sudo roger
#ssh configure
RUN echo "Port 1997" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config
#apache
RUN rm -fr /var/www/html/
RUN git clone https://github.com/jakesgordon/javascript-racer.git /var/www/html/jake
RUN git clone https://github.com/gabrielecirulli/2048.git /var/www/html/2048
RUN service ssh start
RUN service portsentry start
#portsentry
RUN sed -i -e 's/BLOCK_UDP="0"/BLOCK_UDP="1"/g' /etc/portsentry/portsentry.conf
RUN sed -i -e 's/BLOCK_TCP="0"/BLOCK_TCP="1"/g' /etc/portsentry/portsentry.conf
RUN sed -i -e 's/TCP_MODE="tcp"/TCP_MODE="atcp"/g' /etc/default/portsentry
RUN sed -i -e 's/UDP_MODE="udp"/UPD_MODE="audp"/g' /etc/default/portsentry
#script
WORKDIR /etc/apache2/ssl/
RUN chmod +x ./script.sh
ENTRYPOINT ./script.sh && bash

#docker network create --subnet=10.12.70.0/30 mynetwork
#docker run --net mynetwork --ip 10.12.70.2 -it -p 3000:80 -p 1997:22 
