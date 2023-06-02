DOTFILES="$HOME/.dotfiles"

# Get the parent directory of install.sh
curr_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo $DOTFILES
echo $curr_dir
[[ $curr_dir =~ "$DOTFILES" ]] && echo hi