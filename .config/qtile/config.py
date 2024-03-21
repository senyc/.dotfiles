import os
from typing import Any, List

from libqtile import hook, layout, qtile
from libqtile.bar import Bar
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from laptop_bar import laptop_bar
from options import BAR_HEIGHT, MARGIN, MOD_KEY
from primary_bar import primary_bar

powermenu = f"{os.path.expanduser('~')}/bin/run_powermenu"
omnipicker = f"{os.path.expanduser('~')}/bin/omnipicker"
cycle_volume_outputs = f"{os.path.expanduser('~')}/bin/cycle_pa_sinks"
lock_screen = f"{os.path.expanduser('~')}/bin/lock_screen"
terminal = "alacritty"


@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


keys = [
    Key([MOD_KEY], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD_KEY], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD_KEY], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD_KEY], "l", lazy.layout.right(), desc="Move focus to right"),
    # Move windows between left/right columns or move up/down in current stack.
    Key([MOD_KEY, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([MOD_KEY, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD_KEY, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([MOD_KEY, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([MOD_KEY], "f", lazy.window.toggle_maximize(), desc="Toggle fullscreen"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD_KEY, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([MOD_KEY, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD_KEY, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD_KEY, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([MOD_KEY], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([MOD_KEY, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle split"),
    # Toggle between different layouts
    Key([MOD_KEY, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD_KEY, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD_KEY], "d", minimize_all(), desc="Toggle minimization on all window"),
    Key([MOD_KEY, "shift"], "b", lazy.hide_show_bar(), desc="Hide the top bar"),
    Key([MOD_KEY], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD_KEY], "y", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD_KEY], "t", lazy.window.toggle_floating(), desc="Toggle floating"),
    # Various pickers and commands
    Key([MOD_KEY], "o", lazy.spawn(omnipicker), desc="Run omnipicker"),
    Key([MOD_KEY], "s", lazy.spawn(cycle_volume_outputs), desc="Cycle the volume outputs"),
    Key([MOD_KEY], "r", lazy.spawn("dmenu_run -c -l 10 -bw 2"), desc="Runs any binary on system"),
    Key([MOD_KEY], "x", lazy.spawn(powermenu), desc="Spawn a command using powermenu"),
    # Some keybinds for switching to the most heavily used applications
    Key([MOD_KEY], "b", lazy.spawn(f"{omnipicker} browser"), desc="Switch to browser"),
    Key([MOD_KEY], "i", lazy.spawn(f"{omnipicker} terminal"), desc="Switch to terminal"),
]

groups = [
    Group(
        label="i",
        name="i",
        spawn=f"{terminal} -e tmux new -s main",
    ),
    Group(
        label="r",
        name="r",
    ),
    Group(
        label="v",
        matches=[Match(wm_class="spotify")],
        name="v",
        spawn="spotify-launcher",
    ),
    Group(
        label="n",
        matches=[Match(wm_class="obsidian")],
        name="n",
    ),
    Group(
        label="o",
        matches=[Match(wm_class="slack"), Match(wm_class="discord"), Match(wm_class="zoom"), Match(wm_class="keepassxc")],
        name="o",
        spawn="keepassxc /mnt/pass/Passwords.kdbx"
    ),
]

# interface
# routing (browsing)
# volume
# notes
# other
for name in "virno":
    keys.extend(
        # Intentionally doesn't add switching keybinds, please use the omnipicker
        [
            Key(
                [MOD_KEY, "control"],
                name,
                lazy.window.togroup(name, switch_group=True),
                desc="Switch to and move focused window to group {}".format(name),
            ),
        ]
    )

layouts = [
    layout.MonadTall(border_width=0, border_normal="#000000", border_focus="#ff0000"),
    layout.VerticalTile(border_width=0, border_normal="#000000", border_focus="#ff0000"),
    layout.Tile(border_width=0, border_normal="#000000", border_focus="#ff0000"),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=15,
    padding=0,
)

background_image: str = "~/.dotfiles/backgrounds/primary_background.png"

if os.getenv("IS_LAPTOP") == "true":
    screens = [
        Screen(
            top=Bar(laptop_bar, size=BAR_HEIGHT, margin=MARGIN),
            wallpaper=background_image,
            wallpaper_mode="fill",
        )
    ]

    @hook.subscribe.suspend
    def lock_on_sleep():
        # Run screen locker
        qtile.spawn(lock_screen)

else:
    screens = [
        Screen(
            top=Bar(primary_bar, size=BAR_HEIGHT, margin=MARGIN),
            wallpaper=background_image,
            wallpaper_mode="fill",
        )
    ]


# Drag floating layouts.
mouse = [
    Drag(
        [MOD_KEY], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()
    ),
    Drag([MOD_KEY], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD_KEY], "Button2", lazy.window.bring_to_front()),
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
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
    ]
)

auto_fullscreen = True
auto_minimize = True
focus_on_window_activation = "smart"
reconfigure_screens = True
wl_input_rules = None


wmname = "qtile"
