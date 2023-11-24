{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.05") {} }:
pkgs.mkShell {
  packages = with pkgs; [
    curl
    glibcLocales
    git
    nodejs_20
    nodePackages_latest.gatsby-cli
  ];

  LOCALE_ARCHIVE="${pkgs.glibcLocales}/lib/locale/locale-archive";

  LANG     = "ja_JP.UTF-8";
  LC_ALL   = "ja_JP.UTF-8";
}