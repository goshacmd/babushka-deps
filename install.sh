#!/usr/bin/env bash
export LC_ALL="en_US.UTF-8"

if [[ $(uname) == "Darwin" ]]; then
  if [[ -e $(which xcode-select) ]]; then
    [[ -e $(which brew) ]] || /usr/bin/ruby -e "$(curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
    brew update
    [[ -e $(which automake) ]] || brew install automake # babushka thinks xcode includes automake, but it doesn't since 4.3
    [[ -e $(which git) ]] || brew install git
  else
    echo "no xcode tools, quitting"
    open "https://developer.apple.com/downloads"
    exit 1
  fi
else
  echo "unsupported system, quitting"
  exit 1
fi

if [[ -e ~/.babushka ]]; then
  echo "~/.babushka exists, quitting"
  exit 1
else
  mkdir ~/.babushka
  git clone git://github.com/goshakkk/babushka-deps.git ~/.babushka/deps
  sudo bash -c "$(curl babushka.me/up)" </dev/null
  (cd ~/.babushka/deps && git remote set-url --push origin git@github.com:goshakkk/babushka-deps.git)
  babushka bootstrap
fi
