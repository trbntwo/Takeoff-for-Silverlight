#!/usr/bin/bash

# Add Flathub
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

core-desktop-applications(){
    OOBE=$(cat ./flatpaks/oobe-flatpaks.txt)
    for FLATPAK in $OOBE; do
        flatpak install --user -y flathub $FLATPAK
    done
}

tutanota(){
    mkdir -p ~/-local/share/appimages
    curl -s -O https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage
    chmod ug+x tutanota-desktop-linux.AppImage
    mv tutanota-desktop-linux.AppImage ~/.local/share/appimages
}

entertainment(){
    ENTERTAINING-FP=$(cat ./flatpaks/entertainment-flatpaks.txt)
    for FLATPAK in $ENTERTAINING; do
        flatpak install --user -y flathub $FLATPAK
    done
}

devtools(){
    DEVTOOL=$(cat ./flatpaks/devtool-flatpaks.txt)
    for FLATPAK in $DEVTOOL; do
        flatpak install --user -y flathub $FLATPAK
    done
}

office(){
    OFFICE=$(cat ./flatpaks/devtool-flatpaks.txt)
    for FLATPAK in $OFFICE; do
        flatpak install --user -y flathub $FLATPAK
    done
}

media-creation(){
    MEDIA=$(cat ./flatpaks/media-flatpaks.txt)
    for FLATPAK in $MEDIA; do
        flatpak install --user -y flathub $FLATPAK
    done
}

gaming(){
    GAMING=$(cat ./flatpaks/gaming-flatpaks.txt)
    for FLATPAK in $GAMING; do
        flatpak install --user -y flathub $FLATPAK
    done
}

while getopts "scatedomg" option; do
    case $option in
        s)  source ./scripts/settings.sh
            ;;
        c)  source ./scripts/customization.sh
            ;;
        a)  core-desktop-applications
            ;;
        t)  tutanota
            ;;
        e)  entertainment
            ;;
        d)  devtools
            ;;
        o)  office
            ;;
        m)  media-creation
            ;;
        g)  gaming
            ;;
    esac
done