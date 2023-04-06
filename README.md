# tmux-uptime

This plugin displays the current machine uptime.

## Installation

This is a plugin for [tmux plugin
manager](https://github.com/tmux-plugins/tpm). You can install it by adding the
following line in your tmux config.

```shell
set -g @plugin 'tmux-contrib/tmux-uptime'
```

## Getting Started

You can use the `#{uptime}` variable in your existing status line.

```shell
set-option -g status-right '#{uptime}'
```
