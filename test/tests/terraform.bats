#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.cache/terraform" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.cache/terraform/plugins/CACHEDIR.TAG" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.terraformrc" {
  chezmoi_assert_feature_managed_path
}
