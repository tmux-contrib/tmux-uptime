#!/bin/bash

# Get the system uptime in a human-readable format.
#
# Parses the output of the uptime command and formats it as a compact
# string showing days, hours, and minutes.
#
# Output Format:
#   - Days are shown with 'd' suffix (e.g., "5d")
#   - Hours are shown with 'h' suffix (e.g., "12h")
#   - Minutes are shown with 'm' suffix (e.g., "30m")
#   - Example: "5d 12h 30m" or "2h 15m"
#
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   The formatted uptime string to stdout
# Returns:
#   0 on success
# Dependencies:
#   - uptime: system command to get uptime
#   - awk, sed: for text processing
main() {
	uptime | awk -F, '{print $1,$2}' | sed 's/:/h /g;s/^.*up *//; s/ *[0-9]* user.*//;s/[0-9]$/&m/;s/ day. */d /g'
}

main
