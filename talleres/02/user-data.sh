#!/bin/bash -xe

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update  -y 
yum install -y python37
yum  install -y git 
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
git clone https://github.com/lwilches/bootcamp-module-devops.git
cd ~/bootcamp-devops/backend/
pip install -r requirements.txt
nohup gunicorn -w 3 -b 0.0.0.0:8000 app:app &