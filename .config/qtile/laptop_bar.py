from libqtile.widget.battery import Battery

from colors import nord_fox
from primary_bar import primary_bar

# Add the battery icon to the default bar
laptop_bar = primary_bar + [
        Battery(
            background=nord_fox["black"],
            format="{char} {percent:2.0%} ",
            show_short_text=False,
            foreground=nord_fox["fg"],
            full_char="󰁹",
            charge_char="󱐋󰁹",
            empty_char="󰁹",
            discharge_char="󰁹",
        )
    ]
