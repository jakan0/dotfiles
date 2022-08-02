#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.cache/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.cargo" {
  chezmoi_enable_feature "cargo"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "cargo"
}

@test "${HOME}/.cargo/.nobackup" {
  chezmoi_enable_feature "cargo"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "cargo"
}

@test "${HOME}/.local/bin/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/lib" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/lib/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/pipx" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/pipx/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/share/libvirt" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/share/libvirt/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/share/containers" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/share/containers/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.vagrant.d" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.vagrant.d/.nobackup" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.var" {
  chezmoi_enable_feature "flatpak"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "flatpak"
}

@test "${HOME}/.var/app" {
  chezmoi_enable_feature "flatpak"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "flatpak"
}

@test "${HOME}/.var/app/.nobackup" {
  chezmoi_enable_feature "flatpak"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "flatpak"
}

@test "${HOME}/.vscode/" {
  chezmoi_enable_feature "vscode"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "vscode"
}

@test "${HOME}/.vscode/.nobackup" {
  chezmoi_enable_feature "vscode"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "vscode"

}

@test "${HOME}/.vscode-server" {
  chezmoi_enable_feature "vscode"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "vscode"
}

@test "${HOME}/.vscode-server/.nobackup" {
  chezmoi_enable_feature "vscode"
  chezmoi_assert_feature_managed_path
  chezmoi_disable_feature "vscode"

}
