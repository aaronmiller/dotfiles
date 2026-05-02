#!/usr/bin/env bash

set -uo pipefail

# If system-wide shell initialisation files haven't been altered since installing Nix, use the backups made by the installer
# Otherwise, edit /etc/zshrc, /etc/bashrc, and /etc/bash.bashrc to remove the lines sourcing nix-daemon.sh, which should look like this:
## Nix
#if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#fi
## End Nix

if [ -f "/etc/zshrc.backup-before-nix" ]; then
 /usr/bin/sudo /bin/mv /etc/zshrc.backup-before-nix /etc/zshrc
else
  EDITOR=/usr/bin/vi /etc/zshrc
fi

if [ -f "/etc/zshrc.before-nix-darwin" ]; then
  /usr/bin/sudo /bin/mv /etc/zshrc.before-nix-darwin /etc/zshrc
else
  EDITOR=/usr/bin/vi /etc/zshrc
fi

if [ -f "/etc/bashrc.backup-before-nix" ]; then
  /usr/bin/sudo /bin/mv /etc/bashrc.backup-before-nix /etc/bashrc
else
  EDITOR=/usr/bin/vi /etc/bashrc
fi

if [ -f "/etc/bashrc.before-nix-darwin" ]; then
  /usr/bin/sudo /bin/mv /etc/bashrc.before-nix-darwin /etc/bashrc
else
  EDITOR=/usr/bin/vi /etc/bashrc
fi

if [ -f "/etc/bash.bashrc.backup-before-nix" ]; then
  /usr/bin/sudo /bin/mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc
else
  EDITOR=/usr/bin/vi /etc/bash.bashrc
fi

if [ -f "/etc/bash.bashrc.before-nix-darwin" ]; then
  /usr/bin/sudo /bin/mv /etc/bash.bashrc.before-nix-darwin /etc/bash.bashrc
else
  EDITOR=/usr/bin/vi /etc/bash.bashrc
fi

# Stop and remove the Nix daemon services
/usr/bin/sudo /bin/launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist 2>/dev/null

if [ -f "/Library/LaunchDaemons/org.nixos.nix-daemon.plist" ]; then
  /usr/bin/sudo /bin/rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
fi

/usr/bin/sudo /bin/launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist 2>/dev/null

if [ -f "/Library/LaunchDaemons/org.nixos.darwin-store.plist" ]; then
  /usr/bin/sudo /bin/rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
fi

# Remove the nixbld group and the _nixbuildN users
if /usr/bin/sudo /usr/bin/dscl . -list /Groups | /usr/bin/grep nixbld; then
  /usr/bin/sudo /usr/bin/dscl . -delete /Groups/nixbld
  for u in $(/usr/bin/sudo /usr/bin/dscl . -list /Users | /usr/bin/grep _nixbld); do /usr/bin/sudo /usr/bin/dscl . -delete /Users/$u; done
fi

# Edit fstab using /usr/bin/sudo vifs to remove the line mounting the Nix Store volume on /nix, which looks like
# UUID=<uuid> /nix apfs rw,noauto,nobrowse,suid,owners
# or
# LABEL=Nix\040Store /nix apfs rw,nobrowse
EDITOR=/usr/bin/vi /usr/bin/sudo /usr/sbin/vifs

# Edit /etc/synthetic.conf to remove the nix line. If this is the only line in the file you can remove it entirely
if [ -f /etc/synthetic.conf ]; then
  if [ "$(/bin/cat /etc/synthetic.conf)" = "nix" ]; then
    /usr/bin/sudo /bin/rm /etc/synthetic.conf
  else
    /usr/bin/sudo /usr/bin/vi /etc/synthetic.conf
  fi
fi

# Remove the files Nix added to your system, except for the store
/usr/bin/sudo /bin/rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels ~/.local/share/nix ~/.local/state/nix ~/.cache/nix

# Remove the Nix Store volume
/usr/bin/sudo /usr/sbin/diskutil apfs deleteVolume /nix 2>/dev/null

/usr/sbin/diskutil list
