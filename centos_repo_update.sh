#!/bin/bash

## Script developed by Ankit @ankitsynX
##Start updating the CentOS repos

echo "Adding Centos OS and extra repos to repos.d"
cd /etc/yum.repos.d
echo "[CentOS-Base]
name=CentOS 7 Base Mirror
baseurl=http://mirror.centos.org/centos/7/os/x86_64/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
[CentOS-Extras]
name=CentOS 7 Extras
baseurl=http://mirror.centos.org/centos/7/extras/x86_64/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
" >> CentOS-Base.repo

echo "Repos added"
echo "Listing current repos: "
ls
read -p "Enter repo name to be removed: " remove_repo
echo "Removing repo : $remove_repo"
mv $remove_repo* /tmp -f

extra_files=$(rpm -qa | grep $remove_repo)
echo $extra_files
yum remove $extra_files -y

echo "Remove removal successful. Setting up new repos"
yum clean all -y
yum update -y

cat /etc/os-release
echo "All repo setup completed successfully!"
