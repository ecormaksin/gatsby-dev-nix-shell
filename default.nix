{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.05") {} }:

with pkgs;

let

  gatsbySetup = pkgs.writeShellScriptBin "gatsby-setup" "./gatsby-setup.sh";

in buildEnv {
  name = "env";
  paths = [
    curl
    git
    nodenv
    gatsbySetup
  ];
}