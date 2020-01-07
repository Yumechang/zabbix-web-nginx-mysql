FROM zabbix/zabbix-web-nginx-mysql:alpine-latest
ADD msjh.ttf /usr/share/zabbix/assets/fonts/
RUN apk add curl tzdata && rm -r /var/cache/apk/* && \
    sed -i s/DejaVuSans/msjh/g /usr/share/zabbix/include/defines.inc.php
