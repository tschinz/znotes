---
tags:
- tools
- sublimetext
---
#  Settings

- [Sublime in Config Repo]({{config_repo_folder}}/config/sublimetext)

## Preferences Settings

``` json title="Preferences.sublime-settings" linenums="1"
{
    "always_show_minimap_viewport": true,
    "bold_folder_labels": true,
    "caret_style": "blink",
    "close_windows_when_empty": false,
    "color_scheme": "Packages/sublimetext_moonburst/moonburst.tmTheme",
    "draw_minimap_border": true,
    "draw_white_space": "all",
    "fade_fold_buttons": false,
    "font_face": "Operator Mono Book",
    "font_size": 15,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignore_vcs_packages": true,
    "ignored_packages":
    [
        "Markdown",
        "RestructuredText",
        "Vintage"
    ],
    "indent_guide_options":
    [
        "draw_normal",
        "draw_active"
    ],
    "line_numbers": true,
    "overlay_scroll_bars": "enabled",
    "rulers":
    [
        80,
        160
    ],
    "scroll_past_end": true,
    "show_encoding": true,
    "show_line_endings": true,
    "show_tab_close_buttons": true,
    "tab_size": 4,
    "theme": "Adaptive.sublime-theme",
    "translate_tabs_to_spaces": true,
    "trim_automatic_white_space": true,
    "trim_trailing_white_space_on_save": true,
    "word_wrap": true
}
```

## Preferences Key Bindings

``` title="Default (Windows).sublime-keymap" linenums="1"
[
    { "keys": ["alt+up"], "command": "select_lines", "args": {"forward": false} },
    { "keys": ["alt+down"], "command": "select_lines", "args": {"forward": true} },

    { "keys": ["ctrl+alt+c"], "command": "show_panel", "args": {"panel": "console", "toggle": true} },
    { "keys": ["ctrl+alt+m"], "command": "toggle_menu" },
    { "keys": ["ctrl+alt+t"], "command": "toggle_tabs" },

    { "keys": ["ctrl+tab"], "command": "next_view" },
    { "keys": ["ctrl+shift+tab"], "command": "prev_view" },

    { "keys": ["ctrl+alt+q"], "command": "alignment" },

    // Change view split to left in a 2 Column mode
    {
        "keys": ["super+alt+right"],
        "command": "run_multiple",
        "args":
        {
            "commands": [
                {
                    "command": "set_layout",
                    "args":
                    {
                        "cols": [0.0, 0.90, 1.0],
                        "rows": [0.0, 1.0],
                        "cells": [[0, 0, 1, 1], [1, 0, 2, 1]]
                    },
                    "context": "window"
                },
                {
                    "command": "focus_group",
                    "args": { "group": 0 },
                    "context": "window"
                }
            ]
        }
    },
    // Change view split to right in a 2 Column mode
    {
        "keys": ["super+alt+left"],
        "command": "run_multiple",
        "args":
        {
            "commands": [
                {
                    "command": "set_layout",
                    "args":
                    {
                        "cols": [0.0, 0.10, 1.0],
                        "rows": [0.0, 1.0],
                        "cells": [[0, 0, 1, 1], [1, 0, 2, 1]]
                    },
                    "context": "window"
                },
                {
                    "command": "focus_group",
                    "args": { "group": 1 },
                    "context": "window"
                }
            ]
        }
    },
    // Change view split to the middle in a 2 Column mode
    {
        "keys": ["super+alt+up"],
        "command": "run_multiple",
        "args":
        {
            "commands": [
                {
                    "command": "set_layout",
                    "args":
                    {
                        "cols": [0.0, 0.50, 1.0],
                        "rows": [0.0, 1.0],
                        "cells": [[0, 0, 1, 1], [1, 0, 2, 1]]
                    },
                    "context": "window"
                },
                {
                    "command": "focus_group",
                    "args": { "group": 1 },
                    "context": "window"
                }
            ]
        }
    },
]
```

## Custom Plugin Run Multiple commands

- Goto `Tool` -> `Developer` -> `New Plugin`
- Create a new plugin called `run_multiple`

``` python title="run_multiple.py" linenums="1"
import sublime, sublime_plugin

# Takes an array of commands (same as those you'd provide to a key binding) with
# an optional context (defaults to view commands) & runs each command in order.
# Valid contexts are 'text', 'window', and 'app' for running a TextCommand,
# WindowCommands, or ApplicationCommand respectively.

class RunMultipleCommand(sublime_plugin.TextCommand):
  def exec_command(self, command):
    if not 'command' in command:
      raise Exception('No command name provided.')

    args = None
    if 'args' in command:
      args = command['args']

    # default context is the view since it's easiest to get the other contexts
    # from the view
    context = self.view
    if 'context' in command:
      context_name = command['context']
      if context_name == 'window':
        context = context.window()
      elif context_name == 'app':
        context = sublime
      elif context_name == 'text':
        pass
      else:
        raise Exception('Invalid command context "'+context_name+'".')

    # skip args if not needed
    if args is None:
      context.run_command(command['command'])
    else:
      context.run_command(command['command'], args)

  def run(self, edit, commands = None):
    if commands is None:
      return # not an error

    for command in commands:
      self.exec_command(command)
```