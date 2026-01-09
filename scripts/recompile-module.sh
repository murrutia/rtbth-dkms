#!/bin/bash

gecho () {
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}${@}${NC}"
}

gecho "Reconstruction et réinitialisation complète du module rtbth"

gecho "\nNettoyage de l'interface système (/dev/rtbth)..."
gecho "$> sudo rm -f /dev/rtbth"
sudo rm -f /dev/rtbth

gecho "\nDéchargement du module noyau (arrêt du pilote)..."
gecho "Cette étape est nécessaire pour réinitialiser l'état matériel de la carte."
gecho "$> sudo modprobe -r rtbth"
sudo modprobe -r rtbth

gecho "\n--- Début de la procédure DKMS ---"
gecho "Suppression de l'ancienne version dans DKMS..."
gecho "$> sudo dkms remove rtbth/3.9.8 --all"
sudo dkms remove rtbth/3.9.8 --all

gecho "\nEnregistrement des sources dans DKMS..."
gecho "$> sudo dkms add rtbth/3.9.8"
sudo dkms add rtbth/3.9.8

gecho "\nCompilation du module pour le noyau actuel..."
gecho "$> sudo dkms build rtbth/3.9.8"
sudo dkms build rtbth/3.9.8

gecho "\nInstallation du module compilé dans le système..."
gecho "\n$> sudo dkms install rtbth/3.9.8"
sudo dkms install rtbth/3.9.8
gecho "\n--- Fin de la procédure DKMS ---"

gecho "\nChargement du module noyau (démarrage du pilote)..."
gecho "$> sudo modprobe rtbth"
sudo modprobe rtbth

gecho "\nCréation manuelle de l'interface de communication (/dev/rtbth)..."
gecho "Création du lien 'Caractère' (c) avec le Major ID 192 (défini dans le pilote)."
gecho "$> sudo mknod /dev/rtbth c 192 0 && sudo chmod 666 /dev/rtbth"
sudo mknod /dev/rtbth c 192 0 && sudo chmod 666 /dev/rtbth

gecho "\nLancement de l'outil de pont Bluetooth (tools/rtbt)..."
gecho "ATTENTION : Ne fermez pas ce terminal, sinon le Bluetooth se coupera."
gecho "$> sudo tools/rtbt"
sudo tools/rtbt
