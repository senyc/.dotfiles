#!bin/bash/env
configuration_location="$HOME/.config"

link_configuration_file_to_home() {
  local target="$1"
  local name="$2"
  local dest="$HOME/$name"
  ln -s  $target $dest
  echo "Link created to $target from $dest"
}

link_directory_to_config() {
  local target="$1"
  local name="$2"
  local dest="$configuration_location/$name"
  ln -s $target $dest 
  echo "Link created to $target from $dest"
}

main() {
  # Iterate over all the files in home
  for file in "${PWD}/home"/*; do
    link_configuration_file_to_home $file "$(basename $file)"
  done

  # Iterate over all the directories in .config
  for directory in "${PWD}/.config"/*/; do
    link_directory_to_config $directory $(basename $directory)
  done
}

main
# link_configuration_file_to_home .bashrc
# link_configuration_file_to_home .bash_aliases
# link_configuration_file_to_home .bash_logout
# # Includes both because tmux only seems to run .bash_profile 
# link_configuration_file_to_home .bash_profile
# link_configuration_file_to_home .profile
#
# link_directory_to_config nvim/
# link_directory_to_config tmux/
# link_directory_to_config powerline/
