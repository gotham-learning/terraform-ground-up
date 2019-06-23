#!/bin/bash
sudo apt-get update
sudo apt-get install -y python
echo "This is fine"
echo "Hello, World" > index.html
python -m SimpleHTTPServer 8000