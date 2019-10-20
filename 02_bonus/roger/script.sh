#bin/bash
a2enmod ssl
a2ensite default-ssl
a2enconf ssl-params
apache2ctl configtest
service apache2 restart
service portsentry restart
service ssh restart
