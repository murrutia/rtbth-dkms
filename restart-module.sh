#!/bin/bash

gecho () {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "\n$> ${GREEN}${@}${NC}"
}

gecho "sudo dkms remove rtbth/3.9.8 --all"
sudo dkms remove rtbth/3.9.8 --all

gecho "sudo dkms add rtbth/3.9.8"
sudo dkms add rtbth/3.9.8

gecho "sudo dkms build rtbth/3.9.8"
sudo dkms build rtbth/3.9.8

gecho "sudo dkms install rtbth/3.9.8"
sudo dkms install rtbth/3.9.8

gecho "sudo modprobe rtbth"
sudo modprobe rtbth

gecho "sudo tools/rtbt"
sudo tools/rtbt