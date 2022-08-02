#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.bash_aliases" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.bash_history" {
  chezmoi_assert_feature_unmanaged_path
}

@test "${HOME}/.bash_logout" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.bash_profile" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.bashrc" {
  chezmoi_assert_feature_managed_path
}
