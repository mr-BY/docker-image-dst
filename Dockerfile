# Set base image
FROM ubuntu:latest

# Set copyright information
LABEL maintainer="Jianrry <i@jianrry.com>"
LABEL version="1.0"
LABEL releasedate="2023-03-29"
LABEL website="https://blog.jianrry.com"

# Set environment variable
ENV steamcmd_install_dir=/steamcmd \
    dst_install_dir=/dst \
    dst_save_dir=/root/.klei/DoNotStarveTogether/MyDediServer

# Install necessary dependencies
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget libcurl3-gnutls && \
    apt autoremove -y && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/*

# Install Don't Starve Together
RUN mkdir -p $steamcmd_install_dir && \
    cd $steamcmd_install_dir && \
    wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm -f steamcmd_linux.tar.gz

# Copy server configuration files
COPY MyDediServer $dst_save_dir

# Copy start script
COPY dst_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/dst_start.sh

# Expose server port
EXPOSE 10998-11004/udp

# Start the server
CMD ["dst_start.sh"]

