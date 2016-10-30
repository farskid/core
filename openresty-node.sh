#!/bin/bash
###########################################
################# OPENRESTY ###############
###########################################
if [ -f /etc/redhat-release ]; then
  yum -y update
  yum -y install epel-release
  yum install gcc-c++
  yum  -y install nginx-extras build-essential libpcre3-dev libssl-dev libgeoip-dev libpq-dev libxslt1-dev libgd2-xpm-dev libdrizzle-dev
fi

if [ -f /etc/lsb-release ]; then
apt-get -y update
apt-get -y install nginx-extras build-essential libpcre3-dev libssl-dev libgeoip-dev libpq-dev libxslt1-dev libgd2-xpm-dev libdrizzle-dev
fi
wget https://openresty.org/download/drizzle7-2011.07.21.tar.gz
 tar xzvf drizzle7-2011.07.21.tar.gz
cd drizzle7-2011.07.21/
./configure --without-server
make libdrizzle-1.0
 make install-libdrizzle-1.0
cd ..
wget -c https://openresty.org/download/openresty-1.11.2.1.tar.gz
tar zxvf openresty-1.11.2.1.tar.gz
cd openresty-1.11.2.1

./configure \
--with-sha1=/usr/include/openssl \
--with-md5=/usr/include/openssl \
--with-http_stub_status_module \
--with-http_secure_link_module \
--with-luajit \
--with-pcre-jit \
--with-debug \
--with-http_auth_request_module \
--with-http_addition_module \
--with-http_gunzip_module \
--with-http_image_filter_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_geoip_module \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-http_sub_module \
--with-http_xslt_module \
--with-ipv6 \
 
--with-http_drizzle_module

make
make install
apt-get -y autoclean
apt-get -y autoremove

###########################################
### NODE(NVM) #############################
###########################################
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node

cd ..
