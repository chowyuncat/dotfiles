#!/bin/bash

vmnet="/Applications/VMware Fusion.app/Contents/Library/vmnet-cli" 
sudo "${vmnet}" --configure
sudo "${vmnet}" --stop
sudo "${vmnet}" --start