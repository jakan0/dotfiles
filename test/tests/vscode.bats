#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.config/Code" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/Code/User/keybindings.json" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/Code/User/settings.json" {
  chezmoi_assert_feature_managed_path
}
