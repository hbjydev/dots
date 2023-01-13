local wezterm = require("wezterm")

return {
    default_cursor_style = "SteadyBar",

    font = wezterm.font("FiraCode Nerd Font"),
    font_size = 12.0,

    enable_tab_bar = true,
    enable_wayland = true,

    window_background_opacity = 1,
    window_close_confirmation = "NeverPrompt",

    default_prog = { "zsh" },

    colors = {
        foreground = "#dde1e6",
        background = "#161616",
        cursor_bg = "#f2f4f8",
        cursor_fg = "#393939",
        cursor_border = "#f2f4f8",
        selection_fg = "#f2f4f8",
        selection_bg = "#525252",
        scrollbar_thumb = "#222222",
        split = "#444444",
        ansi = {
            "#262626",
            "#ff7eb6",
            "#42be65",
            "#82cfff",
            "#33b1ff",
            "#ee5396",
            "#3ddbd9",
            "#dde1e6",
        },
        brights = {
            "#393939",
            "#ff7eb6",
            "#42be65",
            "#82cfff",
            "#33b1ff",
            "#ee5396",
            "#3ddbd9",
            "#ffffff",
        },
    },
}
