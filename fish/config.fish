export EDITOR="nvim"
export SHELL="fish"

#set fish_greeting "Its fishy here ...."
set fish_greeting ""

alias ga "git add ."
alias gc "git commit -m"
alias gp "git push"


abbr swaycfg "r ~/.config/sway"
abbr i3cfg "vim ~/.config/i3/config"
abbr fishcfg "nvim ~/.config/fish/config.fish"
abbr alacrittycfg "vim ~/.config/alacritty/alacritty.yml"
abbr vimcfg "vim ~/.config/nvim/init.lua"
alias lvim "~/.local/bin/lvim"
abbr o "gio open"
abbr sound "pavucontrol"
abbr wifi "nm-connection-editor"
alias x "exit"
abbr battery "acpi"
abbr :q "exit"


fish_vi_key_bindings
export PATH="$HOME/.local/bin:/home/jan/.nimble/bin:/home/jan/.cargo/bin:$HOME/.config/scripts:$PATH"
# fix for ranger 
export DBX_CONTAINER_MANAGER="podman"

# Bun
set -Ux BUN_INSTALL "/home/jan/.bun"
set -px --path PATH "/home/jan/.bun/bin"

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

set nix "1"

if test "$nix" = "1"
  export EDITOR="nvim"

  abbr nxe "sudo nvim /etc/nixos/configuration.nix"
  abbr nxs "sudo nixos-rebuild switch"


  alias rm "trash"

  alias ga "git add ."
  alias gc "git commit -m"
  alias gp "git push"


  abbr swaycfg "vim ~/.config/sway/config"
  abbr i3cfg "vim ~/.config/i3/config"
  abbr fishcfg "nvim ~/.config/fish/config.fish"
  abbr alacrittycfg "vim ~/.config/alacritty/alacritty.yml"
  abbr vimcfg "vim ~/.config/nvim/init.lua"
  function fish_mode_prompt
  end

  function fish_right_prompt
  end

  function fish_prompt
      set -l last_status $status
      set -l cwd (prompt_pwd)

      if not test $last_status -eq 0
          set_color --bold white -b red
          echo -n ' ! '
          set_color normal
      end

      # Display current path
      set_color black -b blue
      echo -n " $cwd "

      # Show git branch and dirty state
      set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
      set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
      if test -n "$git_branch"
          if test -n "$git_dirty"
              set_color black -b yellow
              echo -n " $git_branch "
          else
              set_color black -b green
              echo -n " $git_branch "
          end
      end

      # Add a space
      set_color normal
      echo -n ' '
  end
end



