{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.05") {} }:
pkgs.mkShell {
  name = "env";
  buildInputs = [
    (import ./default.nix { inherit pkgs; })
  ];
  shellHook = ''
    gatsby-setup
  '';
}