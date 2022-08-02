#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.config/starship.toml" {
  chezmoi_assert_feature_managed_path
}
