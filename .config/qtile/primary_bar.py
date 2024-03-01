from libqtile.widget.clock import Clock
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.generic_poll_text import GenPollCommand
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.load import Load
from libqtile.widget.memory import Memory
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.windowname import WindowName

from colors import nord_fox
from options import group_box_kwargs
from unicodes import left_half_circle, right_half_circle


def window_name_parser(text: str) -> str:
    browsers = ["Chromium", "Firefox"]
    # Trim the active tab out of the window name
    for browser in browsers:
        if browser in text:
            return browser
    # Trim the current channel
    if "Slack" in text:
        return "Slack"
    return text

primary_bar = [
    GroupBox(**group_box_kwargs),
    left_half_circle(nord_fox["blue"], nord_fox["bg"]),
    CurrentLayout(
        background=nord_fox["blue"],
        foreground=nord_fox["window_mode_fg"],
        margin=10,
    ),
    right_half_circle(nord_fox["blue"], nord_fox["bg"]),
    GenPollCommand(
        cmd="current_tmux_session",
        background=nord_fox["bg"],
        foreground=nord_fox["fg"],
        update_interval=1,
        fmt=" {}"
    ),
    WindowName(
        background=nord_fox["bg"],
        foreground=nord_fox["fg"],
        format=" - {name}",
        max_chars=30,
        parse_text=window_name_parser,
    ),
    left_half_circle(nord_fox["black"], nord_fox["bg"]),
    Clock(background=nord_fox["black"], foreground=nord_fox["fg"], format="%m/%d %H:%M"),
    right_half_circle(nord_fox["black"], nord_fox["bg"]),
    Spacer(
        background=nord_fox["bg"],
    ),
    left_half_circle(nord_fox["black"], nord_fox["bg"]),
    Systray(
        background=nord_fox["black"],
        padding=1,
    ),
    Load(background=nord_fox["black"], foreground=nord_fox["cyan"], format="{time} {load:.2f}"),
    Memory(
        background=nord_fox["black"],
        foreground=nord_fox["pink"],
        format=" {MemUsed:.0f}{mm}B ",
    ),
]
