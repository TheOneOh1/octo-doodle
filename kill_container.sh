#!/bin/bash

# Check if the container is running
container_status=$(sudo docker ps -a -q -f name=octo-doodle)

if [ -n "$container_status" ]; then
  echo "Container is running. Stopping and removing the container..."
  sudo docker stop octo-doodle
  sudo docker rm octo-doodle
  echo "Container stopped and removed."
else
  echo "Container already killed."
fi