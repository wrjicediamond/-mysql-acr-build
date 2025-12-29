# MySQL Docker Image for Alibaba Cloud ACR

This repository contains a custom MySQL 8.0 Docker image configuration.

## Features
- Based on official MySQL 8.0 image
- Timezone set to Asia/Shanghai
- UTF8MB4 character encoding
- Custom configuration optimized for ACR
- Health check support
- Automatic initialization scripts

## File Structure
mysql-docker-acr/
├── Dockerfile
├── README.md
├── config/
│ └── my.cnf
└── sql/
└── init.sql


## Usage with ACR

1. Connect this repository to Alibaba Cloud ACR
2. Configure automatic build rules
3. Pull from ACR:
   ```bash
   docker pull registry.cn-hangzhou.aliyuncs.com/your-namespace/mysql:8.0
   
