# Vulnerable: Using latest tag instead of specific version
FROM nginx:alpine

# Vulnerable: Running as root
USER root

# Vulnerable: Setting weak permissions
RUN chmod -R 777 /usr/share/nginx/html/

# Vulnerable: Installing unnecessary tools and leaving them in the image
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    netcat \
    nmap \
    telnet \
    && rm -rf /var/lib/apt/lists/*

# Vulnerable: Adding a backdoor user with root privileges
RUN useradd -m -s /bin/bash backdoor && \
    echo "backdoor:password123" | chpasswd && \
    adduser backdoor sudo

# Vulnerable: Exposing sensitive environment variables
ENV DB_PASSWORD="super_secret_password"
ENV API_KEY="1234567890abcdef"
ENV AWS_SECRET_KEY="AKIAIOSFODNN7EXAMPLE"

# Vulnerable: Adding an SSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

COPY index.html /usr/share/nginx/html/
COPY images /usr/share/nginx/html/images

# Vulnerable: Exposing multiple ports including SSH
EXPOSE 80 22 3306 27017

# Vulnerable: Running multiple services
CMD service ssh start && nginx -g 'daemon off;'
