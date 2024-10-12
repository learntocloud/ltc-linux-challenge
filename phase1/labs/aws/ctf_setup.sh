#!/bin/bash

# Set a password for the ec2-user
echo 'ec2-user:CTFpassword123!' | chpasswd

# Enable password authentication
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Create a directory for the CTF challenges
mkdir -p /home/ec2-user/ctf_challenges
cd /home/ec2-user/ctf_challenges

# Create a welcome file with instructions
cat << EOT > welcome.txt
Welcome to the Linux Command Line CTF Challenge!

Your goal is to find and collect all the flags hidden in this system.
Each flag is in the format CTF{some_text_here}.

Here are your challenges:

1. Find the hidden file in this directory and read its contents.
2. Locate the file with the word "secret" in its name anywhere in the /home/ec2-user directory.
3. Find the largest file in the /var/log directory and retrieve the flag from it.
4. Identify the user with UID 1001 and find the flag in their home directory.
5. Locate the file owned by root with permissions 777 and read its contents.
6. Find the process running on port 8080 and retrieve the flag from its command.
7. Decode the base64 encoded flag in the 'encoded_flag.txt' file.

Good luck, and happy hunting!
EOT

# Challenge 1: Hidden file
echo "CTF{hidden_files_revealed}" > .hidden_flag

# Challenge 2: File with "secret" in the name
echo "CTF{grep_is_your_friend}" > /home/ec2-user/very_secret_file.txt

# Challenge 3: Largest file in /var/log
sudo bash -c 'echo "CTF{size_matters_in_linux}" >> /var/log/large_log_file.log'
sudo bash -c 'for i in {1..10000}; do echo "Log entry $i" >> /var/log/large_log_file.log; done'

# Challenge 4: User with UID 1001
sudo useradd -u 1001 ctf_user
echo "CTF{user_detective}" | sudo tee /home/ctf_user/flag.txt

# Challenge 5: File owned by root with 777 permissions
echo "CTF{permission_granted}" | sudo tee /root/everyone_can_access_me
sudo chmod 777 /root/everyone_can_access_me

# Challenge 6: Process running on port 8080
echo '#!/bin/bash
while true; do
    echo -e "HTTP/1.1 200 OK\n\nCTF{port_explorer}" | nc -l -p 8080
done' > port_8080_service.sh
chmod +x port_8080_service.sh
nohup ./port_8080_service.sh &

# Challenge 7: Base64 encoded flag
echo "Q1RGe2Jhc2U2NF9kZWNvZGVyfQ==" > encoded_flag.txt

# Set appropriate permissions
chown -R ec2-user:ec2-user /home/ec2-user/ctf_challenges

# Add a hint to the motd
echo "Welcome to the Linux Command Line CTF! Your first challenge awaits in /home/ec2-user/ctf_challenges/welcome.txt" | sudo tee -a /etc/motd

echo "CTF environment setup complete!"