FROM tutum/mysql

# Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf



RUN rm -rf /var/lib/apt/lists/* && \
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf; fi && \
    mysql_install_db > /dev/null 2>&1 && \
    touch /var/lib/mysql/.EMPTY_DB


ENV MYSQL_USER=admin \
    MYSQL_PASS=**Random** \
    ON_CREATE_DB_1=**False** \
    ON_CREATE_DB_2=**False** \
    REPLICATION_MASTER=**False** \
    REPLICATION_SLAVE=**False** \
    REPLICATION_USER=replica \
    REPLICATION_PASS=replica

# Add MySQL scripts
ADD import_sql.sh /import_sql.sh
#ADD run_clean.sh /run.sh
ADD run.sh /run.sh

#ADD install.sh /install.sh


RUN mkdir /tmp/wm_clear_databases

ADD clearDb/wm_docker.sql 		/tmp/wm_clear_databases/wm_docker.sql
ADD clearDb/wm_docker_long.sql		/tmp/wm_clear_databases/wm_docker_long.sql
ADD clearDb/wm_docker_old.sql   	/tmp/wm_clear_databases/wm_docker_old.sql
ADD clearDb/wm_docker_long_old.sql	/tmp/wm_clear_databases/wm_docker_long_old.sql

#RUN /bin/bash /install.sh



# Add VOLUMEs to allow backup of config and databases

VOLUME  ["/etc/mysql", "/var/lib/mysql"]


CMD ["/run.sh"]
