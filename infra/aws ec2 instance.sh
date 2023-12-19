#!/bin/bash

# Set your AWS region and other parameters
AWS_REGION="your_region"
INSTANCE_TYPE="t2.micro"
AMI_ID="ami-xxxxxxxxxxxxxxxxx"  # Replace with the desired AMI ID
KEY_NAME="your_key_pair_name"
SECURITY_GROUP_ID="your_security_group_id"
SUBNET_ID="your_subnet_id"

# Run the AWS CLI command to launch the EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --region $AWS_REGION \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP_ID \
  --subnet-id $SUBNET_ID \
  --output json | jq -r '.Instances[0].InstanceId')

echo "Instance $INSTANCE_ID is being created."

# Optional: Add a delay to wait for the instance to be fully created before further actions
# You can adjust the sleep duration based on your requirements
sleep 30

# Optional: Describe the instance to get more information
aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID
