# My OpenVPN config
Change your config files
1. Server config server.conf
2. Change client config file ~/client-configs/base.conf

Copy the mail form file into /etc/storage/ and chmod +x /etc/storage/mail.sh
You need change mail.sh file the following ites FROM, AUTH, PASS, FROMNAME, TO
## What you'll need
- OpenVPN
- SMTP server

You can check the log by
~~~
status /var/log/openvpn/status.log # status log
log /var/log/openvpn/serv.log # serv log

