{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Dima";
      user.email = "uzhdimka@gmail.com";

      aliases = {
        "a" = "add";
        "c" = "commit";
        "p" = "push";
        "pl" = "pull";
        "s" = "status";
      };
    };
  };
}
