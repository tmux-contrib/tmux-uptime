# tmux-uptime

A tmux plugin that displays system uptime in a human-readable format.

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-uptime'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{uptime}` format string to your status bar:

```tmux
set -g status-right "#{uptime} | %H:%M"
```

### Format Strings

| Format String | Description                          |
|---------------|--------------------------------------|
| `#{uptime}`   | System uptime in human-readable form |

## Development

### Prerequisites

Install dependencies using [Nix](https://nixos.org/):

```sh
nix develop
```

Or install manually: `bash`, `tmux`, `bats`

### Running Tests

```sh
bats tests/
```

### Debugging

Enable trace output with the `DEBUG` environment variable:

```sh
DEBUG=1 /path/to/tmux-uptime/scripts/tmux_uptime.sh
```

## License

MIT
