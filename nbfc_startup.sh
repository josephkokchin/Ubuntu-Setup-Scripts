#!/bin/bash

# Auto-start script for NBFC (Notebook Fan Controller) 
sudo systemctl enable nbfc --now
mono /opt/nbfc/nbfc.exe config -a "Gigabyte AERO 14KV8"
mono /opt/nbfc/nbfc.exe start

# Check status of NBFC when manually running script
mono /opt/nbfc/nbfc.exe status --all
