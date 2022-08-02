#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.tmux.conf" {
  chezmoi_assert_feature_managed_path
}
