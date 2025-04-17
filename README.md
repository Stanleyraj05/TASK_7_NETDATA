## 👤 Submitted by
**Stanley Raj**  
**NIT Silchar** | Cloud & DevOps Enthusiast

## 🎯 Objective
To set up and visualize real-time system metrics using Netdata, a lightweight and powerful monitoring tool. This task uses Docker for simplified deployment.

## 🧪 Steps Performed in This Script
1. Checked Docker installation.
2. Pulled and ran the Netdata Docker container.
3. Opened access to the Netdata dashboard at [http://localhost:19999](http://localhost:19999).
4. Viewed container logs to verify successful setup.

## 🖼️ Screenshot Placeholder
<img width="1440" alt="Screenshot 2025-04-17 at 11 53 59 AM" src="https://github.com/user-attachments/assets/a152ac0a-cfe9-4c86-8a47-a7847e5ec83f" />


# Create the Netdata run script
cat << 'EOF' > run_netdata.sh
#!/bin/bash

echo "🚀 Starting Netdata container..."

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
echo "📊 Access Netdata at: http://localhost:19999"
echo "📝 Showing last 10 logs:"
docker logs --tail 10 netdata
EOF

# Make script executable
chmod +x run_netdata.sh

echo "📦 STEP 2: Running Netdata container..."
./run_netdata.sh

echo ""
echo "✅ All steps completed successfully!"
echo "📂 Files created: README.md, run_netdata.sh"
echo "📁 Project folder: $(pwd)"
