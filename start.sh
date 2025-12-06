#!/bin/sh

# Start Nginx in the background
# We don't use 'daemon off' here because we want the script to continue to the Node command
nginx

# Start the Node.js server in the foreground
# If this crashes, the container will exit (which is what we want)
exec node ./dist/server/entry.mjs
