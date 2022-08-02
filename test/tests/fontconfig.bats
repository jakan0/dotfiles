#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.config/fontconfig" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/fontconfig/fonts.conf" {
  chezmoi_assert_feature_managed_path
}
