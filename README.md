# CentOS Linux release 8.5.2111 @termux @android

<li> Update NS </li>

echo "nameserver 8.8.8.8" >> /etc/resolv.conf && echo "nameserver 8.8.4.4" >> /etc/resolv.conf

<li> TERM </li>

echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc && echo "export TERM=xterm-256color" >> ~/.bashrc

<li> AppStream </li>

cd /etc/yum.repos.d/ && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

<li> RPM </li>
cd /var/lib/rpm && rpm --rebuilddb && dd if=/dev/zero of=__db.001 bs=1M count=1 && dd if=/dev/zero of=__db.002 bs=1M count=1 && dd if=/dev/zero of=__db.003 bs=1M count=1
