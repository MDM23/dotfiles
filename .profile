export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.yarn/bin:$PATH"
export CDPATH=".:$HOME:$HOME/src"
export GOPATH="$HOME"
export EDITOR="nvim"
export TERM="xterm-256color"
export ELECTRON_TRASH="gio"

alias a="artisan"
alias artisan="php artisan"
alias ci="composer install"
alias config="git --git-dir=$HOME/.myconfig/ --work-tree=$HOME"
alias ga="git add"
alias gaa="ga --all"
alias gc="git commit"
alias gco="git checkout"
alias gdd="git dd"
alias glol="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="glol --all"
alias gp="git push"
alias gss="git status"
alias tinker="a tinker"
alias vi="nvim"
alias vim="nvim"
alias xclip="xclip -selection 'clipboard'"

# Load profiles from .profile.d/
if test -d $HOME/.profile.d/; then
	for profile in $HOME/.profile.d/*; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Start X11 server after login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
