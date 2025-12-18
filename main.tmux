#!/bin/bash

# tmux-uptime plugin entry point.
#
# This plugin provides a #{uptime} format string that displays
# the system uptime in a human-readable format in the tmux status bar.
#
# Usage:
#   Add #{uptime} to your status-left or status-right option.
#
# Example:
#   set -g status-right "#{uptime} | %H:%M"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/core.sh
source "${CURRENT_DIR}/scripts/core.sh"

uptime="#(${CURRENT_DIR}/scripts/tmux-uptime.sh)"
uptime_pattern="\#{uptime}"

# Interpolate the uptime pattern in content.
#
# Replaces #{uptime} pattern in the given content string with the
# actual tmux command string to retrieve system uptime.
#
# Globals:
#   uptime - The tmux command string to get uptime
#   uptime_pattern - The pattern to replace (#{uptime})
# Arguments:
#   $1 - The content string containing the pattern
# Outputs:
#   The content with pattern replaced by tmux command string
# Returns:
#   0 on success
tmux_interpolate() {
	local content=$1

	content=${content/$uptime_pattern/$uptime}

	echo "$content"
}

# Update a tmux option by interpolating the uptime pattern.
#
# Retrieves the current value of the specified tmux option, replaces any
# occurrences of #{uptime} with the actual command string, and sets
# the option to the new value.
#
# Globals:
#   None
# Arguments:
#   $1 - The name of the tmux option to update (e.g., "status-right")
# Returns:
#   0 on success
tmux_update_option() {
	local option="$1"
	local option_value

	option_value="$(tmux_get_option "$option")"
	option_value="$(tmux_interpolate "$option_value")"

	tmux_set_option "$option" "$option_value"
}

# Main entry point for the plugin.
#
# Initializes the uptime plugin by updating the status-right and status-left
# options to interpolate the uptime pattern.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 on success
main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main
