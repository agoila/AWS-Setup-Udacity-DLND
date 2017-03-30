#!/bin/bash
#
# Configure a p2.xlarge instance

# get the correct ami
export region=$(aws configure get region)
if [ $region = "us-west-1" ]; then
   export ami="ami-3a603b5a" # California
elif [ $region = "eu-west-1" ]; then
   export ami="ami-944b76f2" # Ireland
elif [ $region = "us-east-1" ]; then
  export ami="ami-60f24d76" # Virginia
else
  echo "Only us-west-1 (California), eu-west-1 (Ireland), and us-east-1 (Virginia) are currently supported"
  exit 1
fi

export instanceType="g2.2xlarge"

. $(dirname "$0")/setup_instance.sh