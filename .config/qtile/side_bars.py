from libqtile.bar import Bar
from libqtile.widget.clock import Clock
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.spacer import Spacer

from colors import nord_fox
from options import BAR_HEIGHT, group_box_kwargs
from unicodes import left_half_circle, right_half_circle

left_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        right_half_circle(nord_fox["black"], nord_fox["bg"]),
        Spacer(
            background=nord_fox["bg"],
        ),
        left_half_circle(nord_fox["black"], nord_fox["bg"]),
        Clock(background=nord_fox["black"], foreground=nord_fox["white"], format=" %m/%d %H:%M "),
        right_half_circle(nord_fox["black"], nord_fox["bg"]),
        Spacer(
            background=nord_fox["bg"],
        ),
        left_half_circle(nord_fox["blue"], nord_fox["bg"]),
        CurrentLayout(
            background=nord_fox["blue"],
            foreground=nord_fox["white"],
            margin=10,
        ),
        right_half_circle(nord_fox["blue"], nord_fox["bg"]),
    ],
    size=BAR_HEIGHT,
    margin=0,
)

right_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        right_half_circle(nord_fox["black"], nord_fox["bg"]),
        Spacer(
            background=nord_fox["bg"],
        ),
        left_half_circle(nord_fox["black"], nord_fox["bg"]),
        Clock(background=nord_fox["black"], foreground=nord_fox["white"], format=" %m/%d %H:%M "),
        right_half_circle(nord_fox["black"], nord_fox["bg"]),
        Spacer(
            background=nord_fox["bg"],
        ),
        left_half_circle(nord_fox["blue"], nord_fox["bg"]),
        CurrentLayout(
            background=nord_fox["blue"],
            foreground=nord_fox["white"],
            margin=10,
        ),
        right_half_circle(nord_fox["blue"], nord_fox["bg"]),
    ],
    size=BAR_HEIGHT,
    margin=0,
)
