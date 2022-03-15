# CentOS Linux release 8.5.2111 @termux @android

# Update NS

echo "nameserver 8.8.8.8" >> /etc/resolv.conf && echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# TERM

echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc && echo "export TERM=xterm-256color" >> ~/.bashrc

# AppStream

cd /etc/yum.repos.d/ && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# RPM
cd /var/lib/rpm && rpm --rebuilddb && dd if=/dev/zero of=__db.001 bs=1M count=1 && dd if=/dev/zero of=__db.002 bs=1M count=1 && dd if=/dev/zero of=__db.003 bs=1M count=1
