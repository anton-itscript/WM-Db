FROM tutum/mysql

# Add MySQL configuration
#ADD my.cnf /etc/mysql/conf.d/my.cnf
#ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf



#RUN rm -rf /var/lib/apt/lists/* && \
#    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf; fi && \
#    mysql_install_db > /dev/null 2>&1 && \
#    touch /var/lib/mysql/.EMPTY_DB



# Add MySQL scripts
#	ADD import_sql.sh /import_sql.sh
#       ADD run.sh /run.sh

# Add VOLUMEs to allow backup of config and databases

VOLUME  ["/etc/mysql", "/var/lib/mysql"]


#CMD ["/run.sh"]
