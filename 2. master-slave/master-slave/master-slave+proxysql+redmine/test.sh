#!/bin/bash
set -ex

for i in {1..15}; do
  echo "Request #$i"
  curl -sI http://localhost:80 | grep -E "Server|X-Upstream"
  sleep 1
done