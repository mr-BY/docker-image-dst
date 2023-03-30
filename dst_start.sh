#!/bin/bash

cd $dst_install_dir/bin64 && \
./dontstarve_dedicated_server_nullrenderer_x64 -console -cluster MyDediServer -shard Master && \
./dontstarve_dedicated_server_nullrenderer_x64 -console -cluster MyDediServer -shard Caves