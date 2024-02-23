# Otus_16_log

## Цель домашнего задания
Научится проектировать централизованный сбор логов. Рассмотреть особенности разных платформ для сбора логов.

# Решение:

При запуске Vagrant создаются 2 виртуальных машины и настраивается сбор логов с помощью скриптов.

# Проверка:

Поменяем атрибут у файла /etc/nginx/nginx.conf и проверим на log-сервере

```
root@web etc]# ls -l /etc/nginx/nginx.conf
-rw-r--r--. 1 root root 2434 Feb 23 11:50 /etc/nginx/nginx.conf
[root@web etc]# chmod +x /etc/nginx/nginx.conf
[root@web etc]# ls -l /etc/nginx/nginx.conf
-rwxr-xr-x. 1 root root 2434 Feb 23 11:50 /etc/nginx/nginx.conf
```


```
[root@log ~]# grep nginx.conf /var/log/audit/audit.log                  
node=web type=CONFIG_CHANGE msg=audit(1708678238.407:975): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=add_rule key="nginx_conf" list=4 res=1
node=web type=CONFIG_CHANGE msg=audit(1708678238.407:976): auid=4294967295 ses=4294967295 subj=system_u:system_r:unconfined_service_t:s0 op=add_rule key="nginx_conf" list=4 res=1
node=web type=SYSCALL msg=audit(1708678686.440:1019): arch=c000003e syscall=268 success=yes exit=0 a0=ffffffffffffff9c a1=1da4420 a2=1ed a3=7fffff395b20 items=1 ppid=3544 pid=3567 auid=1000 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts0 ses=4 comm="chmod" exe="/usr/bin/chmod" subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="nginx_conf"
node=web type=PATH msg=audit(1708678686.440:1019): item=0 name="/etc/nginx/nginx.conf" inode=67521903 dev=08:01 mode=0100644 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:httpd_config_t:s0 objtype=NORMAL cap_fp=0000000000000000 cap_fi=0000000000000000 cap_fe=0 cap_fver=0
```
