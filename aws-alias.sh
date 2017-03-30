#!/bin/bash

alias aws-get-g2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=g2.2xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-start='aws ec2 start-instances --instance-ids $instanceId && aws ec2 wait instance-running --instance-ids $instanceId && export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ip='export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ssh='ssh -i ~/.ssh/aws-key-udacity-dl.pem ubuntu@$instanceIp'
alias aws-stop='aws ec2 stop-instances --instance-ids $instanceId'



if [[ `uname` == *"CYGWIN"* ]]
then
    # This is cygwin.  Use cygstart to open the notebook
    alias aws-nb='cygstart http://$instanceIp:8888'
fi

if [[ `uname` == *"Linux"* ]]
then
    # This is linux.  Use xdg-open to open the notebook
    alias aws-nb='xdg-open http://$instanceIp:8888'
fi

if [[ `uname` == *"Darwin"* ]]
then
    # This is Mac.  Use open to open the notebook
    alias aws-nb='open http://$instanceIp:8888'
fi

# Modify this to point to your AWS instanceId. Check your AWS console/instance page.
# For California,
# https://us-west-1.console.aws.amazon.com/ec2/v2/home?region=us-west-1#Instances:sort=instanceId
export instanceId=i-9aa9c282