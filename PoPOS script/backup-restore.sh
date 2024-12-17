#!/usr/bin/env bash

bold=$(tput bold)      # ${bold}
normal=$(tput sgr0)    # ${normal}
yellow=$(tput setaf 3) # ${yellow}

zenity --info --title='Please pick a folder!' --text='Válassz egy mappát!' --width='350' --height='100'

# Folder variable
FOLDER=$(zenity  --file-selection --title="Choose a backup directory" --directory)
if [[ $? -eq 1 ]]; then
   echo You did not pick a ${bold}${yellow}folder.${normal} Exiting!
   exit 1
   else
   echo Backups will be saved into ${bold}${yellow}$FOLDER${normal}
fi

# Zenity ablak megjelenítése
user_choice=$(zenity --list --radiolist --width='650' --height='370' \
  --title="Válassz funkciót:" \
  --text="Válassz az alábbi opciók közül:" \
  --column="Válassz" --column="Rendszer" \
   FALSE "Backup"   \
   FALSE "Restore")
if [[ $? -eq 1 ]]; then
   echo ${bold}${yellow}A script futása leállítva. Kilépés!${normal}
   exit 1
fi


  if [[ $user_choice = *"Backup"* ]]; then

  # Wayland Auto-Enable
  echo
  echo ---------------------------------------------
  echo ${bold}${yellow}backup script indítva.${normal}
  echo
    echo
  echo Console -- Mappa másolása: Asztal
    sudo rsync -ap --info=progress2 /home/$USER/Asztal $FOLDER
  echo Console -- Asztal másolva
  echo

  echo Console -- Mappa másolása: Dokumentumok
    sudo rsync -ap --info=progress2 /home/$USER/Dokumentumok $FOLDER
  echo Console -- Dokumentumok másolva
  echo

  echo Console -- Mappa másolása: Letöltések
    sudo rsync -ap --info=progress2 /home/$USER/Letöltések $FOLDER
  echo Console -- Letöltések másolva
  echo

  echo CONSOLE -- Mappa másolása: Games
    sudo rsync -ap --info=progress2 /home/$USER/Games $FOLDER
  echo CONSOLE -- Games másolva
  echo

  echo Console -- Mappa másolása: Zenék
    sudo rsync -ap --info=progress2 /home/$USER/Zenék $FOLDER
  echo Console -- Zenék másolva
  echo

  echo Console -- Mappa másolása: Képek
    sudo rsync -ap --info=progress2 /home/$USER/Képek $FOLDER
  echo Console -- Képek másolva
  echo

  echo Console -- Mappa másolása: Videók
    sudo rsync -ap --info=progress2 /home/$USER/Videók $FOLDER
  echo Console -- Videók másolva
  echo

  echo Console -- Mappa másolása: Sablonok
    sudo rsync -ap --info=progress2 /home/$USER/Videók $FOLDER
  echo Console -- Sablonok másolva
  echo

  echo Console -- Mappa másolása: .config
    sudo rsync -ap --info=progress2 /home/$USER/.config/ $FOLDER/.config
  echo Console -- .config másolva
  echo

  echo Console -- Mappa másolása: .mozilla
    sudo rsync -ap --info=progress2 /home/$USER/.mozilla $FOLDER
  echo Console -- .mozilla másolva
  echo

  echo Console -- Mappa másolása: .icons
    sudo rsync -ap --info=progress2 /home/$USER/.icons $FOLDER
  echo Console -- .icons másolva
  echo

  echo Console -- Mappa másolása: .themes
    sudo rsync -ap --info=progress2 /home/$USER/.themes $FOLDER
  echo Console -- .themes másolva
  echo

  echo Console -- Mappa másolása: .var
    sudo rsync -ap --info=progress2 /home/$USER/.var $FOLDER
  echo Console -- .var másolva
  echo

  echo Console -- Mappa másolása: gnome-shell
    sudo mkdir -p $FOLDER/.local/share/
    sudo rsync -ap --info=progress2 /home/$USER/.local/share/gnome-shell $FOLDER/.local/share/
  echo Console -- gnome-shell másolva
  echo

  echo Console -- Mappa másolása: .local/share/flatpak/overrides
    sudo mkdir -p $FOLDER/.local/share/flatpak
    sudo rsync -ap --info=progress2 /home/$USER/.local/share/flatpak/overrides $FOLDER/.local/share/flatpak
  echo Console -- .local/share/flatpak/overrides másolva
  echo

  echo Console -- Changing Owner of SAVES Folder
    sudo chown -R $USER:$USER $FOLDER
  echo Console -- Owner of SAVES Folder been changed to $USER
  echo

# Keyboard shortcuts backup
  echo Console -- Saving Custom UI settings
    dconf dump / > $FOLDER/$USER-ui
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > $FOLDER/$USER-shortcuts
  echo Console -- All Custom UI settings have been saved
  echo
  echo ${bold}${yellow} backup script befejezve.${normal}
  echo ---------------------------------------------
  echo
fi

if [[ $user_choice = *"Restore"* ]]; then

   sudo rsync -ap --info=progress2 $FOLDER/ /home/$USER/test
  
fi
