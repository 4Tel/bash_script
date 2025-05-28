#!/usr/bin/env bash

echo "User: $USER"

if [ -z "$SSH_CONNECTION" ]; then
  echo "SSH_CONNECTION is not defined."
else
  echo "Client IP: $(echo "$SSH_CONNECTION" | awk '{print $1}')"
  echo "Client Port: $(echo "$SSH_CONNECTION" | awk '{print $2}')"
  echo "Server IP: $(echo "$SSH_CONNECTION" | awk '{print $3}')"
  echo "Server Port: $(echo "$SSH_CONNECTION" | awk '{print $4}')"
fi
