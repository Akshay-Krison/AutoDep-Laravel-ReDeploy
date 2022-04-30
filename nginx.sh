#!/bin/bash
echo
cat << EOT >> $PROJECTNAME
server {
        listen 80;
        root /var/www/html/$PROJECTNAME/public;
        index index.html index.htm index.php;
        server_name $YOURDOMAIN;
        client_max_body_size 200M;

 location / {
       try_files \$uri \$uri/ /index.php\$is_args$args;
   }
   
   location ~ \.php\$ {
          fastcgi_split_path_info ^(.+\.php)(/.+)\$;
          fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
          fastcgi_index index.php;
          include fastcgi_params;
          fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
          fastcgi_intercept_errors off;
          fastcgi_buffer_size 16k;
          fastcgi_buffers 4 16k;
          fastcgi_connect_timeout 6000;
          fastcgi_send_timeout 6000;
          fastcgi_read_timeout 6000;

        }
}

EOT

sudo mv $PROJECTNAME /etc/nginx/sites-available/
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/$PROJECTNAME /etc/nginx/sites-enabled/
sudo rm -r /etc/nginx/sites-enabled/sites-available
sudo nginx -t
#starting nginx service and firewall
sudo systemctl restart nginx.service