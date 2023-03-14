# Set base image
FROM ubuntu:latest

# Install necessary dependencies
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y wget libcurl3-gnutls libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 && \
    apt autoremove -y && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/*

# Install Don't Starve Together
RUN mkdir -p /steamcmd && \
    cd /steamcmd && \
    wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm -f steamcmd_linux.tar.gz

# Copy server configuration files
COPY MyDediServer /root/.klei/DoNotStarveTogether/MyDediServer

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose server port
EXPOSE 10998-11004/udp

# Start the server
ENTRYPOINT ["entrypoint.sh"]

