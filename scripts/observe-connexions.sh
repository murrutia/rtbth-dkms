#!/bin/bash
gecho () {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}${@}${NC}"
}

gecho "Observation des connexions Bluetooth (avec Adresses MAC)..."
gecho "$> bluetoothctl scan on"
bluetoothctl scan on