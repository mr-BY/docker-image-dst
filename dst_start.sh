#!/bin/bash

cd $steamcmd_install_dir && \
./steamcmd.sh \ 
	+force_install_dir $dst_install_dir \ 
	+login anonymous \ 
	+app_update 343050 validate \ 
	+quit

cd $dst_install_dir/bin64 && \
./dontstarve_dedicated_server_nullrenderer_x64 \ 
	-console \ 
	-cluster MyDediServer \ 
	-shard Master && \
./dontstarve_dedicated_server_nullrenderer_x64 \ 
	-console \ 
	-cluster MyDediServer \ 
	-shard Caves
