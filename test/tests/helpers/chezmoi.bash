# Fail when a file contains repeated empty lines.
#
# Arguments:
#   $1 - file
# Outputs:
#   STDERR - details, on failure
_assert_no_repeated_empty_lines() {
  local -r exp=$(cat -s "$1")
  run cat "$1"
  assert_output "${exp}"
}

# Fail when a file doesn't have exactly one trailing empty line.
#
# Outputs:
#   STDERR - details, on failure
_assert_one_trailing_empty_line() {
  local -r empty=$(tail -n2 "$1" | grep -cE "^$")
  assert_equal "${empty}" "1"
}

# Fail when a feature doesn't exist.
#
# Arguments:
#   $1 - feature
#   $2 - configuration file
# Outputs:
#   STDERR - details, on failure
_chezmoi_assert_feature_exists() {
  run grep -qF "$1" "$2"
  assert_success
}

# Initialises Chezmoi and applies the changes.
#
# Outputs:
#   STDERR - details, on failure
_chezmoi_init_and_apply() {
  run chezmoi init --force --apply
  assert_success
}

# Updates a feature, initialises Chezmoi and applies the changes.
#
# Arguments:
#   $1 - feature
#   $2 - boolean
# Outputs:
#   STDERR - details, on failure
_chezmoi_update_feature() {
  local -r toml="${HOME}/.config/chezmoi/init.d/features.toml"

  _chezmoi_assert_feature_exists "$1" "${toml}"
  run sed -i "s/\($1\) = .\+/\1 = $2/" "${toml}"
  assert_success
}

# Fail when a managed path is not handled correctly.
#
# Globals:
#   BATS_TEST_FILENAME - feature
#   BATS_TEST_DESCRIPTION - path
# Outputs:
#   STDOUT - result
#   STDERR - details, on failure
chezmoi_assert_feature_managed_path() {
  # shellcheck disable=SC2154
  local -r feat="$(basename "${BATS_TEST_FILENAME}" .bats)"
  # shellcheck disable=SC2154
  local -r path="${BATS_TEST_DESCRIPTION}"

  chezmoi_disable_feature "${feat}"
  assert_not_exists "${path}"
  chezmoi_enable_feature "${feat}"
  assert_exists "${path}"
  if [[ -f "${path}" && ! -L "${path}" ]]; then
    _assert_no_repeated_empty_lines "${path}"
    _assert_one_trailing_empty_line "${path}"
  fi
  chezmoi_disable_feature "${feat}"
  assert_not_exists "${path}"
}

# Fail when an unmanaged path is not handled correctly.
#
# Globals:
#   BATS_TEST_FILENAME - feature
#   BATS_TEST_DESCRIPTION - path
# Outputs:
#   STDOUT - result
#   STDERR - details, on failure
chezmoi_assert_feature_unmanaged_path() {
  # shellcheck disable=SC2154
  local -r feat="$(basename "${BATS_TEST_FILENAME}" .bats)"
  # shellcheck disable=SC2154
  local -r path="${BATS_TEST_DESCRIPTION}"
  local -r base="$(dirname "${path}")"

  chezmoi_enable_feature "${feat}"
  mkdir -p "${base}"
  touch "${path}"
  chezmoi_disable_feature "${feat}"
  assert_not_exists "${path}"
}

# Disables a feature, initialises Chezmoi, and applies the changes.
#
# Arguments:
#   $1 - feature
# Outputs:
#   STDERR - details, on failure
chezmoi_disable_feature() {
  _chezmoi_update_feature "$1" "false"
  _chezmoi_init_and_apply
}

# Enables a feature, initialises Chezmoi, and applies the changes.
#
# Arguments:
#   $1 - feature
# Outputs:
#   STDERR - details, on failure
chezmoi_enable_feature() {
  _chezmoi_update_feature "$1" "true"
  _chezmoi_init_and_apply
}
