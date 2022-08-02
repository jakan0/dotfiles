#!/usr/bin/env bats

setup() {
  load "helpers/setup.bash"
  common_setup
}

@test "${HOME}/.config/cheat" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.config/cheat/conf.yml" {
  chezmoi_assert_feature_managed_path
}

@test "${HOME}/.local/share/cheat/community" {
  local -r toml="${HOME}/.config/chezmoi/init.d/cheat.toml"

  sed -i "s/^#url/url/" "${toml}"
  chezmoi_assert_feature_managed_path
  sed -i "s/^url/#url/" "${toml}"
}
