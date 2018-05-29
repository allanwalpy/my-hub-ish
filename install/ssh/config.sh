sudo echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config

bash install.sh sed
sed 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config