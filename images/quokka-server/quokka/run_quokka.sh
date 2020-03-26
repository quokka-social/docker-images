#!/bin/bash

export PATH="$PATH:/opt/janus/bin"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/libwebsockets/lib/:/opt/libnice/lib"


echo "  ___              _    _"
echo " / _ \ _   _  ___ | | _| | ____ _"
echo "| | | | | | |/ _ \| |/ / |/ / _\` |"
echo "| |_| | |_| | (_) |   <|   < (_| |"
echo " \__\_\\\\__,_|\___/|_|\_\_|\_\__,_|"
echo ""
echo "Talk like you're in one place!"
echo ""

# fix permissions
chmod 700 /opt/quokka/ssl

nginx -c /opt/quokka/nginx.conf && janus
