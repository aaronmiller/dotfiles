#!/usr/bin/env bash

set -euo pipefail

# If system-wide shell initialisation files haven't been altered since installing Nix, use the backups made by the installer
if [ -f "/etc/zshrc.backup-before-nix" ]; then
  sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
fi

if [ -f "/etc/zshrc.before-nix-darwin" ]; then
  sudo mv /etc/zshrc.before-nix-darwin /etc/zshrc
fi

if [ -f "/etc/bashrc.backup-before-nix" ]; then
  sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
fi

if [ -f "/etc/bashrc.before-nix-darwin" ]; then
  sudo mv /etc/bashrc.before-nix-darwin /etc/bashrc
fi

if [ -f "/etc/bash.bashrc.backup-before-nix" ]; then
  sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
fi

if [ -f "/etc/bash.bashrc.before-nix-darwin" ]; then
  sudo mv /etc/bash.bashrc.before-nix-darwin /etc/bash.bashrc
fi

# Otherwise, edit /etc/zshrc, /etc/bashrc, and /etc/bash.bashrc to remove the lines sourcing nix-daemon.sh, which should look like this:
## Nix
#if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#fi
## End Nix

# Stop and remove the Nix daemon services
sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist

if [ -f "/Library/LaunchDaemons/org.nixos.nix-daemon.plist" ]; then
  sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
fi

sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist

if [ -f "/Library/LaunchDaemons/org.nixos.darwin-store.plist" ]; then
  sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
fi

# Remove the nixbld group and the _nixbuildN users
if [ sudo /usr/bin/dscl . -list /Groups | grep nixbld ]; then
  sudo dscl . -delete /Groups/nixbld
  for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done
fi

# Edit fstab using sudo vifs to remove the line mounting the Nix Store volume on /nix, which looks like
# UUID=<uuid> /nix apfs rw,noauto,nobrowse,suid,owners
# or
# LABEL=Nix\040Store /nix apfs rw,nobrowse
EDITOR=vim sudo vifs

# Edit /etc/synthetic.conf to remove the nix line. If this is the only line in the file you can remove it entirely
if [ -f /etc/synthetic.conf ]; then
  if [ "$(cat /etc/synthetic.conf)" = "nix" ]; then
    sudo rm /etc/synthetic.conf
  else
    sudo vi /etc/synthetic.conf
  fi
fi

# Remove the files Nix added to your system, except for the store
sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels ~/.local/share/nix ~/.local/state/nix ~/.cache/nix

# Remove the Nix Store volume
sudo /usr/sbin/diskutil apfs deleteVolume /nix

#diskutil list
