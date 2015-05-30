FROM archlinux

RUN pacman -Syyu sudo mariadb --noconfirm && \
    awk '/\[mysqld\]/ { print; print "user            = mysql"; next }1' /etc/mysql/my.cnf > /etc/mysql/my.cnf

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld", "--user=mysql"]
