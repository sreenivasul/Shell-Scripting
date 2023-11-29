#!/bin/bash

USERID=(id -u)

#check the user id is root or not

if [ $USERID -ne 0 ]; then
   echo" you need to be a root user to execute script"
   exit 1
fi

yum update -y

if [ $? -ne 0 ]; then
  echo" installing yum update is failure"
  exit 1
else
  echo" installing yum update is success"
fi

 sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
	

if [ $? -ne 0 ]; then
  echo" installing jenkins repo is failure"
  exit 1
else
  echo" installing jenkins repo is success"
fi

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

if [ $? -ne 0 ]; then
  echo" installing jenkins key is failure"
  exit 1
else
  echo" installing jenkins is success"
fi

sudo yum upgrade

if [ $? -ne 0 ]; then
  echo" installing upgrade is failure"
  exit 1
else
  echo" installing upgrade is success"
fi

sudo dnf install java-17-amazon-corretto -y

if [ $? -ne 0 ]; then
  echo" installing java is failure"
  exit 1
else
  echo" installing java is success"
fi

sudo yum install jenkins -y

if [ $? -ne 0 ]; then
  echo" installing jenkins is failure"
  exit 1
else
  echo" installing jenkins is success"
fi

sudo systemctl enable jenkins

if [ $? -ne 0 ]; then
  echo" enable jenkins is failure"
  exit 1
else
  echo" enable jenkins is success"
fi

sudo systemctl start jenkins

if [ $? -ne 0 ]; then
  echo" start jenkins is failure"
  exit 1
else
  echo" start jenkins is success"
fi

sudo systemctl status jenkins

if [ $? -ne 0 ]; then
  echo" status jenkins is failure"
  exit 1
else
  echo" status jenkins is success"
fi

