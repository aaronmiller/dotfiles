{ pkgs, lib, config, ... }:

let
  theme = builtins.fromTOML (builtins.readFile ./moonlight-wilmersdorf-theme.toml);
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = theme.colors;

      terminal.shell = {
        program = "/run/current-system/sw/bin/zsh";
        args = [ "--login" ];
      };

      window = {
        dynamic_padding = true;
        startup_mode = "Fullscreen";
        padding = {
          x = 4;
          y = 4;
        };
      };

      scrolling.history = 100000;

      font = {
        size = 12;
        normal = { family = "Hack"; style = "Regular"; };
        italic = { family = "Hack"; style = "Italic"; };
        bold = { family = "Hack"; style = "Bold"; };
        bold_italic = { family = "Hack"; style = "Bold Italic"; };
      };

      cursor = {
        thickness = 0.25;
        unfocused_hollow = false;
        style = {
          blinking = "Always";
          shape = "Beam";
        };
      };

      keyboard.bindings = [
        { key = "Return"; mods = "Command"; action = "ToggleFullscreen"; }
        { key = "Key0"; mods = "Command"; action = "ResetFontSize"; }
        # delete line
        { key = "Back"; mods = "Command"; chars = "\\u0015"; }
        # delete word
        { key = "Back"; mods = "Option"; chars = "\\u001b\\u007f"; }
        # go to beginning of line
        { key = "Left"; mods = "Command"; chars = "\\u0001"; }
        # go to end of line
        { key = "Right"; mods = "Command"; chars = "\\u0005"; }
        # go back one word
        { key = "Left"; mods = "Option"; chars = "\\u001bb"; }
        # go forward one word
        { key = "Right"; mods = "Option"; chars = "\\u001bf"; }
        # tmux keybindings
        { key = "T"; mods = "Command"; chars = "\\u0002c"; }
        { key = "T"; mods = "Command|Shift"; chars = "\\u0002!"; }
        { key = "W"; mods = "Command"; chars = "\\u0002w"; }
        { key = "D"; mods = "Command"; chars = "\\u0002%"; }
        { key = "D"; mods = "Command|Shift"; chars = "\\u0002\""; }
        { key = "Left"; mods = "Command|Option"; chars = "\\u0002p"; }
        { key = "Right"; mods = "Command|Option"; chars = "\\u0002n"; }
        { key = "L"; mods = "Command"; chars = "\\u0002s"; }
        { key = "Comma"; mods = "Command"; chars = "\\u0002,"; }
        { key = "Period"; mods = "Command"; chars = "\\u0002."; }
        { key = "LBracket"; mods = "Command|Option"; chars = "\\u0002O"; }
        { key = "RBracket"; mods = "Command|Option"; chars = "\\u0002o"; }
        # cycle through windows 1-9
        { key = "Key1"; mods = "Command"; chars = "\\u00021"; }
        { key = "Key2"; mods = "Command"; chars = "\\u00022"; }
        { key = "Key3"; mods = "Command"; chars = "\\u00023"; }
        { key = "Key4"; mods = "Command"; chars = "\\u00024"; }
        { key = "Key5"; mods = "Command"; chars = "\\u00025"; }
        { key = "Key6"; mods = "Command"; chars = "\\u00026"; }
        { key = "Key7"; mods = "Command"; chars = "\\u00027"; }
        { key = "Key8"; mods = "Command"; chars = "\\u00028"; }
        { key = "Key9"; mods = "Command"; chars = "\\u00029"; }
      ];
    };
  };
}
