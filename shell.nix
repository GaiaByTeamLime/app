with import <nixpkgs> {};

let my-google-chrome = (writeShellApplication {
    name = "google-chrome";
    text = ''
        xdg-open "$1"
    '';
});
in
stdenv.mkDerivation {
    name = "gaia";
    buildInputs = [ git unzip android-tools cmake steam-run my-google-chrome imagemagick entr killall ];
}
