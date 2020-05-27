#!/bin/bash
sudo su
yum install -y httpd
systemctl mask iptables
systemctl stop iptables
firewall-offline-cmd --zone=public --add-port=443/tcp
firewall-offline-cmd --zone=public --add-port=80/tcp  
systemctl restart firewalld
systemctl enable httpd.service
systemctl start httpd.service
echo "<html><b> Welcome on $hostnm Web Page -  BS TEST SERVER </b></html>" >> /var/www/html/index.html
systemctl restart httpd.service
