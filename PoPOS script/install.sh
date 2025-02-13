#!/bin/bash
[ -z "$DESTDIR" ] && DESTDIR=/
[ -z "$PREFIX" ] && PREFIX="/usr/local"

currentDir="$(realpath "$(dirname "$0")")"
binDir="$(realpath -m "$DESTDIR"/"$PREFIX"/bin)"
manDir="$(realpath -m "$DESTDIR"/"$PREFIX"/man)"
fishComp="$(realpath -m "$DESTDIR"/"$PREFIX"/share/fish/vendor_completions.d)"
confDir="$(realpath -m "$DESTDIR"/etc/gdm-tools)"

NoAsk=false

helpMsg(){
  echo "Usage: ./install.sh [OPTION]"
  echo ""
  echo "Options"
  echo "  -h, --help    Show this help message"
  echo "  --no-ask      Perform a non-interactive install"
  echo ""
  echo "Environment Variables"
  echo "  DESTDIR       Target Root Directory"
  echo "  PREFIX        Install Prefix e.g. /usr, /usr/local or ~/.local"
}

case "$1" in
  -h|--help|h|help)
    helpMsg
    exit
  ;;
  --no-ask)
    NoAsk=true
  ;;
  '')
    echo -n
  ;;
  *)
    echo "Invalide option! Run './install.sh -h' for help."
    exit 1
  ;;
esac

if $NoAsk; then
  AptOptions='-y'
  PacmanOptions='--noconfirm'
  CpOptions='-n'
else
  CpOptions='-i'
fi

depMsg() {
    echo "This script needs '$depName' in order to work. But it is not installed." > /dev/stderr
    echo "Please, install it first in order to install gdm-tools"
    echo "Its package name may be $pkgNames depending on your distro."
    exit 1
}

if ! which glib-compile-resources gresource &> /dev/null; then
  depName='GLib (developer edition)'
  pkgNames="'glib2', 'glib2-devel', 'libglib2.0-dev', or straight up 'glib', etc. "
  if which apt &> /dev/null; then
    sudo apt install $AptOptions libglib2.0-dev -y || depMsg
  elif which pacman &> /dev/null; then
    sudo pacman -S $PacmanOptions glib2 || depMsg
  else
    depMsg
  fi
fi

if ! which dconf &> /dev/null; then
  depName='DConf (CommandLine Version)'
  pkgNames="'dconf-cli', or 'dconf'"
  if which apt &> /dev/null; then
    sudo apt install $AptOptions dconf-cli -y || depMsg
  elif which pacman &> /dev/null; then
    sudo pacman -S $PacmanOptions dconf || depMsg
  else
    depMsg
  fi
fi

dir1ToCheck="$(realpath -m "$DESTDIR")"
dir2ToCheck="$(realpath -m "$PREFIX")"
if mkdir -p "$dir1ToCheck" "$dir1ToCheck"/"$dir2ToCheck" 2>/dev/null && [ -w "$dir1ToCheck" ] && [ -w "$dir1ToCheck"/"$dir2ToCheck" ]; then
  rootNeeded=false
fi

if [ $UID = '0' ] || [ "$rootNeeded" = false ] ; then
  echo 'installing gdm-tools ...'
  echo ''
  mkdir -p "$binDir" "$manDir"/man1 "$fishComp" "$confDir"
  gzip -fk "$currentDir"/man1/*
  mv -vf "$currentDir"/man1/*.gz "$manDir"/man1/
  install -vDm755 "$currentDir"/bin/* "$binDir"/
  install -vDm644 "$currentDir"/completions/fish/* "$fishComp"/
  cp -v $CpOptions "$currentDir"/config/* "$confDir"/
  echo ''
  echo 'done.'
else
  sudo --preserve-env=DESTDIR,PREFIX "$0" "$@"
fi
