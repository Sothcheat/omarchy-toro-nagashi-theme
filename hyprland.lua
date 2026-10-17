-- Toro Nagashi. A theme's hyprland.lua replaces the one Omarchy generates from
-- colors.toml, so the border gradient is repeated here; keep it in step with
-- hyprland_active_border there (the shell's popups and lock screen read that).

-- Focused window: sky teal running down into the maple canopy. Others: the
-- dark slate of the far ridges.
local active_border_color = { colors = { "rgb(348597)", "rgb(b64f77)" }, angle = 45 }
local inactive_border_color = "rgba(2d3747aa)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
})

-- Let the painting show faintly through terminals.
o.window({ tag = "terminal" }, { opacity = "0.94 0.90" })
