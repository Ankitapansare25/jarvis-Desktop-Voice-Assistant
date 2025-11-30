#!/bin/bash
# Update system
apt update -y

# Install required packages
apt install -y python3 python3-pip git

# Clone your application
git clone https://github.com/Ankitapansare25/jarvis-Desktop-Voice-Assistant.git /home/ubuntu/jarvis

# Install dependencies
pip3 install -r /home/ubuntu/jarvis/requirements.txt

# Create systemd service
cat <<EOF > /etc/systemd/system/jarvis.service
[Unit]
Description=Jarvis Voice Assistant
After=network.target

[Service]
User=ubuntu
ExecStart=/usr/bin/python3 /home/ubuntu/jarvis/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the service
systemctl daemon-reload
systemctl enable jarvis
systemctl start jarvis