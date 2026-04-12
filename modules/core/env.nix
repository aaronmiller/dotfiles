{ pkgs, lib, config, user, ... }:

{
  security.pki.installCACerts = true;

  environment.variables = {
    SSL_CERT_FILE = "/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt";
    NIX_SSL_CERT_FILE = "/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt";
  };
}
