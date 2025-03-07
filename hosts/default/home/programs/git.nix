{ ... }:

{
  programs.git = {
    enable = true;

    userName = "Dima";
    userEmail = "uzhdimka@gmail.com";

    aliases = {
      "a" = "add";
      "c" = "commit";
      "p" = "push";
      "pl" = "pull";
    };
  };
}
