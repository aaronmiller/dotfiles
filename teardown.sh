#!/bin/bash

sudo /bin/rm -rf /etc/{nix,synthetic.conf,ssl/certs,profile.d/nix.sh} /etc/*.{backup-before-nix,before-nix-darwin} /Library/LaunchDaemons/org.nixos.nix-daemon.plist /private/var/db/receipts/org.nixos.nix*

shell_files=(/etc/bashrc /etc/zshrc /etc/bash.bashrc /etc/zsh/zshrc /etc/profile.d/nix.sh)

for file in "${shell_files[@]}"; do
    if [ -f "$file" ]; then
        sudo perl -i -0777 -pe 's/# Nix.*?# End Nix\n*//gs' "$file" 2>/dev/null
        if [[ -z $(sudo grep -S '[^[:space:]]' "$file") ]]; then
            sudo cp /dev/null "$file"
        fi
    fi
done

sudo /bin/rm -rf /etc/fish/conf.d/nix.fish /usr/local/etc/fish/conf.d/nix.fish /opt/homebrew/etc/fish/conf.d/nix.fish /opt/local/etc/fish/conf.d/nix.fish

/usr/bin/dscl . -list /Users | /usr/bin/grep _nixbld | /usr/bin/xargs -I {} sudo /usr/bin/dscl . -delete /Users/{} 2>/dev/null
sudo /usr/bin/dscl . -delete /Groups/nixbld 2>/dev/null

sudo /usr/sbin/diskutil apfs deleteVolume Nix 2>/dev/null
sudo /bin/rm -rf {/var/root,$HOME}/.{nix-profile,nix-defexpr,nix-channels} $HOME/.{local/state/nix,cache/nix}
