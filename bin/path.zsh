local bin_path="$(dirname "$(readlink --canonicalize-existing "$0")")"
path=($bin_path $path)

verbose + Prepending $fg[yellow]$bin_path$reset_color to $fg[yellow]\$PATH$reset_color -- by $fg[cyan]$(basename "$0")$reset_color
