from Xlib import display as xdisplay
from Xlib.ext.randr import Connected as RR_Connected


def get_monitor_resolutions() -> list[tuple]:
    """Resolutions of monitors"""
    resolutions = []
    try:
        display = xdisplay.Display()
        screen = display.screen()
        resources = screen.root.xrandr_get_screen_resources()._data
        for output in resources["outputs"]:
            monitor = display.xrandr_get_output_info(output, resources["config_timestamp"])._data
            if monitor["connection"] == RR_Connected and monitor["crtc"]:
                crtc = display.xrandr_get_crtc_info(
                    monitor["crtc"], resources["config_timestamp"]
                )._data
                resolutions.append((crtc["width"], crtc["height"]))
    except Exception:
        return [(0, 0)]
    else:
        return resolutions
