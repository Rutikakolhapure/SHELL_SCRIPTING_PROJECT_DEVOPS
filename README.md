# SHELL_SCRIPTING_PROJECT_DEVOPS
# AWS Resource Tracker

## Project Overview

AWS Resource Tracker is a Bash Shell Script that tracks AWS resources using AWS CLI.

## Features

- EC2 Instances
- S3 Buckets
- IAM Users
- Lambda Functions
- VPC
- Security Groups
- EBS Volumes
- Elastic IP
- RDS
- ECS
- EKS
- CloudFormation

## Technologies Used

- Bash
- AWS CLI
- Linux
- EC2
- Cron

## How to Run

chmod +x aws_resource_tracker.sh

./aws_resource_tracker.sh

## Schedule Automatically

crontab -e

0 20 * * * /home/ubuntu/AWS-Resource-Tracker/aws_resource_tracker.sh
