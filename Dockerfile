FROM zabbix/zabbix-web-nginx-mysql:alpine-latest
ADD msjh.ttf /usr/share/zabbix/assets/fonts/
USER root
RUN apk update && apk upgrade && apk add curl tzdata && rm -r /var/cache/apk/* && \
    sed -i s/DejaVuSans/msjh/g /usr/share/zabbix/include/defines.inc.php &&\
    sed -i /zh_TW/s/false/true/g /usr/share/zabbix/include/locales.inc.php &&\
    ln -sf /dev/fd/1 /var/log/nginx/access.log &&\
    sed -i '2iuser=zabbix' /etc/php7/php-fpm.d/zabbix.conf &&\
    sed -i '3igroup=zabbix' /etc/php7/php-fpm.d/zabbix.conf &&\
    sed -i '4ilisten.mode = 0666' /etc/php7/php-fpm.d/zabbix.conf
