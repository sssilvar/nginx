#!/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Stop and delete current container
eval "docker stop demo-nginx && docker rm demo-nginx"

# Command to run as container
CMD="docker run --name demo-nginx -v ${CURRENT_DIR}/nginx.conf:/etc/nginx/nginx.conf:ro -v ${CURRENT_DIR}/demo:/sites/demo -v ${CURRENT_DIR}/log:/var/log/nginx/ -d -p 80:80 nginx"
echo ${CMD}
eval ${CMD}