#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.config/git" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/git/config" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/git/line-length" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/git/include/c24daa9d2569caa7aae9de01310c907cb9826257.conf" {
  chezmoi_assert_feature_managed_path
}
