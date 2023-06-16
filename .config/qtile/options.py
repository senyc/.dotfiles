from colors import nord_fox

BAR_HEIGHT = 28

group_box_kwargs = {
    "disable_drag": True,
    "background": nord_fox['bg'],
    "highlight_method": "block",
    "foreground": nord_fox['magenta'],
    "active": nord_fox['white'],
    "inactive": nord_fox['white'],
    "other_screen_border": nord_fox['black'],
    "this_current_screen_border": nord_fox['red'],
    "this_screen_border": nord_fox['cyan'],
    "other_current_screen_border": nord_fox['red'],
    "highlight_color": [nord_fox['red'], nord_fox['black']],
    "spacing": 5,
    "padding": 5,
    "rounded": False,
}

