# A shellfile for nixos users

with import <nixpkgs> {};

let
  texliveDeps = pkgs.texlive.combine {
   inherit (pkgs.texlive)
     adjustbox
     beamer
     booktabs
     caption
     chngcntr
     collectbox
     ec
     etoolbox
     fancyvrb
     fira
     float
     fontinst
     fontspec
     footmisc
     framed
     hyperref
     listings
     mdwtools # <-- footnote.sty
     metafont
     parskip
     pgf
     placeins
     plstmary
     psnfss
     roboto
     scheme-basic
     sectsty
     setspace
     stix
     stmaryrd
     titlesec
     translator
     unicode-math
     wrapfig
     xcolor
     xetex
     xkeyval;
  };
  deps = with pkgs; [
    fontconfig
    fira
    haskellPackages.pandoc
    tetex
    texliveDeps
    nodejs
    yarn
  ];
in pkgs.symlinkJoin {
  name = "csound-floss-build-deps";
  buildInputs = deps;
  paths = deps;
}
