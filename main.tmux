#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/tmux-core.sh"

# shellcheck disable=1090
uptime="#(${CURRENT_DIR}/scripts/tmux-uptime.sh)"
uptime_pattern="\#{uptime}"

tmux_interpolate() {
	local content=$1

	content=${content/$uptime_pattern/$uptime}

	echo "$content"
}

tmux_update_option() {
	local option="$1"
	local option_value

	option_value="$(tmux_get_option "$option")"
	option_value="$(tmux_interpolate "$option_value")"

	tmux_set_option "$option" "$option_value"
}

main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main
