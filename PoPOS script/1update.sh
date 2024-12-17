#!/usr/bin/env bash

# Text modifiers
bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

# Nala telepítés
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}NALA - DEB Pkg${normal}
  ech
    sudo apt update
    sudo apt install nala -y
    sudo apt purge ubuntu-advantage-tools -y
    sudo sed -i 's/.set.enabled=true/.set.enabled=false/' /var/lib/NetworkManager/NetworkManager-intern.conf
  echo
  echo ${bold}${yellow}NALA - DEB Pkg ${normal}installed.
  echo ---------------------------------------------

# Creating autostart folder
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Creating autostart folder${normal}
  echo
    mkdir -p /home/$USER/.config/autostart
    sudo chown $USER:$GROUP /home/$USER/.config/autostart
  echo
  echo ${bold}${yellow}Autostart folder ${normal}created.
  echo ---------------------------------------------

# Autostarting ProgramScript after restart
echo ---------------------------------------------
  echo Installing ${bold}${yellow}ProgramScript Autostart${normal}
  echo
    sudo cp -a 3progs.sh.desktop /home/$USER/.config/autostart
    echo Exec=/home/$USER/.progs/3progs.sh >> /home/$USER/.config/autostart/3progs.sh.desktop
    sudo mkdir -p /home/$USER/.progs
    sudo chown $USER:$GROUP /home/$USER/.progs
    sudo cp -a 3progs.sh /home/$USER/.progs
    sudo chmod +x /home/$USER/.progs/3progs.sh
    sudo cp -a content-*/. /home/$USER/.progs
  echo
  echo ${bold}${yellow}ProgramScript Autostart ${normal}installed.
  echo ---------------------------------------------

# Adding Custom nico command
echo ---------------------------------------------
  echo Installing ${bold}${yellow}nico command.${normal}
  echo
    sudo cp -a nico /usr/local/bin/
    sudo chmod +x /usr/local/bin/nico
    sudo cp -a nico-comp.sh /etc/bash_completion.d/
    sudo chmod +x /etc/bash_completion.d/nico-comp.sh
  echo
  echo ${bold}${yellow}nico command with bash completion ${normal}installed.
  echo ---------------------------------------------

# Installing GNOME Software
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}GNOME Software and Flatpak Plugin - DEB Pkg${normal}
  echo
    sudo nala remove pop-shop* -y
    sudo apt install gnome-software gnome-software-plugin-flatpak -y
  echo
  echo ${bold}${yellow}GNOME Software and Flatpak Plugin ${normal}installed.
  echo ---------------------------------------------

# Yaru Theme
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Yaru theme - DEB Pkg${normal}
  echo
    sudo apt install yaru-theme-* -y
  echo
  echo ${bold}${yellow}Yaru theme ${normal}installed.
  echo ---------------------------------------------

# Setting Yaru Dark Black Theme
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}SettingTheme${normal}
  echo
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-purple-dark'
    gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-purple-dark'
    gsettings set org.gnome.desktop.sound theme-name 'Yaru'
  echo
  echo ${bold}${yellow}Theme ${normal}set.
  echo ---------------------------------------------

# Gsettings changes
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Setting UI Preferences before DCONF${normal}
  echo
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0
    gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
    gsettings set org.gnome.mutter center-new-windows true
  echo
  echo ${bold}${yellow}UI Preferences before DCONF ${normal}set.
  echo ---------------------------------------------

# Disabling Geoclue
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Geoclue service disabling / masking${normal}
  echo
    sudo systemctl disable geoclue.service
    sudo systemctl mask geoclue.service
  echo
  echo ${bold}${yellow}Geoclue service disabling / masking ${normal}finished.
  echo ---------------------------------------------

# Enable x86
  echo ---------------------------------------------
  echo Enabling ${bold}${yellow}x86 architecture${normal}
  echo
     sudo dpkg --add-architecture i386
  echo
  echo ${bold}${yellow}x86 architecture ${normal}enabled.
  echo ---------------------------------------------

# Dependencies
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Dependencies${normal}
  echo
    sudo nala install python3-pydbus gettext lm-sensors libgtksourceview-4-dev python3-psutil libgconf-2-4 libappindicator1 libc++1 gconf2 libsystemd-dev pkg-config ninja-build git libdbus-1-dev libinih-dev build-essential python3-dev libgirepository1.0-dev appstream-util python3 python3-pip gir1.2-appindicator3-0.1 gnome-shell-extension-appindicator libdazzle-1.0-dev debhelper debugedit dh-autoreconf dh-strip-nondeterminism dwz fp-compiler fp-compiler-3.2.2 fp-docs-3.2.2 fp-ide-3.2.2 fp-units-base-3.2.2 fp-units-db-3.2.2 fp-units-fcl-3.2.2 fp-units-fv-3.2.2 fp-units-gfx-3.2.2 fp-units-gtk2-3.2.2 fp-units-math-3.2.2 fp-units-misc-3.2.2 fp-units-multimedia-3.2.2 fp-units-net-3.2.2 fp-units-rtl-3.2.2 fp-utils-3.2.2 fpc fpc-3.2.2 fpc-source-3.2.2 gdb gir1.2-gtk-2.0 intltool-debian lcl-2.2 lcl-gtk2-2.2 lcl-nogui-2.2 lcl-units-2.2 lcl-utils-2.2 liba52-0.7.4 liba52-0.7.4-dev libarchive-cpio-perl libarchive-zip-perl libasound2-dev libbabeltrace1 libc6-dbg libcaca-dev libdebhelper-perl libdebuginfod-common libdebuginfod1 libfile-stripnondeterminism-perl libflac-dev libfluidsynth3 libforms-dev libforms2 libgd-dev libgl1-mesa-dev libglu1-mesa-dev libgmp-dev libgmpxx4ldbl libgraphviz-dev libgtk2.0-dev libgvc6-plugins-gtk libinstpatch-1.0-2 libipt2 libltdl-dev libmad0 libmad0-dev libmail-sendmail-perl libmikmod-dev libmodplug-dev libmodplug1 libogg-dev libproxy-tools libpulse-dev libsdl-mixer1.2 libsdl-mixer1.2-dev libsdl1.2-dev libslang2-dev libsource-highlight-common libsource-highlight4v5 libsub-override-perl libsys-hostname-long-perl libtool libvlc-bin libvlc-dev libvlc5 libvlccore9 libvorbis-dev libvpx-dev libxdot4 libxpm-dev libxt-dev libxxf86dga-dev libxxf86vm-dev m4 po-debconf gcc-multilib g++-multilib mesa-common-dev libxnvctrl-dev python3-evdev python3-decorator python3-pyte libpython3-dev python3-setuptools python3-pydantic meson v4l-utils libspeexdsp1 ffmpeg -y
  # v4l2loopback-dkms v4l2loopback-utils libqt5sql5 libqt5svg5 libqt5xml5
  echo
  echo ${bold}${yellow}Dependencies ${normal}installed.
  echo ---------------------------------------------

  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}XanMod - Gaming Kernel AMD - DEB Pkg${normal}

  wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg
  echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list
  sudo apt update && sudo apt install linux-xanmod-edge-x64v4 -y

  echo ${bold}${yellow}XanMod - Gaming Kernel AMD ${normal}installed.
  echo ---------------------------------------------
  echo

# Flatseal - Flatpak app jogosultság beállító
echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Flatseal - flatpak${normal}

  flatpak install flathub com.github.tchx84.Flatseal --user -y
  sudo cp -a overrides /home/$USER/.local/share/flatpak

  echo ${bold}${yellow}Flatseal ${normal}installed.
  echo ---------------------------------------------
  echo

# All Updates
  echo ---------------------------------------------
  echo ${bold}${yellow}Upgrading the System${normal}
  echo
    sudo nala upgrade -y
  echo
  echo ${bold}${yellow}System upgraded!${normal}
  echo ---------------------------------------------

fwupdmgr update -y

# User beállítások
  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}User settings${normal}

  sudo rsync -ap --info=progress2 gnome-shell /home/$USER/.local/share/
  sudo rsync -ap --info=progress2 burn-my-windows /home/$USER/.config/
  sudo apt install git -y
  git clone --depth=1 https://github.com/realmazharhussain/gdm-tools.git
  sudo rsync -ap --info=progress2 install.sh gdm-settings/
  cd gdm-tools
  ./install.sh
  cd -
  dconf load / < ui-*
  sudo apt update
  sudo apt upgrade -y
  sudo rm -rf gdm-tools

  # Debloater Script by DanyHolder
  sudo nala purge gnome-calendar* gnome-contacts* gnome-weather* pop-shop* gnome-remote-desktop* gucharmap* com.github.donadigo.eddy* totem* geary* seahorse* popsicle* libreoffice-draw* libreoffice-math* libreoffice-impress* imagemagick* vinagre* gnome-font-viewer gnome-power-manager -y

  echo ${bold}${yellow}User settings ${normal}installed.
  echo ---------------------------------------------

  echo
  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Gnome Extension Manager - DEB Pkg${normal}

      sudo apt install gnome-shell-extensions -y

  echo ${bold}${yellow}Gnome Extension Manager / All Gnome Extensions ${normal}installed.
  echo ---------------------------------------------

  dconf load / < ui*



  echo ---------------------------------------------
  echo Installing ${bold}${yellow}Nvidia Driver Version 535${normal}
    sudo cp -a nvidia-pin1002 /etc/apt/preferences.d
    sudo add-apt-repository ppa:graphics-drivers/ppa -y
    sudo apt update
    sudo apt install nvidia-driver-535 -y
    sudo apt-mark hold nvidia-driver-535
    sudo sed -i 's/WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf
    sudo sed -i '5d' /var/lib/AccountsService/users/$USER
    sudo cp -a .themes /home/$USER/
    sudo cp -a .icons /home/$USER/
    sudo cp -a .mozilla /home/$USER/
  echo Nvidia Driver Version 535 ${bold}${yellow}installed.${normal}
  echo ---------------------------------------------
  echo
  echo ---------------------------------------------
  echo Downloading ${bold}${yellow}Hungarian LangPack${normal}
  echo
    sudo apt install language-pack-gnome-hu language-pack-gnome-hu-base language-pack-hu language-pack-hu-base -y
  echo
  echo ${bold}${yellow}Hungarian LangPack ${normal}downloaded.
  echo ---------------------------------------------
  echo  

# Script end
echo ${bold}${yellow}The system will restart in 3 seconds...${normal}
echo ${bold}${yellow}3...${normal}
sleep 1
echo ${bold}${yellow}2...${normal}
sleep 1
echo ${bold}${yellow}1...${normal}
sleep 1

sudo reboot
