from libqtile.bar import Bar
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.clock import Clock
from libqtile.widget.cpu import CPU
from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.memory import Memory
from libqtile.widget.spacer import Spacer
from libqtile.widget.systray import Systray
from libqtile.widget.window_count import WindowCount
from libqtile.widget.windowname import WindowName

from unicodes import left_half_circle, right_arrow, right_half_circle
from colors import nord_fox
from options import group_box_kwargs, BAR_HEIGHT


primary_bar = Bar(
    [
        GroupBox(**group_box_kwargs),
        left_half_circle(nord_fox['blue'], nord_fox['bg']),

        CurrentLayout(
            background=nord_fox['blue'],
            foreground=nord_fox['white'],
            margin=10,
        ),

        right_arrow(nord_fox['fg_gutter'], nord_fox['blue']),

        WindowCount(
            background=nord_fox['fg_gutter'],
            foreground=nord_fox['white'],
            show_zero=False
        ),

        right_half_circle(nord_fox['fg_gutter'], nord_fox['bg']),

        WindowName(
            format=' {state}{name}',
            background=nord_fox['bg'],
            foreground=nord_fox['fg'],
            max_chars=50,
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

        left_half_circle(nord_fox['black'], nord_fox['bg']),

        Systray(
            background=nord_fox['black'],
            padding=2,
        ),

        CPU(
            format=' {freq_current}GHz {load_percent}% ',
            background=nord_fox['black'],
            foreground=nord_fox['pink']
        ),


        Memory(
            format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm} ',
            background=nord_fox['black'],
            foreground=nord_fox['cyan']
        ),
    ],
    size=BAR_HEIGHT,
    margin=0
)

