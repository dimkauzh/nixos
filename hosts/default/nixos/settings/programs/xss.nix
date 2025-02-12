{ ... }:

{
  programs.xss-lock = {
    enable = true;
    lockerCommand = "${mantablockscreen}/bin/mantablockscreen -sc";
  };
}
