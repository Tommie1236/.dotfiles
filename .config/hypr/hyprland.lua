-- See https://wiki.hypr.land/Configuring/Monitors/
-- eDP-1     Integrated display
-- DP-2      Mini-DP out
-- DP-3      DOCK DP-1 out
-- DP-4      DOCK DP-2 out
-- DP-5      DOCK VGA out
-- HDMI-A-1  HDMI out

-- Desktop
hl.monitor({ output = "DP-1",   mode = "1920x1200@60.00Hz", position = "0x0",      scale = 1 })
-- somehow the dp output sometimes switches to another id.
hl.monitor({ output = "DP-2",   mode = "1920x1200@60.00Hz", position = "0x0",      scale = 1 })
hl.monitor({ output = "DVI-D-1",mode = "1920x1200@60.00Hz", position = "1920x-400", scale = 1, transform = 1 })

-- Mirror
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })

-- home, 2 monitors above main laptop
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60.00Hz", position = "960x1080",  scale = 1 })
-- hl.monitor({ output = "DP-2",  mode = "3840x1080@60.00Hz", position = "0x0",       scale = 1 })
-- hl.monitor({ output = "DP-3",  mode = "1920x1080@60.00Hz", position = "0x0",       scale = 1 })
-- hl.monitor({ output = "DP-4",  mode = "1920x1080@60.00Hz", position = "1920x0",    scale = 1 })

-- somewhere else
hl.monitor({ output = "eDP-1",  mode = "1920x1080@60.00Hz", position = "1920x0",   scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@59.94Hz", position = "0x-1080", scale = 1 })
-- hl.monitor({ output = "DP-2", mode = "1920x1200@59.95", position = "1920x0", scale = 1.0 })
-- hl.monitor({ output = "DP-2", transform = 1 })
-- hl.monitor({ output = "eDP-1", mode = "1920x1080@60.0", position = "0x0", scale = 1.0 })

-- fallback
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- Execute your favorite apps at launch
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("sudo keyd")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Set programs that you use
local terminal   = "kitty"
local fileManager = "thunar"
local menu       = "rofi -show drun"

-- Some default env vars.
hl.env("XCURSOR_SIZE", "16")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct") -- change to qt6ct if you have that

-- For all categories, see https://wiki.hypr.land/Configuring/Variables/
hl.config({
    input = {
        kb_layout  = "us",
        kb_options = "ctrl:nocaps",

        follow_mouse = 1,

        touchpad = {
            natural_scroll        = true,
            disable_while_typing  = false,
        },

        sensitivity = 0.8,
    },

    general = {
        -- See https://wiki.hypr.land/Configuring/Variables/ for more

        gaps_in   = 3,
        gaps_out  = 3,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        layout = "dwindle",
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
    },

    render = {
        direct_scanout = true,
    },

    decoration = {
        -- See https://wiki.hypr.land/Configuring/Variables/ for more
        rounding = 5,
    },

    animations = {
        enabled = false,
    },

    dwindle = {
        -- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
        preserve_split = true, -- you probably want this
    },

    master = {
        new_status = "master",
    },

    misc = {
        -- Handled by hyprpaper now

        -- See https://wiki.hypr.land/Configuring/Variables/ for more
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
    },
})

-- workspace = w[t1], gapsin:0, gapsout:0, border:false, rounding:false
hl.workspace_rule({
    workspace = "w[t1]",
    gaps_in   = 0,
    gaps_out  = 0,
    no_border    = true,
    no_rounding  = true,
})

hl.window_rule({
    name           = "supress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name       = "fix-xwayland-drags",
    match      = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus   = true,
})

-- See https://wiki.hypr.land/Configuring/Keywords/ for more
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())    -- dwindle
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Fix Media Keys
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightness_control --up"),                            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightness_control --down"),                          { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),           { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +2%"),            { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -2%"),            { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86AudioPlay",    hl.dsp.exec_cmd("playerctl play-pause"),                                { locked = true, release = true})
-- hl.bind("code:200",            hl.dsp.exec_cmd("playerctl play-pause"),                                { locked = true, repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"),                                      { locked = true, repeating = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"),                                  { locked = true, repeating = true })
hl.bind("XF86Search",            hl.dsp.exec_cmd(menu),                                                  { locked = true, repeating = true })
hl.bind("XF86Sleep",             hl.dsp.exec_cmd("systemctl suspend"),                                   { locked = true, repeating = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down"  }))
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + J",     hl.dsp.focus({ direction = "down"  }))
hl.bind(mainMod .. " + K",     hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + L",     hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 0  }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2  }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3  }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4  }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5  }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6  }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7  }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8  }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9  }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1  }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2  }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3  }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4  }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5  }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6  }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7  }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8  }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9  }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
-- "tab" through workspaces
-- hl.bind(mainMod .. " + tab",         hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ monitor = "-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
