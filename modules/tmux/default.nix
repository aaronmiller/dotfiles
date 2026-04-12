{ pkgs, lib, config, ... }:

let
  tmux-current-pane-hostname = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-current-pane-hostname";
    version = "latest";
    src = pkgs.fetchFromGitHub {
      owner = "soyuka";
      repo = "tmux-current-pane-hostname";
      rev = "master";
      sha256 = "sha256-t5jRUvwiwym6f7vfKD/D0Vu1UXpxRMCLNyBbY0nZciw=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    historyLimit = 10000;
    mouse = true;
    keyMode = "vi";
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      nord
      tmux-current-pane-hostname
    ];

    extraConfig = ''
      # login shell for tmux
      set -g default-command "${pkgs.zsh}/bin/zsh --login"
      set -g default-shell "${pkgs.zsh}/bin/zsh"

      # 24-bit true color
      set -as terminal-features ",xterm-256color:RGB"
      set -ga terminal-overrides ",xterm-256color:Tc"

      # QoL settings
      set -g set-clipboard on
      set -g renumber-windows on
      set-window-option -g pane-base-index 1
      set-window-option -g pane-border-status bottom
      set-window-option -g pane-border-format ""

      # Custom Keybindings
      bind-key l choose-tree -Zsw
      bind-key w kill-pane
      bind -r "," swap-window -d -t -1
      bind -r "." swap-window -d -t +1
      bind -r C-k clear-history
      bind -r O select-pane -t -1

      # Status Bar Customizations
      set -g @batt_remain_short 'true'
      set -g @batt_update_interval '15'
      set -g @nord_tmux_no_patched_font "0"

      set -g status-left-length 20
      set -g status-left "#[fg=black,bg=cyan,bold] #S #[fg=cyan,bg=black]"

      set -g status-right-length 150
      set -g status-right "#[fg=cyan,bg=black]#[fg=black,bg=cyan] ϟ #(pmset -g batt | awk '/InternalBattery/ {print $3}' | tr -d ';') #[fg=black,bg=cyan]#[fg=cyan,bg=black]#[fg=black,bg=cyan] %Y-%m-%d #[fg=black,bg=cyan] %H:%M:%S #[fg=black,bg=cyan]#[fg=cyan,bg=black]#[fg=black,bg=cyan,bold] #H "

      set -g window-status-separator ""
      set -g window-status-format "#[fg=black,bg=#5a7eae] #I  #W #F #[fg=#5a7eae,bg=black]"
      set -g window-status-current-format "#[fg=black,bg=cyan] #I  #W #F #[fg=cyan,bg=black]"
    '';
  };
}
