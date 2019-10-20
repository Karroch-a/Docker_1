FROM ubuntu
RUN apt update && apt upgrade -y && apt install -y vim git apache2
RUN rm -fr /var/www/html/*
RUN git clone https://github.com/dignifiedquire/FullScreenMario.git /var/www/html/
RUN service apache2 start
ENTRYPOINT service apache2 restart && bash
