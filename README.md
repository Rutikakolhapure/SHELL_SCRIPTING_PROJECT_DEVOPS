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

SCREENSHOTS OF THE OUTPUTS
<img width="766" height="567" alt="Screenshot 2026-07-07 213844" src="https://github.com/user-attachments/assets/5048e81e-e8fd-447b-8405-e5e7178d0c85" />
<img width="936" height="968" alt="Screenshot 2026-07-07 213805" src="https://github.com/user-attachments/assets/527df155-a62d-4025-8ef3-17a653a13c45" />
<img width="372" height="986" alt="Screenshot 2026-07-07 213917" src="https://github.com/user-attachments/assets/d22c5da1-3505-46d0-af44-2155550d7812" />
<img width="1153" height="923" alt="Screenshot 2026-07-07 213751" src="https://github.com/user-attachments/assets/2ffc242a-e940-45e5-8181-4df1d2ebc113" />
