#!/bin/bash

cd /steamcmd && ./steamcmd.sh +force_install_dir /dst +login anonymous +app_update 343050 validate +quit

cd /dst/bin64 && \
./dontstarve_dedicated_server_nullrenderer_x64 -console -cluster MyDediServer -shard Master && \
./dontstarve_dedicated_server_nullrenderer_x64 -console -cluster MyDediServer -shard Caves