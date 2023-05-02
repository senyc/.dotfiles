#!/usr/bin/env bash
configuration_location="$HOME/.config"

does_not_exist() {
  local val=$1

  if [ -L $val ] || [ -f $val ] || [ -d $val ]; then
    return 1
  else
    return 0
  fi
}

link_configuration_file_to_home() {
  local target="$1"
  local name="$2"
  local dest="$HOME/$name"

  does_not_exist $dest
  if [ $? = 0 ]; then
    ln -s  $target $dest
    echo "Link created to $target from $dest"
  fi

}

link_directory_to_config() {
  local target="$1"
  local name="$2"
  local dest="$configuration_location/$name"
  does_not_exist $dest
  if [ $? = 0 ]; then
    ln -s  $target $dest
    echo "Link created to $target from $dest"
  fi

}

# Checks that base dot directories aren't being symbolically linked
valid_basename() {
  local val=$1
  if [ "$val" = "." ] || [ "$val" = ".." ] || [ "$val" = "*" ]; then 
    return 1
  else
    return 0
  fi
}


main() {
  local home_path="$PWD/home"
  local config_path="$PWD/.config"
  # Iterate over all the files in home
  for file in $home_path/.* $home_path/*; do
    valid_basename $(basename $file)
    # General error checking of base name and wild card file
    if [ $? = 0 ] && [ ! "$file" = "$home_path/*" ]; then
      echo $file
      link_configuration_file_to_home $file "$(basename $file)"
    fi
  done

  # Iterate over all the directories in .config
  for directory in $config_path/.* $config_path/*; do
    valid_basename $(basename $directory)
    # General error checking of base name and wild card directory
    if [ $? = 0 ] && [ ! "$directory" = "$config_path/*" ]; then
      echo $directory
      link_directory_to_config $directory "$(basename $directory)"
    fi
  done
}
main
