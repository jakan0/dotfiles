#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.zshenv" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh" {
  chezmoi_enable_feature "zsh"
  touch .config/zsh/.zcompdump
  touch .config/zsh/.zhistory
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zaliases" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zaliases.d" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zaliases.d/chezmoi" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zaliases.d/sudo" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zaliases.d/terraform" {
  chezmoi_enable_feature "terraform"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "terraform"
}

@test "${HOME}/.config/zsh/.zcompdump" {
  chezmoi_assert_feature_unmanaged_path
}

@test "${HOME}/.config/zsh/.zhistory" {
  chezmoi_assert_feature_unmanaged_path
}

@test "${HOME}/.config/zsh/.zprofile" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/zsh/.zshrc" {
  chezmoi_assert_feature_managed_path
}
