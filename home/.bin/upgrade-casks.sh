#!/usr/bin/env bash

red=$(tput setaf 1)
reset=$(tput sgr0)

outdated=( $(brew cask outdated | awk '$1') )

for cask in "${outdated[@]}"
do
    echo "${red}${cask}${reset} requires ${red}update${reset}."

    (set -x; brew uninstall "$cask" --force;)
    (set -x; brew install "$cask" --force;)
done
