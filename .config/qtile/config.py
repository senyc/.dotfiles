from typing import List, Any
import subprocess
import os

from libqtile import hook
from libqtile import layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from primary_bar import primary_bar
from side_bars import left_bar, right_bar

mod = 'mod4'
terminal = 'alacritty'
powermenu = 'run_powermenu'
drun = 'run_rofi'
browser = 'chromium'

@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.

    Key([mod], "f", lazy.window.toggle_maximize(), desc="Toggle fullscreen"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod], "y", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn(drun), desc="Spawn a command using rofi"),
    Key([mod], "x", lazy.spawn(powermenu), desc="Spawn a command using powermenu"),
    Key([mod], "d", minimize_all(), desc="Toggle minimization on all window"),
    # Launch applications
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating"),
    # Screens
    Key([mod], "comma", lazy.to_screen(2)),
    Key([mod, "control"], "comma", lazy.window.toscreen(2)),
    Key([mod], "period", lazy.to_screen(0)),
    Key([mod, "control"], "period", lazy.window.toscreen(0)),
    Key([mod], "slash", lazy.to_screen(1)),
    Key([mod, "control"], "slash", lazy.window.toscreen(1)),
]

groups = [
    Group(
        name='i',
        label='i',
        spawn=terminal
    ),
    Group(
        name='r',
        label='r',
        matches=[Match(wm_class='chromium')],
        layout='monadtall'
    ),
    Group(
        name='v',
        label='v',
        matches=[Match(wm_class='spotify')],
        layout='monadtall'
    ),
    Group(
        name='o',
        label='o',
        matches=[Match(wm_class='slack'), Match(wm_class='discord')],
        layout='columns'
    ),
]

for name in 'viro':
    keys.extend(
        [
            Key(
                [mod],
                name,
                lazy.group[name].toscreen(),
                desc="Switch to group {}".format(name),
            ),
            Key(
                [mod, "control"],
                name,
                lazy.window.togroup(name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(name),
            ),
        ]
    )

layouts = [
    layout.MonadTall(border_width=0, border_normal="#000000", border_focus="#ff0000"),
    layout.VerticalTile(border_width=0, border_normal="#000000", border_focus="#ff0000"),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    layout.Tile(border_width=0, border_normal="#000000", border_focus="#ff0000"),
    # layout.TreeTab(),
    # layout.Zoomy(),
    # layout.Floating(),
    # layout.Columns(),
]

widget_defaults = dict(
    font='JetBrainsMono Nerd Font Mono',
    fontsize=15,
    padding=0,
)

# 0 is always primary monitor
screens = [
    Screen(top=primary_bar),
    Screen(top=left_bar),
    Screen(top=right_bar),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules: List[Any] = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None

@hook.subscribe.startup_once
def autostart():
    file_dir = os.path.expanduser('~/.config/qtile/autostart')
    subprocess.run([file_dir])

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
# I changed it to qtile
wmname = "qtile"
