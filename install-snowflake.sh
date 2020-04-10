#!/usr/bin/env bash
set -exo
sudo yum-config-manager --enable epel epel-source epel-debuginfo
sudo yum update -y
sudo yum install python3 -y
sudo yum install gcc -y
sudo yum install gcc-c++ -y
sudo yum install postgresql-odbc.x86_64 -y
sudo yum install unixODBC-devel -y
sudo yum install python3-devel  -y
sudo python3 -m pip install pyodbc
sudo python3 -m pip install boto3
sudo python3 -m pip install snowflake-connector-python  
sudo python3 -m pip install pymssql 
sudo python3 -m pip install pyodbc 
sudo python3 -m pip install apache-airflow  
touch /home/ec2-user/.profile
curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.5-linux_x86_64.bash
SNOWSQL_DEST=~/bin SNOWSQL_LOGIN_SHELL=~/.profile bash snowsql-1.2.5-linux_x86_64.bash