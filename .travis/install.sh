#!/bin/bash

set -e
set -x

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    if [ ! -e "$HOME/.xss/.git" ]; then
      if [ -e "$HOME/.xss" ]; then
        rm -rf ~/.xss/
      fi
      git clone https://github.com/sgframework/xss.git ~/.xss
    else
      (cd ~/.xss/; git pull)
    fi
    Xss_ROOT="$HOME/.xss"
    PATH="$Xss_ROOT/bin:$PATH"
    hash -r
    eval "$(Xss init -)"
    hash -r
    Xss install --list
    Xss install -s $Xss_VERSION
    pip install wheel
fi

if [[ $BUILD_WHEEL == 'true' ]]; then
    pip install wheel cibuildwheel==0.9.4
fi