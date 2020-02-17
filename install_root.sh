#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/taekwondo_buildout/etc/nginx.conf ./sites-available/taekwondo.conf
cd sites-enabled
ln -s ../sites-available/taekwondo.conf

service nginx stop
certbot certonly --standalone -d taekwondo.voteit.se
service nginx start
