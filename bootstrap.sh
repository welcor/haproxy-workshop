#!/usr/bin/env bash

# apt-get update
# apt-get install -y apache2
# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   ln -fs /vagrant /var/www
# fi

# haproxy
add-apt-repository ppa:vbernat/haproxy-1.5
apt-get update
apt-get install haproxy

# socat
apt-get install socat
