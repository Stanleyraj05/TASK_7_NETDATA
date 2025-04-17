# Task 7: Monitor System Resources Using Netdata

## Objective
Install Netdata using Docker and visualize system and app performance metrics.

## Instructions
1. Make sure Docker is installed and running.
2. Open terminal and execute the script:
   ```bash
   bash run_netdata.sh
   ```
3. Access the Netdata dashboard via: [http://localhost:19999](http://localhost:19999)
4. Explore metrics such as CPU, memory, disk usage, Docker containers, etc.
5. Observe charts, alerts, and logs (`/var/log/netdata` inside the container).

## Screenshot (add after testing)
Please add your Netdata dashboard screenshot here after setup.

## Notes
- Lightweight monitoring tool, suitable for local/dev servers.
- You can stop the container using: `docker stop netdata`
- To remove: `docker rm netdata`

## Interview Prep Questions
1. What does Netdata monitor?
2. How do you view real-time metrics?
3. How is Netdata different from Prometheus?
4. What is a collector?
5. What are some performance KPIs to watch?
6. How to deploy Netdata on a VM?
7. How does Netdata alerting work?
8. What is a dashboard in this context?
