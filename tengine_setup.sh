#! /bin/sh

if [ `pwd | rev | cut -d/ -f1 | rev` != "tengine" ]
	then
		echo "please first move to tengine directory"
		exit
fi

apt-get install libpcre++-dev libssl-dev zlib1g-dev
apt-get install build-essential
apt-get install make
wget http://tengine.taobao.org/download/tengine-2.1.1.tar.gz
tar -zxvf tengine-2.1.1.tar.gz
mkdir /usr/local/nginx
mkdir /var/tmp/nginx
cd tengine-2.0.3
./configure --prefix=/usr/local/nginx --conf-path=/etc/nginx/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --user=nginx --group=nginx --http-client-body-temp-path=/var/tmp/nginx/client --http-proxy-temp-path=/var/tmp/nginx/proxy --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi --http-scgi-temp-path=/var/tmp/nginx/scgi --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi
make && make install

# --pid-path=/run/nginx.pid
# adding user and changing owners

useradd -s /sbin/nologin nginx
cd /usr/local/nginx
chown nginx:nginx -R /usr/local/nginx/html
chown nginx:nginx -R /usr/local/nginx/logs
chown nginx:nginx -R /var/tmp/nginx
chmod 700 -R /usr/local/nginx/html
chmod 700 -R /var/tmp/nginx
chmod 777 -R /usr/local/nginx/logs

ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
nginx -s stop
wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx

# copying the nginx file to /etc/init.d/nginx
> /etc/init.d/nginx
cp nginx_copy_to_initd /etc/init.d/nginx
chmod 755 /etc/init.d/nginx

mkdir /var/log/nginx/
mkdir /etc/nginx/sites-enabled/
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log

service nginx stop
service nginx start
service nginx restart
