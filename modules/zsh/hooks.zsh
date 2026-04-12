function do_ls() {
  clear && l
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd do_ls
