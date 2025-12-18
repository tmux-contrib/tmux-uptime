# tmux-uptime API Documentation

This document describes the public API for the tmux-uptime plugin.

## Table of Contents

- [Overview](#overview)
- [Format Strings](#format-strings)
- [Core Functions](#core-functions)
  - [tmux_get_option](#tmux_get_option)
  - [tmux_set_option](#tmux_set_option)
- [Plugin Functions](#plugin-functions)
  - [main (tmux-uptime.sh)](#main-tmux-uptimesh)
  - [tmux_interpolate](#tmux_interpolate)
  - [tmux_update_option](#tmux_update_option)

---

## Overview

The tmux-uptime plugin displays the system uptime in a human-readable format
in the tmux status bar. It shows how long the system has been running since
the last boot.

## Format Strings

| Format String | Description                              |
|---------------|------------------------------------------|
| `#{uptime}`   | System uptime in human-readable format   |

**Usage Example:**
```tmux
set -g status-right "#{uptime} | %H:%M"
```

**Output Format:**
- Days are shown with 'd' suffix (e.g., "5d")
- Hours are shown with 'h' suffix (e.g., "12h")
- Minutes are shown with 'm' suffix (e.g., "30m")
- Example: "5d 12h 30m" or "2h 15m"

---

## Core Functions

Located in `scripts/core.sh`.

### tmux_get_option

Get a tmux option value.

Retrieves the value of a global tmux option. If the option is not set,
returns the provided default value.

```bash
tmux_get_option "option_name" "default_value"
```

**Arguments:**
- `$1` - The name of the tmux option to retrieve
- `$2` - The default value to return if the option is not set

**Outputs:**
- The option value or default value to stdout

**Returns:**
- `0` on success

---

### tmux_set_option

Set a tmux option value.

Sets a global tmux option to the specified value.

```bash
tmux_set_option "option_name" "value"
```

**Arguments:**
- `$1` - The name of the tmux option to set
- `$2` - The value to set the option to

**Returns:**
- `0` on success, non-zero on failure

---

## Plugin Functions

### main (tmux-uptime.sh)

Located in `scripts/tmux-uptime.sh`.

Get the system uptime in a human-readable format.

Parses the output of the uptime command and formats it as a compact string
showing days, hours, and minutes.

```bash
./scripts/tmux-uptime.sh
# Output: "5d 12h 30m" or "2h 15m"
```

**Arguments:**
- None

**Outputs:**
- The formatted uptime string to stdout

**Returns:**
- `0` on success

**Dependencies:**
- `uptime`: system command to get uptime
- `awk`, `sed`: for text processing

---

### tmux_interpolate

Located in `main.tmux`.

Interpolate the uptime pattern in content.

Replaces `#{uptime}` pattern in the given content string with the actual
tmux command string to retrieve system uptime.

```bash
tmux_interpolate "Up: #{uptime}"
# Output: "Up: #(/path/to/scripts/tmux-uptime.sh)"
```

**Arguments:**
- `$1` - The content string containing the pattern

**Outputs:**
- The content with pattern replaced by tmux command string

**Returns:**
- `0` on success

---

### tmux_update_option

Located in `main.tmux`.

Update a tmux option by interpolating the uptime pattern.

Retrieves the current value of the specified tmux option, replaces any
occurrences of `#{uptime}` with the actual command string, and sets the
option to the new value.

```bash
tmux_update_option "status-right"
```

**Arguments:**
- `$1` - The name of the tmux option to update (e.g., "status-right")

**Returns:**
- `0` on success
