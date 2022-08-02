#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.hushlogin" {
  local -r path="${BATS_TEST_DESCRIPTION}"
  assert_exists "${path}"
}

@test "${HOME}/.local/bin/vendor/git/git-prompt.sh" {
  local -r path="${BATS_TEST_DESCRIPTION}"
  assert_exists "${path}"
}

@test "${HOME}/.local/bin/vendor/chezmoi/install.sh" {
  local -r path="${BATS_TEST_DESCRIPTION}"
  assert_exists "${path}"
}

@test "${HOME}/.local/bin/vendor/starship/install.sh" {
  local -r path="${BATS_TEST_DESCRIPTION}"
  assert_exists "${path}"
}
