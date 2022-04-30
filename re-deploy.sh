#!/bin/bash
#This Script Helps you to Deploy an application in to you exsting server
sudo dpkg --configure -a
sudo chmod +x variables.sh
source variables.sh
#clone project and configure
echo
echo "clone and configure the project..."
echo
sudo chmod -R 777 /var/www/html
pushd /var/www/html 
git clone -b $BRNACHNAME $GITURL
sudo chmod -R 755 /var/www/html/
sudo chown -R $USER:$USER /var/www/html/$PROJECTNAME
cd /var/www/html/$PROJECTNAME
cd storage/ && mkdir -p framework/{sessions,views,cache} && chmod -R 775 framework && cd ..
composer install
sudo rm -r .env
echo
sleep 1
#set environment values
popd 
sudo chmod +x environment.sh
source environment.sh
echo
echo
sleep 1
#run the artisan commands
pushd /var/www/html/$PROJECTNAME
php artisan key:generate
php artisan migrate
php artisan db:seed
php artisan optimize:clear
sudo chown -R www-data.www-data storage
sudo chown -R www-data.www-data bootstrap
echo
echo "Clone and configuration completed..."
sleep 1
# Nginx Configurations
cd
cd AutoDep-Laravel
sudo chmod +x nginx.sh
source nginx.sh
sudo nginx -test
sudo systemctl restart nginx
sleep 1
#other Operations
sudo apt-get update
echo "setup completed"