#!/bin/bash
apt-get update -y
# Install OpenJDK 8
apt-get install openjdk-8-jdk -y

# Verify Java version
echo $(java -version)

# Create a user for Nexus
useradd -M -d /opt/nexus -s /bin/bash -r nexus

# Allow Nexus user to execute sudo commands without a password prompt
echo "nexus ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nexus

# Create the Nexus installation directory
mkdir /opt/nexus

# Download and extract Nexus
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz
tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1

# Set ownership of the Nexus directory to the Nexus user
chown -R nexus:nexus /opt/nexus

# Edit Nexus VM options
nexus_vmoptions="/opt/nexus/bin/nexus.vmoptions"

# Check if the file exists
if [ -f "$nexus_vmoptions" ]; then
    # Replace '../sonatype-work' with './sonatype-work' using sed
    sed -i 's/\.\.\/sonatype-work/\.\/sonatype-work/g' "$nexus_vmoptions"
    echo "Replaced '../sonatype-work' with './sonatype-work' in $nexus_vmoptions"
else
    echo "File $nexus_vmoptions does not exist."
fi

# Configure Nexus to run as the 'nexus' user
echo 'run_as_user="nexus"' >> /opt/nexus/bin/nexus.rc

# Start Nexus as the 'nexus' user
sudo -u nexus /opt/nexus/bin/nexus start

# Create a systemd service for Nexus
echo "[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/nexus.service

# Reload systemd configuration
systemctl daemon-reload

# Start Nexus service
systemctl start nexus

# Enable Nexus service to start on boot
systemctl enable nexus

# Check Nexus service status
systemctl status nexus | cat


apt-get install nginx -y

# Create a Nexus configuration file for Nginx
echo 'upstream backend {
  server 127.0.0.1:8081;
}

server {
    listen 80;
    server_name nexus.example.com;

    location / {
        proxy_pass http://backend/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forward-Proto http;
        proxy_set_header X-Nginx-Proxy true;

        proxy_redirect off;
    }
}' > /etc/nginx/conf.d/nexus.conf

# Test the Nginx configuration
echo $(nginx -t)

# Restart Nginx to apply the configuration
systemctl restart nginx

# Check Nginx service status
systemctl status nginx | cat