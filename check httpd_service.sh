#!/bin/bash

# Check if httpd service is running
if systemctl is-active --quiet httpd; then
    echo "httpd service is running."
else
    # If not running, try to start it
    echo "httpd service is not running. Starting it now..."
    sudo systemctl start httpd
 
    # Check if the start was successful
    if [ $? -eq 0 ]; then
        echo "httpd service started successfully."
    else
        echo "Failed to start httpd service. Please check the logs for more information."
    fi
fi
