#!/usr/bin/env bats

common_setup() {
  load "test_helper/bats-support/load"
  load "test_helper/bats-assert/load"
  load "test_helper/bats-file/load"
  load "helpers/chezmoi.bash"
}
