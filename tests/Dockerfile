# Pull Ubuntu 24.04.1 LTS from DockerHub
FROM ubuntu:24.04

# Set 256 color mode
ENV TERM='xterm-256color'

# Install base packages
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
    'sudo' \
    'curl' \
    'software-properties-common' \
    'git' \
    'zsh'

# Configure passwordless access to sudo for rootless user
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Remove apt cache
RUN rm -rf '/var/cache/apt/archives' '/var/lib/apt/lists/*'

# Set rootless user as default
USER "ubuntu"

# Copy upgrade script
COPY 'scripts' '/tmp/scripts/'

# Check for correct installation
RUN /tmp/scripts/upgrade.sh

# Check for correct upgrade
RUN /tmp/scripts/upgrade.sh

# Set home directory as PWD by default
WORKDIR "/home/ubuntu"

# Login as rootless user
ENTRYPOINT [ "sudo", "su", "ubuntu" ]
