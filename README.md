# tmux-uptime

A tmux plugin that displays system uptime in a human-readable format.

## Installation

```tmux
# configure the tmux plugins manager
set -g @plugin "tmux-plugins/tpm"

# official plugins
set -g @plugin 'tmux-contrib/tmux-uptime'
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
