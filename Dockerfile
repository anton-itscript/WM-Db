FROM tutum/mysql

# Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf



###START supervisor instal START###

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get install -y software-properties-common && \
apt-get update && \
apt-get upgrade -y && \
BUILD_PACKAGES="supervisor cron " && \
apt-get -y install $BUILD_PACKAGES 
########################################################




###START ADD Supervisor Config START###

ADD ./supervisord.conf /etc/supervisord.conf
########################################################

###START Start Supervisord

ADD ./supervisor.sh /supervisor.sh
RUN chmod 755 /supervisor.sh
########################################################

### ADD SH BACKUP CREATERS

ADD ./backup_creater.sh /backup_creater.sh
RUN chmod 755 /backup_creater.sh
########################################################

### ADD CRONS
ADD ./cron-mysql /var/spool/cron/crontabs/mysql
RUN chown  mysql.crontab /var/spool/cron/crontabs/mysql &&  chmod  0600 /var/spool/cron/crontabs/mysql
########################################################



RUN rm -rf /var/lib/apt/lists/* && \
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf; fi && \
    mysql_install_db > /dev/null 2>&1 && \
    touch /var/lib/mysql/.EMPTY_DB


ENV MYSQL_USER=admin \
    MYSQL_PASS=**False** \
    REPLICATION_MASTER=**False** \
    REPLICATION_SLAVE=**False** \
    REPLICATION_USER=replica \
    REPLICATION_PASS=replica

# Add MySQL scripts
ADD import_sql.sh /import_sql.sh
ADD run.sh /run.sh




RUN mkdir /tmp/wm_clear_databases
RUN mkdir /var/wm_backups


ADD clearDb/wm_docker.sql 		/tmp/wm_clear_databases/wm_docker.sql
ADD clearDb/wm_docker_long.sql		/tmp/wm_clear_databases/wm_docker_long.sql
ADD clearDb/wm_docker_old.sql   	/tmp/wm_clear_databases/wm_docker_old.sql
ADD clearDb/wm_docker_long_old.sql	/tmp/wm_clear_databases/wm_docker_long_old.sql

#RUN /bin/bash /install.sh



# Add VOLUMEs to allow backup of config and databases

VOLUME  ["/etc/mysql", "/var/lib/mysql", "/var/wm_backups"]


CMD ["/supervisor.sh"]
