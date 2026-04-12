nix-update() {
  $BASE_DOTFILES_DIR/update.sh -d $DOTFILES_DIR "$@"
}

nix-sync() {
  EXTRA_MODULES="${EXTRA_MODULES:-[]}" $BASE_DOTFILES_DIR/sync.sh -d $DOTFILES_DIR "$@"
}

nix-apply() {
  local modules=()
  local passthru_args=()

  for arg in "$@"; do
    if [[ "$arg" == --include-* ]]; then
      modules+=("${arg#--include-}")
    else
      passthru_args+=("$arg")
    fi
  done

  local extra_modules_json="[]"
  if (( ${#modules[@]} > 0 )); then
    local joined
    joined=$(printf '%s\n' "${modules[@]}" | paste -sd '","' -)
    extra_modules_json="[\"$joined\"]"
  fi

  EXTRA_MODULES="$extra_modules_json" \
  HOST=$(hostname) \
  darwin-rebuild switch --flake "$DOTFILES_DIR#$(hostname)" --impure "${passthru_args[@]}"
}

nix-gc() {
  nix-collect-garbage -d
  sudo nix-collect-garbage -d
}

doom-init() {
  if [ ! -d "$HOME/.config/emacs" ]; then
    echo "Cloning Doom Emacs..."
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install
  else
    echo "Doom Emacs is already installed. Running sync..."
    ~/.config/emacs/bin/doom sync
  fi
}

install-fonts() {
  cp "${DEVTOOLS_DIR}/Hack/build/ttf/"* "${HOME}/Library/Fonts/"
  cp "${DEVTOOLS_DIR}/minimap-font/src/Minimap.ttf" "${HOME}/Library/Fonts/"
}

configure-gatech-access() {
  input="machine github.gatech.edu\n"
  echo -n "enter your gatech username: "
  read -r login
  input+="login ${login}\n"
  echo -n "enter your gatech password: "
  read -rs password
  input+="password ${password}"
  echo "${input}" >>~/.netrc
}

ssh-keygen() {
  if [[ ! -f "${HOME}/.ssh/id_ed25519" ]]; then
    echo -n "Please enter your email address for the ssh key comment: "
    read -r input

    ssh-keygen -o -a 100 -t ed25519 -C "${input}"
  fi
}

add-git-user() {
  echo -n "Please enter your Git username: "
  read -r username
  echo -n "Please enter your email address: "
  read -r email

  git config set --file ~/.gitconfig_user user.name "${username}"
  git config set --file ~/.gitconfig_user user.email "${email}"

  echo -n "Successfully added Git username and email"
}

e() {
  emacsclient -c -a "" "$@" && open -a Emacs
}

et() {
  emacsclient -t -a "" "$@"
}

clear-emacs-cache() {
  rm -rf ~/.config/emacs/.local/cache/{autosave,projectile,projectile.cache,projectile.projects,recentf,savehist,saveplace,treemacs-persist,undo-fu-session}
}
