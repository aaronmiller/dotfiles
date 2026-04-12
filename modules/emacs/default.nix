{ pkgs, lib, config, inputs, enabledModules, user, ... }:

let
  emacsEnabled = builtins.elem "emacs" enabledModules;
in
{
  nixpkgs.overlays = lib.mkIf emacsEnabled [
    inputs.emacs-overlay.overlay
    (final: prev: {
      emacsPkg = (prev.emacs-git.override {
        withNativeCompilation = false;
      }).overrideAttrs (old: {
        src = inputs.emacs-src;
        version = "30.2";
        patches = [];
      });
    })
  ];

  services.emacs = lib.mkIf emacsEnabled {
    enable = true;
    package = pkgs.emacsPkg;
  };

  home-manager.users.${user} = { config, ... }: {
    home.sessionVariables = {
      COLORTERM = "truecolor";
      EDITOR = "emacsclient -c -a 'vim'";
      VISUAL = "emacsclient -c -a 'vim'";
    };

    home.packages = lib.mkIf emacsEnabled [ pkgs.emacsPkg ];

    home.activation.aliasEmacsApp = lib.mkIf emacsEnabled (config.lib.dag.entryAfter [ "writeBoundary" ] ''
      target_app="/Users/${user}/Applications/Emacs.app"
      target_bin_dir="/Users/${user}/.local/bin"
      source_app="${config.home.path}/Applications/Emacs.app"
      source_bin_dir="${config.home.path}/bin"

      if [ -d "$source_app" ]; then
        $DRY_RUN_CMD rm -rf "$target_app"
        $DRY_RUN_CMD mkdir -p "$target_app/Contents/MacOS"
        $DRY_RUN_CMD cp "$source_app/Contents/Info.plist" "$target_app/Contents/Info.plist"
        $DRY_RUN_CMD ln -sfn "$source_app/Contents/Resources" "$target_app/Contents/Resources"
        $DRY_RUN_CMD cat <<EOF > "$target_app/Contents/MacOS/Emacs"
#!/bin/sh
exec "$source_app/Contents/MacOS/Emacs" "\$@"
EOF
        $DRY_RUN_CMD chmod +x "$target_app/Contents/MacOS/Emacs"

        $DRY_RUN_CMD mkdir -p "$target_bin_dir"
        for bin_path in "$source_bin_dir"/emacs*; do
          bin_name=$(basename "$bin_path")
          $DRY_RUN_CMD ln -sfn "$bin_path" "$target_bin_dir/$bin_name"
        done

        for tool in etags ebrowse ctags; do
          if [ -f "$source_bin_dir/$tool" ]; then
            $DRY_RUN_CMD ln -sfn "$source_bin_dir/$tool" "$target_bin_dir/$tool"
          fi
        done
      fi
    '');
  };
}
