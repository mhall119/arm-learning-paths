#!/usr/bin/env bash
set -euo pipefail

HOST_GITCONFIG="$HOME/.gitconfig-host"
HOST_SSH_DIR="$HOME/.ssh-host"

copy_git_config() {
  local key="$1"
  local value

  value="$(git config --file "$HOST_GITCONFIG" --get "$key" || true)"
  if [ -n "$value" ]; then
    git config --global "$key" "$value"
  fi
}

if [ ! -f "$HOST_GITCONFIG" ]; then
  echo "No host Git config found at $HOST_GITCONFIG"
  exit 0
fi

copy_git_config user.name
copy_git_config user.email

gpg_format="$(git config --file "$HOST_GITCONFIG" --get gpg.format || true)"
commit_gpgsign="$(git config --file "$HOST_GITCONFIG" --get commit.gpgsign || true)"
signing_key="$(git config --file "$HOST_GITCONFIG" --get user.signingkey || true)"

if [ "$gpg_format" = "ssh" ] && [ "$commit_gpgsign" = "true" ]; then
  git config --global gpg.format ssh
  git config --global commit.gpgsign true

  if [ -n "$signing_key" ]; then
    signing_key="${signing_key/#\~\/.ssh\//$HOST_SSH_DIR/}"
    signing_key="${signing_key/#\$HOME\/.ssh\//$HOST_SSH_DIR/}"

    if [ -f "$signing_key" ]; then
      mkdir -p "$HOME/.ssh"

      container_key="$HOME/.ssh/$(basename "$signing_key")"
      cp "$signing_key" "$container_key"

      chmod 700 "$HOME/.ssh"
      chmod 644 "$container_key"

      git config --global user.signingkey "$container_key"
    else
      echo "SSH signing key configured on host but not found in container: $signing_key"
      git config --global --unset commit.gpgsign || true
    fi
  else
    echo "SSH signing is enabled on host, but user.signingkey was not found"
    git config --global --unset commit.gpgsign || true
  fi
else
  copy_git_config gpg.format
  copy_git_config commit.gpgsign
  copy_git_config user.signingkey
fi