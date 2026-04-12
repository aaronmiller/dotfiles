{ config, pkgs, lib, inputs, ... }:

{
  home.packages = [
    ((pkgs.emacs-git.override {
      withNativeCompilation = true;
      withTreeSitter = true;
      withNS = true;
    }).overrideAttrs (oldAttrs: {
      src = inputs.emacs-src;
      patches = [ ];

      configureFlags = [
        "--with-modules"
        "--with-native-compilation"
        "--with-ns"
        "--disable-ns-self-contained"
      ];

      installPhase = ''
        runHook preInstall

        make install-arch-dep install-arch-indep prefix=$out

        NATIVE_LISP_DIR=$(find $out/lib/emacs -type d -name "native-lisp" | head -n 1)
        if [ -n "$NATIVE_LISP_DIR" ]; then
          mkdir -p $out/native-lisp
          cp -r "$NATIVE_LISP_DIR"/* $out/native-lisp/
        fi

        mkdir -p $out/Applications
        if [ -d "nextstep/Emacs.app" ]; then
          cp -r nextstep/Emacs.app $out/Applications/
          chmod +x $out/Applications/Emacs.app/Contents/MacOS/Emacs
        fi

        runHook postInstall
      '';
    }))
  ];

  home.file.".config/doom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/doom";

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/emacs/bin"
  ];

  home.sessionVariables = {
    EDITOR = "emacsclient -nw";
    VISUAL = "emacsclient -c -a emacs";
  };
}
