from libqtile.bar import Bar
from libqtile.widget.clock import Clock
from libqtile.widget.cpu import CPU
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.memory import Memory
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.windowname import WindowName

from colors import nord_fox
from options import BAR_HEIGHT, group_box_kwargs
from unicodes import left_half_circle, right_half_circle

primary_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        left_half_circle(nord_fox["blue"], nord_fox["bg"]),
        CurrentLayout(
            background=nord_fox["blue"],
            foreground=nord_fox["white"],
            margin=10,
        ),
        right_half_circle(nord_fox["blue"], nord_fox["bg"]),
        WindowName(
            background=nord_fox["bg"],
            foreground=nord_fox["fg"],
            format=" {state}{name}",
            max_chars=50,
        ),
        left_half_circle(nord_fox["black"], nord_fox["bg"]),
        Clock(background=nord_fox["black"], foreground=nord_fox["white"], format=" %m/%d %H:%M "),
        right_half_circle(nord_fox["black"], nord_fox["bg"]),
        Spacer(
            background=nord_fox["bg"],
        ),
        left_half_circle(nord_fox["black"], nord_fox["bg"]),
        Systray(
            background=nord_fox["black"],
            padding=2,
        ),
        CPU(
            background=nord_fox["black"],
            foreground=nord_fox["pink"],
            format="{freq_current}GHz {load_percent}% ",
        ),
        Memory(
            background=nord_fox["black"],
            foreground=nord_fox["cyan"],
            format="{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm} ",
        ),
    ],
    size=BAR_HEIGHT,
    margin=0,
)
