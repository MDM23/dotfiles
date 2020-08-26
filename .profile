export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.yarn/bin:$PATH"
export CDPATH=".:$HOME:$HOME/src"
export GOPATH="$HOME"
export EDITOR="nvim"
export BROWSER="firefox"
export ELECTRON_TRASH="gio"

alias a="artisan"
alias artisan="php artisan"
alias ci="composer install"
alias ga="git add"
alias gaa="ga --all"
alias gc="git commit"
alias gco="git checkout"
alias gdd="git dd"
alias glol="git lol"
alias glola="glol --all"
alias gp="git push"
alias gss="git status"
alias j="journalctl"
alias jj="journalctl -f"
alias off="systemctl poweroff"
alias ssh="TERM=xterm ssh"
alias tinker="a tinker"
alias vi="nvim"
alias vim="nvim"
alias xclip="xclip -selection 'clipboard'"

function config() {
	(cd $HOME && git --git-dir=$HOME/.myconfig/ --work-tree=$HOME "$@")
}

# Find out the physical machine
FP=$(cat /sys/devices/virtual/dmi/id/modalias | md5sum | awk -vORS="" '{print $1}')
case "$FP" in
	"22d2bdab29ff870e3ff8faa4bcd05112")
		export LOCATION="home" ;;
	"ecf0ab41ddb84c918575379635443491")
		export LOCATION="mobile" ;;
	"fa10162309fca9414c9c0ac3dd5f590d")
		export LOCATION="office" ;;
	*)
		export LOCATION="unknown" ;;
esac

# Load profiles from .profile.d/
if test -d $HOME/.profile.d/; then
	for profile in $HOME/.profile.d/*; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Start X11 server after login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  ssh-agent startx
fi
