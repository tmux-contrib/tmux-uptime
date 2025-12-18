# tmux-uptime

A tmux plugin that displays system uptime in a human-readable format.

## Features

- Display system uptime in compact format (days, hours, minutes)
- Lightweight with no external dependencies
- Works on macOS and Linux

## Requirements

- `uptime` command (available on all Unix-like systems)

## Installation

### Using TPM

Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-uptime'
```

Then press `prefix` + <kbd>I</kbd> to install.

### Manual

Clone the repository:

```bash
git clone https://github.com/tmux-contrib/tmux-uptime ~/.tmux/plugins/tmux-uptime
```

Add to your `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-uptime/main.tmux
```

## Usage

Add the `#{uptime}` format string to your status bar:

```tmux
set -g status-right "#{uptime} | %H:%M"
```

### Format Strings

| Format String | Description                          |
|---------------|--------------------------------------|
| `#{uptime}`   | System uptime in human-readable form |

### Example Output

- `5d 12h 30m` - 5 days, 12 hours, 30 minutes
- `2h 15m` - 2 hours, 15 minutes
- `45m` - 45 minutes

## Documentation

See [docs/API.md](docs/API.md) for the full API documentation.

## License

[MIT](LICENSE)
