#!/bin/bash

# ==========================================================
# AWS Resource Tracker
# Author : Rutika Kolhapure
# Purpose: Track AWS Resources using AWS CLI
# ==========================================================

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
echo "==============================================="
echo "         AWS RESOURCE TRACKER"
echo "==============================================="
echo -e "${NC}"

# -----------------------------
# Check AWS CLI
# -----------------------------

if ! command -v aws &> /dev/null
then
    echo -e "${RED}AWS CLI is not installed.${NC}"
    exit 1
fi

# -----------------------------
# Check Credentials
# -----------------------------

aws sts get-caller-identity > /dev/null 2>&1

if [ $? -ne 0 ]
then
    echo -e "${RED}AWS Credentials not configured.${NC}"
    echo "Run: aws configure"
    exit 1
fi

echo -e "${GREEN}AWS CLI Verified${NC}"

echo ""

# ==========================================================
# EC2
# ==========================================================

echo -e "${YELLOW}========== EC2 INSTANCES ==========${NC}"

aws ec2 describe-instances \
--query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]" \
--output table

echo ""

# ==========================================================
# S3
# ==========================================================

echo -e "${YELLOW}========== S3 BUCKETS ==========${NC}"

aws s3 ls

echo ""

# ==========================================================
# IAM USERS
# ==========================================================

echo -e "${YELLOW}========== IAM USERS ==========${NC}"

aws iam list-users \
--query "Users[*].UserName" \
--output table

echo ""

# ==========================================================
# Lambda
# ==========================================================

echo -e "${YELLOW}========== LAMBDA FUNCTIONS ==========${NC}"

aws lambda list-functions \
--query "Functions[*].FunctionName" \
--output table

echo ""

# ==========================================================
# VPC
# ==========================================================

echo -e "${YELLOW}========== VPCs ==========${NC}"

aws ec2 describe-vpcs \
--query "Vpcs[*].VpcId" \
--output table

echo ""

# ==========================================================
# Security Groups
# ==========================================================

echo -e "${YELLOW}========== SECURITY GROUPS ==========${NC}"

aws ec2 describe-security-groups \
--query "SecurityGroups[*].[GroupName,GroupId]" \
--output table

echo ""

# ==========================================================
# EBS Volumes
# ==========================================================

echo -e "${YELLOW}========== EBS VOLUMES ==========${NC}"

aws ec2 describe-volumes \
--query "Volumes[*].[VolumeId,State,Size]" \
--output table

echo ""

# ==========================================================
# Elastic IPs
# ==========================================================

echo -e "${YELLOW}========== ELASTIC IPs ==========${NC}"

aws ec2 describe-addresses \
--query "Addresses[*].PublicIp" \
--output table

echo ""

# ==========================================================
# RDS
# ==========================================================

echo -e "${YELLOW}========== RDS INSTANCES ==========${NC}"

aws rds describe-db-instances \
--query "DBInstances[*].[DBInstanceIdentifier,Engine,DBInstanceStatus]" \
--output table

echo ""

# ==========================================================
# ECS Clusters
# ==========================================================

echo -e "${YELLOW}========== ECS CLUSTERS ==========${NC}"

aws ecs list-clusters

echo ""

# ==========================================================
# EKS Clusters
# ==========================================================

echo -e "${YELLOW}========== EKS CLUSTERS ==========${NC}"

aws eks list-clusters

echo ""

# ==========================================================
# CloudFormation
# ==========================================================

echo -e "${YELLOW}========== CLOUDFORMATION STACKS ==========${NC}"

aws cloudformation list-stacks \
--query "StackSummaries[*].[StackName,StackStatus]" \
--output table

echo ""

echo -e "${GREEN}"
echo "==============================================="
echo "      AWS Resource Tracking Completed"
echo "==============================================="
echo -e "${NC}"