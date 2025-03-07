{ ... }:

{
  programs.git = {
    enable = true;

    userName = "Dima";
    userEmail = "uzhdimka@gmail.com";

    aliases = {
      "c" = "commit";
      "p" = "push";
      "pl" = "pull";
    };
  };
}
