{ pkgs ? import <nixpkgs> { } }:
with pkgs;

let my-google-chrome = (writeShellApplication {
    name = "google-chrome";
    text = ''
        xdg-open "$1"
    '';
});
in
mkShell {
    name = "gaia-app";
    buildInputs = [ git unzip android-tools cmake steam-run my-google-chrome imagemagick entr killall ];
    shellHook = ''
        ./shell.sh
        exit
    '';
}
