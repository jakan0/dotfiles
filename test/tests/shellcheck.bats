#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.shellcheckrc" {
  chezmoi_assert_feature_managed_path
}
