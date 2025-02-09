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

# Copy upgrade script
COPY 'scripts' '/usr/src/'

# Create symbolic links for init-install and upgrade commands
RUN for file in 'init-install' 'upgrade'; do ln -s "/usr/src/$file.sh" "/usr/bin/$file"; done

# Set rootless user as default
USER "ubuntu"

# Check for correct installation
RUN init-install

# Check for correct upgrade
RUN upgrade

# Set home directory as PWD by default
WORKDIR "/home/ubuntu"

# Login as rootless user
ENTRYPOINT [ "sudo", "su", "ubuntu" ]
