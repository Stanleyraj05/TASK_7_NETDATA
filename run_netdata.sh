#!/bin/bash

# ------------------------------------------------------------------------
# Title     : run_netdata.sh
# Author    : Stanley Raj (NIT Silchar)
# Description : Deploys Netdata monitoring dashboard using Docker
# ------------------------------------------------------------------------

echo "🔧 Checking Docker installation..."

if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

echo "✅ Docker is installed."
echo "🚀 Starting Netdata container..."

# Run Netdata container with volume mappings and monitoring capabilities
docker run -d --name=netdata -p 19999:19999 --cap-add=SYS_PTRACE \
  -v netdataconfig:/etc/netdata \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  netdata/netdata

echo "✅ Netdata container is running."

# Optional: View logs for confirmation
echo "📊 Access Netdata Dashboard at: http://localhost:19999"
echo "📝 Viewing last 10 logs from Netdata container:"
docker logs --tail 10 netdata

# Optional Cleanup Tip (commented out)
# echo "To stop and remove the container:"
# echo "docker stop netdata && docker rm netdata"
