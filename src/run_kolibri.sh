#!/bin/sh
export KOLIBRI_RUN_MODE=flatpaktest
export REDIRECT_PORT=48080
cd /app/www/
python3 redirect_server.py ${REDIRECT_PORT} &
xdg-open http://127.0.0.1:${REDIRECT_PORT}/
kolibri start
