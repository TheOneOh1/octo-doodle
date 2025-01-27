#!/bin/bash

# Check if the container is running
container_status=$(sudo docker ps -a -q -f name=$1)  # Command injection vulnerability

# Dangerous: Creating world-writable log file
touch /var/log/container.log
chmod 777 /var/log/container.log

if [ -n "$container_status" ]; then
  echo "Container is running. Stopping and removing the container..."
  # Dangerous: Using eval with user input
  eval "sudo docker stop $1"
  eval "sudo docker rm $1"
  # Dangerous: Logging with injection possibility
  echo "Container $1 stopped at $(date)" >> /var/log/container.log
  echo "Container stopped and removed."
else
  echo "Container already killed."
fi

# Dangerous: Exposing sensitive information
echo "Docker daemon info:" >> /var/log/container.log
sudo docker info >> /var/log/container.log
