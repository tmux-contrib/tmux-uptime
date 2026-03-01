#!/usr/bin/env bash
set -euo pipefail
[[ -z "${DEBUG:-}" ]] || set -x

_tmux_uptime_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[[ -f "$_tmux_uptime_root/scripts/tmux_core.sh" ]] || {
	echo "tmux-uptime: missing tmux_core.sh" >&2
	exit 1
}

# shellcheck source=scripts/tmux_core.sh
source "$_tmux_uptime_root/scripts/tmux_core.sh"

uptime_status="#($_tmux_uptime_root/scripts/tmux_uptime.sh)"
uptime_status_pattern="\#{uptime}"

_tmux_interpolate() {
	local content=$1
	local pattern=$2
	local value=$3

	echo "${content/$pattern/$value}"
}

_tmux_update_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(_tmux_get_option "$option")"
	new_option_value="$(_tmux_interpolate "$option_value" "$uptime_status_pattern" "$uptime_status")"

	_tmux_set_option "$option" "$new_option_value"
}

main() {
	_tmux_update_option "status-right"
	_tmux_update_option "status-left"
}

main
