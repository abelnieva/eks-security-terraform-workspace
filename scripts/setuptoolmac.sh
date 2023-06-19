#!/bin/sh

if [[ $(uname -m) == 'arm64' ]]; then
  echo "installing terrascan"
  brew install terrascan
  echo "installing precommit"
  brew install pre-commit
  echo "installing terraform manager"
  brew install tfenv
  else
  echo "Only MAC supported"
fi
