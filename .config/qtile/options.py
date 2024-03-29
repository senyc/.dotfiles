from colors import nord_fox

BAR_HEIGHT = 26
MOD_KEY = "mod4"
MARGIN = 0

group_box_kwargs = {
    "active": nord_fox["fg"],
    "background": nord_fox["black"],
    "disable_drag": True,
    "foreground": nord_fox["magenta"],
    "highlight_color": [nord_fox["red"], nord_fox["black"]],
    "highlight_method": "block",
    "inactive": nord_fox["fg"],
    "other_current_screen_border": nord_fox["red"],
    "other_screen_border": nord_fox["black"],
    "padding": 5,
    "rounded": False,
    "spacing": 5,
    "this_current_screen_border": nord_fox["red"],
    "this_screen_border": nord_fox["cyan"],
}
