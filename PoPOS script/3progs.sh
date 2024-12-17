#!/bin/bash

# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

# APT/Flatpak APP TELEPITO SCRIPT

# Entering work folder
cd /home/$USER/.progs
sudo mkdir -p /home/$USER/.var/app/
sudo chown -R $USER:$GROUP /home/$USER

# Zenity ablak megjelenítése
user_choice=$(zenity --list --checklist --width='1000' --height='1000' \
  --title="APP Telepítő" \
  --text="Válassz a programok közül:" \
  --column="Válassz" --column="Programnév / Leírás" \
  FALSE "GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás" \
  FALSE "GNOME Clocks - ébresztő, világóra, stopper, időzítő" \
  FALSE "Steam Launcher" \
  FALSE "Heroic Launcher - Epic Games Launcher Linux verziója" \
  FALSE "GameMode" \
  FALSE "Kisak FRESH AMD Driver 24.0.4 Majdnem a legujabb verzio. Stabil!" \
  FALSE "PeaZip - tömörítő program" \
  FALSE "Neofetch - terminálos rendszerinfó megjelenítő" \
  FALSE "Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi" \
  FALSE "Mumble - hang alapú csevegőalkalmazás" \
  FALSE "Lutris - Game launchereket, és egyéb appokat futtató környezet" \
  FALSE "KVM QEMU - virtualizáció, virtuális gépek futtatása" \
  FALSE "CoreCTRL - AMD GPU beállító alkalmazás" \
  FALSE "OBS - Nyílt forrású felvételkészítő és streamelő program" \
  FALSE "Firejail - Bongeszo Zart Kontener" \
  FALSE "Vivaldi - webböngésző" \
  FALSE "Brave - webböngésző" \
  FALSE "Librewolf - Firefox ESR alapú webböngésző" \
  FALSE "FreeTube - Adatlopás-mentes YouTube-kliens" \
  FALSE "OnlyOffice - Legujabb MS Office Linuxos megfeleloje - LIBREOFFICE-t TOROLNI FOGJA!" \
  FALSE "DosBox - Régi, DOS-os játék emulátor" \
  FALSE "Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás" \
  FALSE "KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n" \
  FALSE "Spotify - Zenelejátszó Linuxra" \
  FALSE "Darktable - Adobe Lightroom Linuxos megfelelője" \
  FALSE "VLC - médialejátszó" \
  FALSE "QBittorrent - torrent kliens" \
  FALSE "Kdenlive - Linuxos videószerkesztő program" \
  FALSE "PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra" \
  FALSE "Discord - VoIP-, és csevegőalkalmazás" \
  FALSE "Easy Effects - Hangkártyát vezérlő program (Hangeffektek)" \
  FALSE "Parabolic - Videóletöltő, működik minden platformon" \
  FALSE "Vibrant - Szín szaturáció beállító program" \
  FALSE "Legutobbi Baloldali Menupont Torlese a File Kezelobol (Nautilus)" \
  FALSE "Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal" \
  FALSE "MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb." \
  FALSE "Zenpower3 - AMD CPU Feszultseg, Aramerosseg es Fogyasztas Monitorozas" \
  FALSE "GTKStressTesting - CPU Monitorozas es Stress Test Program" \
  FALSE "Double Commander - Total Commander Linuxos megfelelője" \
  FALSE "Midnight Commander - 2 ablakos file kezelő" \
  FALSE "HD Sentinel - Merevlemez állapot ellenőrző program" \
  FALSE "GUFW - Tűzfal" \
  FALSE "Audacity - Hangszerekesztő program")
if [[ $? -eq 1 ]]; then
   echo ${bold}${yellow}Cancelled by User. Exiting!${normal}
   exit 1
fi

if [[ $user_choice = *"GNOME Screenshot - gyorsbillentyűs képernyőkép létrehozás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Screenshot - DEB Pkg${normal}

    sudo nala install gnome-screenshot -y

  echo ${bold}${yellow}GNOME Screenshot ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GNOME Clocks - ébresztő, világóra, stopper, időzítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Clocks - DEB Pkg${normal}

    sudo nala install gnome-clocks -y
    sudo rsync -ap --info=progress2 /usr/share/sounds/Yaru/stereo/complete.oga /usr/share/sounds/freedesktop/stereo/
    sudo rsync -ap --info=progress2 alarm-clock*.oga /usr/share/sounds/freedesktop/stereo

  echo ${bold}${yellow}GNOME Clocks with sound changes ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Steam Launcher"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Steam Launcher - DEB Pkg${normal}

  sudo nala install steam -y
  sudo mkdir -p /home/$USER/.steam/steam
  sudo mkdir -p /home/$USER/.steam/root/compatibilitytools.d
  sudo chown -R $USER:$GROUP /home/$USER/.steam
  sudo rsync -ap --info=progress2 steam_dev.cfg /home/$USER/.steam/steam
  sudo chmod +x update-proton-ge
  ./update-proton-ge
  sudo cp -a update-proton-ge /usr/share/

  echo ${bold}${yellow}Steam + Latest ProtonGE ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Heroic Launcher - Epic Games Launcher Linux verziója"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Heroic Launcher - flatpak with MangoHud${normal}

  flatpak install flathub com.heroicgameslauncher.hgl --user -y
  flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/22.08 --user -y
  flatpak override --user --filesystem=xdg-config/MangoHud:ro

  echo ${bold}${yellow}Heroic Launcher with MangoHud ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GameMode"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GameMode - DEB Pkg${normal}

  sudo nala install gamemode -y

  echo ${bold}${yellow}GameMode ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Kisak FRESH AMD Driver 24.0.4 Majdnem a legujabb verzio. Stabil!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Kisak FRESH AMD Driver 24.0.4 - DEB Pkg${normal}

  sudo add-apt-repository ppa:kisak/kisak-mesa -y
  sudo rsync -ap --info=progress2 kisak-pin1003 /etc/apt/preferences.d/
  sudo apt update
  sudo apt upgrade -y

  echo ${bold}${yellow}Kisak FRESH AMD Driver 24.0.4 ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"PeaZip - tömörítő program"* ]]; then
  echo
  echo Installing ${bold}${yellow}PeaZip - flatpak${normal}

  flatpak install flathub io.github.peazip.PeaZip --user -y

  echo ${bold}${yellow}PeaZip ${normal}installed.
  echo
fi

if [[ $user_choice = *"Neofetch - terminálos rendszerinfó megjelenítő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Neofetch - DEB Pkg${normal}

  sudo nala install neofetch -y

  echo ${bold}${yellow}Neofetch ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Input-Remapper 2.0 - egér/bill. gomb konfiguráló, macro író progi"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Input-Remapper 2.0 - DEB Pkg${normal}

  sudo nala install build-essential libpython3-dev libdbus-1-dev python3-evdev python3-pydbus libgtksourceview-4-dev python3-pydantic libavahi-compat-libdnssd1 gettext -y
  sudo dpkg -i input-remapper*.deb

  echo ${bold}${yellow}Input-Remapper 2.0 ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Mumble - hang alapú csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Mumble - DEB Pkg${normal}

  sudo nala install libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5sql5 libqt5svg5 libqt5widgets5 libqt5xml5 libspeexdsp1 -y
  sudo nala install mumble -y

  echo ${bold}${yellow}Mumble ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Lutris - Game launchereket, és egyéb appokat futtató környezet"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Lutris - flatpak with MangoHud - flatpak${normal}

  flatpak install flathub net.lutris.Lutris --user -y
  flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08 --user -y
  flatpak override --user --filesystem=xdg-config/MangoHud:ro

  echo ${bold}${yellow}Lutris with MangoHud compatibility ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KVM QEMU - virtualizáció, virtuális gépek futtatása"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KVM QEMU - DEB Pkg${normal}

  sudo nala install libvirt0 libvirt-daemon libvirt-daemon-system-systemd libvirt-daemon-config-network libvirt-daemon-config-nwfilter libvirt-daemon-system-systemd libfdt1 libibverbs1 libpmem1 librdmacm1 libslirp0 qemu-system-common qemu-system-data seabios ipxe-qemu ipxe-qemu-256k-compat-efi-roms gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0 python3-libvirt virtinst -y
  sudo nala install qemu-system-x86 qemu-utils libvirt-daemon-system libvirt-clients bridge-utils virt-manager ovmf -y
  sudo usermod -aG kvm $USER
  sudo usermod -aG input $USER
  sudo usermod -aG libvirt $USER
  # qemu.conf sed parancs $USER-el hogy ne kelljen kezzel csinalni

  echo ${bold}${yellow}KVM QEMU ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"CoreCTRL - AMD GPU beállító alkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}CoreCTRL and User Settings - DEB Pkg${normal}

  sudo add-apt-repository ppa:ernstp/mesarc -y
  sudo nala install libbotan-2-19 libqt5charts5 libqt5qml5 libqt5quick5 libquazip5-1 qml-module-qtquick2 qml-module-qtquick-controls2 qml-module-qtquick-layouts qml-module-qtquick-window2 qml-module-qt-labs-platform qml-module-qtcharts vulkan-tools -y
  sudo apt update
  sudo nala install corectrl -y
  sudo kernelstub -o "amdgpu.ppfeaturemask=0xffffffff"
  cp /usr/share/applications/org.corectrl.CoreCtrl.desktop ~/.config/autostart/org.corectrl.CoreCtrl.desktop
  echo "Identity=unix-group:$USER" >> 90-corectrl.pkla
  sudo rsync -ap --info=progress2 90-corectrl.pkla /etc/polkit-1/localauthority/50-local.d/
  sudo mkdir -p ~/.config/corectrl
  sudo chown -R $USER:$GROUP ~/.config
  sudo rsync -ap --info=progress2 corectrl.ini ~/.config/corectrl

  echo ${bold}${yellow}CoreCTRL and User settings ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"OBS - Nyílt forrású felvételkészítő és streamelő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}OBS Studio - flatpak${normal}

  flatpak install com.obsproject.Studio --user -y

  echo ${bold}${yellow}OBS Studio ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Firejail - Bongeszo Zart Kontener"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FireJail${normal}

  sudo nala install firejail -y

  echo ${bold}${yellow}FireJail ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vivaldi - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vivaldi - DEB Pkg${normal}

  wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/vivaldi-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/vivaldi-archive-keyring.gpg] https://repo.vivaldi.com/archive/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list
  sudo apt update
  sudo nala install vivaldi-stable -y
  sleep 2
  sudo cp -a vivaldi /home/$USER/.config/

  echo ${bold}${yellow}Vivaldi ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Brave - webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Brave - flatpak${normal}

  flatpak install flathub com.brave.Browser --user -y
  sudo cp -a /home/$USER/.progs/com.brave.Browser /home/$USER/.var/app/

  echo ${bold}${yellow}Brave ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Librewolf - Firefox ESR alapú webböngésző"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Librewolf - DEB Pkg${normal}

  sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

  distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

  wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
  sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF
  sudo apt update
  sudo nala install librewolf -y
  sudo cp -a .librewolf /home/$USER/

  echo ${bold}${yellow}LibreWolf ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"FreeTube - Adatlopás-mentes YouTube-kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}FreeTube - flatpak${normal}

  flatpak install flathub io.freetubeapp.FreeTube --user -y
  sudo mkdir -p ~/.var/app/io.freetubeapp.FreeTube/config
  sudo chown -R $USER:$GROUP ~/.var
  sudo rsync -ap --info=progress2 FreeTube ~/.var/app/io.freetubeapp.FreeTube/config
  

  echo ${bold}${yellow}FreeTube ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"OnlyOffice - Legujabb MS Office Linuxos megfeleloje - LIBREOFFICE-t TOROLNI FOGJA!"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}OnlyOffice - flatpak${normal}

  flatpak install flathub org.onlyoffice.desktopeditors --user -y
  sudo nala purge libreoffice* -y

  echo ${bold}${yellow}OnlyOffice ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"DosBox - Régi, DOS-os játék emulátor"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}DosBox Staging - flatpak${normal}

  sudo nala install libsdl-sound1.2 -y
  flatpak install flathub io.github.dosbox-staging --user -y

  echo ${bold}${yellow}DosBox - Staging ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Pavucontrol - Apponkénti hangerőszabályzás/konfigurálás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Pavucontrol - DEB Pkg${normal}

  sudo nala install pavucontrol -y

  echo ${bold}${yellow}Pavucontrol ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"KeepassXC - Jelszókezelő, az adatbázist titkosítva tárolja a PC-n"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}KeepassXC - flatpak${normal}

  flatpak install flathub org.keepassxc.KeePassXC --user -y

  echo ${bold}${yellow}KeePassXC ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Spotify - Zenelejátszó Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Spotify - flatpak${normal}

  flatpak install flathub com.spotify.Client --user -y

  echo ${bold}${yellow}Spotify ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Darktable - Adobe Lightroom Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Darktable - flatpak${normal}

  flatpak install flathub org.darktable.Darktable --user -y

  echo ${bold}${yellow}Darktable ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"VLC - médialejátszó"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}VLC Media Player - flatpak${normal}

  flatpak install flathub org.videolan.VLC --user -y

  echo ${bold}${yellow}VLC Media Player ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"QBittorrent - torrent kliens"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}QBittorrent - flatpak${normal}

  flatpak install flathub org.qbittorrent.qBittorrent --user -y

  echo ${bold}${yellow}QBittorrent ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Kdenlive - Linuxos videószerkesztő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Kdenlive - flatpak${normal}

  flatpak install flathub org.kde.kdenlive --user -y

  echo ${bold}${yellow}Kdenlive ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"PhotoGIMP - Adobe Photoshop-szerű képszerkesztő Linuxra"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}PhotoGIMP- flatpak${normal}

  flatpak install flathub org.gimp.GIMP --user -y
  sudo rsync -ap --info=progress2 PhotoGIMP/. ~/

  echo ${bold}${yellow}GIMP with PhotoGIMP Addon ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Discord - VoIP-, és csevegőalkalmazás"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Discord - flatpak${normal}

  flatpak install flathub com.discordapp.Discord --user -y
  flatpak install flathub de.shorsh.discord-screenaudio --user -y
  sudo apt install libcanberra-gtk-module:i386 -y

  # Vencord script credit to Lordify
  # Add USER repo to flathub, because Linux Mint doesn't have it
  #flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
  # Download the latest release of Vencord Installer from Github
  wget https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli-linux
  sleep 1
  # Grant execution permission to vencord installer
  sudo chmod +x VencordInstallerCli-linux
  sleep 1
  # Create Symlink of /home/$USER directory in /usr/share/Vencord, because the Kurva Vencord script doesn't handle variables like $USER
  sudo ln -s ~/ /usr/share/Vencord
  sleep 1
  # Install vencord with openasar
  ./VencordInstallerCli-linux -install -location /usr/share/Vencord/.local/share/flatpak/app/com.discordapp.Discord
  sleep 1
  ./VencordInstallerCli-linux -install-openasar -location /usr/share/Vencord/.local/share/flatpak/app/com.discordapp.Discord/
  sleep 1
  # Remove symlink from /usr/share/Vencord
  sudo unlink /usr/share/Vencord
  sleep 1
  sudo mkdir -p /home/$USER/.var/app/com.discordapp.Discord/config/Vencord
  sudo chown -R $USER:$GROUP /home/$USER/.var/app/com.discordapp.Discord/config/Vencord/
  sudo rsync -ap --info=progress2 themes /home/$USER/.var/app/com.discordapp.Discord/config/Vencord/
  sudo rsync -ap --info=progress2 com.discordapp.Discord.desktop /home/$USER/.local/share/flatpak/exports/share/applications
  echo ${bold}${yellow}Discord / Vencord ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Easy Effects - Hangkártyát vezérlő program (Hangeffektek)"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Easy Effects - flatpak${normal}

  flatpak install flathub com.github.wwmm.easyeffects --user -y

  echo ${bold}${yellow}Easy Effects ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Parabolic - Videóletöltő, működik minden platformon"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Parabolic - flatpak${normal}

  flatpak install flathub org.nickvision.tubeconverter --user -y

  echo ${bold}${yellow}Parabolic ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Vibrant - Szín szaturáció beállító program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Vibrant - flatpak${normal}

  flatpak install flathub io.github.libvibrant.vibrantLinux --user -y

  echo ${bold}${yellow}Vibrant ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Legutobbi Baloldali Menupont Torlese a File Kezelobol (Nautilus)"* ]]; then
  echo
  echo ---------------------------------------------
  echo Removing ${bold}${yellow}Nautilus Recent Menu ${normal}

  gsettings set org.gnome.desktop.privacy remember-recent-files false

  echo ${bold}${yellow}Nautilus Recent Menu ${normal}removed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Csak a FO Monitoron jelenjen meg a Login Screen - Tobb monitoros setupoknal"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Only main monitor on login${normal}

  zenity --warning --text='!!  SWITCH TO PRIMARY MONITOR ONLY  !!' --width='300' --height='100'
  sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config/monitors.xml
  sudo chown gdm:gdm /var/lib/gdm3/.config/monitors.xml

  echo ${bold}${yellow}Only main monitor on login ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"MangoHud/Goverlay - MSI Afterburner Linuxos megfelelője, FPS kijelzés, stb."* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}MangoHud/Goverlay - built from source${normal}
  sudo nala install meson ninja-build gcc g++ glslang-dev glslang-tools libxnvctrl-dev git libx11-dev mesa-common-dev breeze cmake -y
  # dependencies python3-numpy python3-matplotlib lazarus-ide
  sudo mkdir -p /usr/share/goverlay
  sudo chown $USER:$GROUP /usr/share/goverlay
  sudo cp -a goverlay goverlay.ico /usr/share/goverlay
  sudo cp -a goverlay.desktop /home/$USER/.local/share/applications
  sudo dpkg -i libqt6pas6_*.deb
  sudo dpkg -i libqt6pas6-*.deb
  sudo apt install -f -y
  sudo dpkg -i libqt6pas6_*.deb
  sudo dpkg -i libqt6pas6-*.deb
  sudo mkdir -p /home/$USER/.mangohud
  sudo chown -R $USER:$GROUP /home/$USER/.mangohud
  cd /home/$USER/.mangohud
  git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
  cd MangoHud
  meson build
  sudo ninja -C build install
  cd -
  sudo rm -rf /home/$USER/.mangohud
  # sudo sed -i 's/Exec=goverlay/Exec=goverlay --style breeze/' /usr/local/share/applications/io.github.benjamimgois.goverlay.desktop
  echo ${bold}${yellow}MangoHud/Goverlay - built from source ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Zenpower3 - AMD CPU Feszultseg, Aramerosseg es Fogyasztas Monitorozas"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Zenpower3 - built from source${normal}
  
  sudo mkdir -p /home/$USER/.mangohud
  sudo chown -R $USER:$GROUP /home/$USER/.mangohud
  cd /home/$USER/.mangohud
  git clone https://github.com/Ta180m/zenpower3.git
  cd zenpower3
  sudo make dkms-install
  sudo modprobe -r k10temp
  sudo bash -c 'sudo echo -e "\n# replaced with zenpower\nblacklist k10temp" >> /etc/modprobe.d/blacklist.conf'
  sudo modprobe zenpower
  cd -
  sudo rm -rf /home/$USER/.mangohud
  echo ${bold}${yellow}Zenpower3 ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GTKStressTesting - CPU Monitorozas es Stress Test Program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GTKStressTesting - Flatpak${normal}

  flatpak install flathub com.leinardi.gst --user -y

  echo ${bold}${yellow}GTKStressTesting ${normal}installed.
  echo ---------------------------------------------
  echo
fi


if [[ $user_choice = *"Double Commander - Total Commander Linuxos megfelelője"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Double Commander - DEB Pkg${normal}

  sudo nala install doublecmd-gtk -y

  echo ${bold}${yellow}Double Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Midnight Commander - 2 ablakos file kezelő"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Midnight Commander - DEB Pkg${normal}

  sudo nala install mc -y

  echo ${bold}${yellow}Midnight Commander ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"HD Sentinel - Merevlemez állapot ellenőrző program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GUFW - DEB Pkg${normal}

  cd /home/$USER/.progs/HDSentinel_GUI
  sudo chmod +x install.sh
  ./install.sh

  echo ${bold}${yellow}GUFW ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"GUFW - Tűzfal"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GUFW - DEB Pkg${normal}

  sudo nala install gufw* -y

  echo ${bold}${yellow}GUFW ${normal}installed.
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Audacity - Hangszerekesztő program"* ]]; then
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Audacity - flatpak${normal}

  flatpak install flathub org.audacityteam.Audacity --user -y
  sudo mkdir -p ~/.var/app/io.freetubeapp.FreeTube/config
  sudo chown -R $USER:$GROUP ~/.var
  sudo rsync -ap --info=progress2 audacity ~/.var/app/org.audacityteam.Audacity/config

  echo ${bold}${yellow}Audacity ${normal}installed.
  echo ---------------------------------------------
  echo
fi


sudo rm /home/$USER/.config/autostart/3progs.sh.desktop

sleep 1

sudo chown -R $USER:$GROUP /home/$USER

zenity --question --title='Restart required!' --text='Restart in 5 seconds?' --width='300' --height='100'
if [ $? = 0 ]; then

(
echo "0" ;
echo "# Restart in 5s" ; sleep 1
echo "20" ;
echo "# Restart in 4s" ; sleep 1
echo "40" ;
echo "# Restart in 3s" ; sleep 1
echo "60" ;
echo "# Restart in 2s" ; sleep 1
echo "80" ;
echo "# Restart in 1s" ; sleep 1

) |
zenity --progress \
 --title="All updates are Installed!" --width='300' \
 --text="Restart" \
 --auto-close \
 --no-cancel
 sudo rm -rf /usr/share/progs
 sudo rm /home/$USER/.config/autostart/progs.desktop
 sudo reboot;
 else
 echo ${bold}${yellow}User exited the script. Ending!${normal}
 exit 0;  
fi
