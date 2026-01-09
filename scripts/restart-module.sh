#!/bin/bash

gecho () {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}${@}${NC}"
}

gecho "Redémarrage du module rtbth"

gecho "\nDéchargement du module noyau (arrêt du pilote)..."
gecho "Cette étape est nécessaire pour réinitialiser l'état matériel de la carte."
gecho "$> sudo modprobe -r rtbth"
sudo modprobe -r rtbth

gecho "\nChargement du module noyau (démarrage du pilote)..."
gecho "$> sudo modprobe rtbth"
sudo modprobe rtbth

gecho "\nLancement de l'outil de pont Bluetooth (tools/rtbt)..."
gecho "ATTENTION : Ne fermez pas ce terminal, sinon le Bluetooth se coupera."
gecho "$> sudo tools/rtbt"
sudo tools/rtbt
