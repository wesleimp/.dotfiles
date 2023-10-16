# Misc
abbr bashrc 'nvim ~/.bashrc'
abbr zshconfig 'nvim ~/.zshrc'
abbr ohmyzsh 'nvim ~/.oh-my-zsh'
abbr vimrc "nvim ~/.vimrc"
abbr dotfiles "nvim $DOTFILES"
abbr nvimconfg "nvim ~/nvim"

abbr :q 'exit'
abbr tree "exa -T"
abbr todos "rg --column --line-number --ignore-case --color always -e '(TODO|FIXME)'"

abbr oss "~/OSS"
abbr workspace "~/workspace"

# git
abbr g "git";
abbr glg "git log --graph --decorate --oneline --abbrev-commit";
abbr ggpush "git push origin HEAD";
abbr gd "git diff";
abbr gc "git commit -s";
abbr gca "git commit -sa";
abbr gco "git checkout";
abbr gb "git branch -v";
abbr ga "git add";
abbr gaa "git add -A";
abbr gcm "git commit -sm";
abbr gcam "git commit -sam";
abbr gst "git status -sb";
abbr glnext "git log --oneline (git describe --tags --abbrev0 @^)..@";

# Kubernetes
abbr k "kubectl"
abbr kn "kubens"
abbr kx "kubectx"

# Elixir
abbr m "mix"
abbr mt "mix test"
abbr mc "mix compile"
abbr mf "mix format"
abbr md "mix deps.get"
abbr mdc "mix deps.compile"
abbr mps "mix phx.server"
abbr mpn "mix phx.new"
abbr mec "mix ecto.create"
abbr mec "mix ecto.migrate"
abbr megm "mix ecto.gen.migration"
abbr i "iex"
abbr ism "iex -S mix"
abbr ips "iex -S mix phx.server"

# Docker
abbr d "docker"
abbr dc "docker compose"

abbr h "history | fzf"
abbr tw "tmux-windowizer"
