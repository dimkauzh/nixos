{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 4000;
      path = "$HOME/.zsh_history";
      share = true;
      append = true;
    };

    shellAliases = {
      clean-old-generations = "sudo /run/current-system/bin/switch-to-configuration boot
";
    };

    localVariables = {
      PATH="$PATH:~/.local/bin:~/.local/go/bin";
      GOPATH="~/.local/go";
      GOMODCACHE="~/.local/go/pkg/mod";
      TERM="xterm-256color";
    };

    initExtra = ''
      # Oh-My-Posh
      eval "$(starship init zsh)"

      # Direnv
      eval "$(direnv hook zsh)"

      # Functions
      nvim-config() {
        local current_dir=$(pwd)
        cd ~/.config/nvim
        nvim
        cd "$current_dir"
      }

      project() {
        if [ -z "$1" ]; then
          cd ~/projects/ || return
        elif [[ "$1" == http* || "$1" == git@* ]]; then
          repo_url="$1"
          repo_name=$(basename "$repo_url" .git)
          dest_dir=~/projects/"$repo_name"

          if [ -d "$dest_dir" ]; then
            echo "Directory '$dest_dir' already exists. Pulling latest changes."
            cd "$dest_dir" || return
            git pull || return
          else
            echo "Cloning repository into '$dest_dir'."
            git clone "$repo_url" "$dest_dir" || return
            cd "$dest_dir" || return
          fi
        else
          cd ~/projects/$1 || return
        fi
      }

      system() {
        local DEFAULT_NIXOS_PATH="$HOME/projects/nixos"

        local NIXOS_CONFIG_PATH="$DEFAULT_NIXOS_PATH"
        if [[ -n "$NIXOS_PATH" ]]; then
          NIXOS_CONFIG_PATH="$NIXOS_PATH"
        fi

        case "$1" in
          update)
            echo "Updating system flake in $NIXOS_CONFIG_PATH..."
            (
              cd "$NIXOS_CONFIG_PATH" || { echo "Error: Directory $NIXOS_CONFIG_PATH does not exist."; return 1; }
              nix flake update
            )
            ;;

          rebuild)
            echo "Rebuilding the system configuration in $NIXOS_CONFIG_PATH..."
            cd "$NIXOS_CONFIG_PATH" || { echo "Error: Directory $NIXOS_CONFIG_PATH does not exist."; return 1; }
            sudo nixos-rebuild switch --flake .#zephyr
            ;;

          upgrade)
            echo "Upgrading the system..."
            system update && system rebuild
            ;;

          *)
            echo "Usage: system {update|rebuild|upgrade}"
            return 1
            ;;
        esac
      }

      # Enable completion for project function
      if autoload -Uz compinit && compinit; then
        compdef '_files -W ~/projects/' project
      fi
    '';
  };
}
