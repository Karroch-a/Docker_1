FROM ubuntu
ARG IP_ADRESSE=localhost
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && apt-get install -yq --no-install-recommends && apt-get -y upgrade && apt-get install -y postfix curl openssh-server ca-certificates tzdata
RUN curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN apt-get install gitlab-ce -y
RUN mkdir /etc/gitlab/ssl && chmod 700 /etc/gitlab/ssl && openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/gitlab/ssl/ab.key" -out "/etc/gitlab/ssl/ab.crt" -subj "/C=MA/"
RUN sed -i -e "s/external_url 'http:\/\/gitlab.example.com'/external_url 'https:\/\/$IP_ADRESSE\/'/g" /etc/gitlab/gitlab.rb
RUN echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/ab.crt\"" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/ab.key\"" >> /etc/gitlab/gitlab.rb
RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 8022" >> /etc/gitlab/gitlab.rb
RUN echo "    Port 8022" >> /etc/ssh/ssh_config
RUN service ssh start
EXPOSE 443 22 80
ENTRYPOINT /opt/gitlab/embedded/bin/runsvdir-start& gitlab-ctl reconfigure && service ssh restart && gitlab-ctl tail

#docker build --build-arg IP_ADRESSE=192.168.99.100 -t gitlab_my .
#docker run -it -p 8043:443 -p 8080:80 -p 8022:22 --rm gitlab_my
