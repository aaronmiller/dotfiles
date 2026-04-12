{ pkgs, lib, config, ... }:

{
  home.packages = [ pkgs.emacsPkg ];

  home.activation.aliasEmacsApp = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target_app="${config.home.homeDirectory}/Applications/Emacs.app"
    source_app="${config.home.path}/Applications/Emacs.app"

    if [ -d "$source_app" ]; then
      $DRY_RUN_CMD rm -rf "$target_app"
      $DRY_RUN_CMD mkdir -p "$target_app/Contents/MacOS"
      
      $DRY_RUN_CMD cp "$source_app/Contents/Info.plist" "$target_app/Contents/Info.plist"
      $DRY_RUN_CMD cp "$source_app/Contents/PkgInfo" "$target_app/Contents/PkgInfo" 2>/dev/null || true
      $DRY_RUN_CMD ln -sfn "$source_app/Contents/Resources" "$target_app/Contents/Resources"

      $DRY_RUN_CMD cat <<EOF > "$target_app/Contents/MacOS/Emacs"
#!/bin/sh
exec "$source_app/Contents/MacOS/Emacs" "\$@"
EOF
      $DRY_RUN_CMD chmod +x "$target_app/Contents/MacOS/Emacs"
    fi
  '';

  home.sessionPath = [ "${config.home.homeDirectory}/.config/emacs/bin" ];

  home.sessionVariables = {
    COLORTERM = "truecolor";
  };
}
