from libqtile.bar import Bar
from libqtile.widget.clock import Clock
from libqtile.widget.spacer import Spacer

from unicodes import left_half_circle, right_half_circle
from colors import nord_fox
from libqtile.widget.groupbox import GroupBox
from options import group_box_kwargs, BAR_HEIGHT

left_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        Spacer(
            background=nord_fox['bg'],
        ),

        left_half_circle(nord_fox['black'], nord_fox['bg']),

        Clock(
            background=nord_fox['black'],
            foreground=nord_fox['white'],
            format=' %m/%d %H:%M '
        ),

        right_half_circle(nord_fox['black'], nord_fox['bg']),

        Spacer(
            background=nord_fox['bg'],
        ),
    ],
    size=BAR_HEIGHT,
    margin=0
)

right_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        Spacer(
            background=nord_fox['bg'],
        ),

        left_half_circle(nord_fox['black'], nord_fox['bg']),

        Clock(
            background=nord_fox['black'],
            foreground=nord_fox['white'],
            format=' %m/%d %H:%M '
        ),

        right_half_circle(nord_fox['black'], nord_fox['bg']),

        Spacer(
            background=nord_fox['bg'],
        ),
    ],
    size=BAR_HEIGHT,
    margin=0
)
