#!/usr/bin/env bash
set -euo pipefail

HOST_GITCONFIG="$HOME/.gitconfig-host"

if [ -f "$HOST_GITCONFIG" ]; then
  name="$(git config --file "$HOST_GITCONFIG" --get user.name || true)"
  email="$(git config --file "$HOST_GITCONFIG" --get user.email || true)"

  [ -n "$name" ] && git config --global user.name "$name"
  [ -n "$email" ] && git config --global user.email "$email"
fi

git config --global gpg.format ssh
git config --global user.signingkey "$HOME/.ssh/id_ed25519.pub"
git config --global commit.gpgsign true