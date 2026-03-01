\# Day 08 – Cloud Server Setup: Docker, Nginx \& Web Deployment



\## Commands Used



\# Update system packages

sudo apt-get update

sudo apt-get upgrade -y



\# Check nginx service status

systemctl status nginx.service



\# Check docker service status

systemctl status docker



\# Verify installed versions

nginx -v

docker --version



\# View docker service logs

journalctl -u docker.service



\# View nginx logs

sudo cat /var/log/nginx/access.log

sudo cat /var/log/nginx/error.log



\# Save logs to a file

sudo cat /var/log/nginx/access.log > ~/nginx-logs.txt



\# Transfer logs to local machine (from local system)

scp -i your-key.pem ubuntu@<your-instance-ip>:~/nginx-logs.txt .


## Challenges Faced
### Faced confusion about where nginx logs are stored

 - Resolved by checking default path: /var/log/nginx/

 - Issue understanding SCP command usage from Windows

 - Learned that SCP runs from local machine (PowerShell), not from server

 - Initial doubt about why Nginx page was not visible

 - Fixed by checking security group / firewall rules (port 80 open)



