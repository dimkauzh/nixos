{ ... }:

{
  home = {
    username = "dima";
    homeDirectory = "/home/dima";
  };

  home.file.".face" = {
    source = .../assets/icons/face.png;
  };
}
