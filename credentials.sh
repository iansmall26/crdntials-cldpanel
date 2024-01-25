#!/bin/bash

# Extract values from credentials file
username=$(awk '/Username:/ {print $2}' /home/ubuntu/credentials.txt)
email=$(awk '/Email:/ {print $2}' /home/ubuntu/credentials.txt)
firstName=$(awk '/firstName:/ {print $2}' /home/ubuntu/credentials.txt)
lastName=$(awk '/lastName:/ {print $2}' /home/ubuntu/credentials.txt)
password=$(awk '/Password:/ {print $2}' /home/ubuntu/credentials.txt)

# Build clpctl command with extracted values
clpctl_command="clpctl user:add \
  --userName=\"$username\" \
  --email=\"$email\" \
  --firstName=\"$firstName\" \
  --lastName=\"$lastName\" \
  --password=\"$password\" \
  --role='admin' \
  --timezone='UTC' \
  --status='1'"

# Run clpctl command and redirect output to logs
eval "$clpctl_command" >> /var/log/cloudpanel.log 2>> /var/log/cloudpanel.log

# Log the exit status of the clpctl command
echo $? >> /var/log/cloudpanel.log
