-- Toro Nagashi Neovim: Omarchy's generated aether setup plus the shared editor syntax.
return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      -- Toro Nagashi syntax, shared with the VS Code and Zed themes
      -- (editors/build.py): One Monokai's structure, where every role has its
      -- own hue, in Toro Nagashi colours. Nothing bold.
      --   keywords, operators, tags   lantern red
      --   declaration words (function, class, interface), built-in types,
      --     constants, booleans       sky teal
      --   functions, attributes       jade moss
      --   classes, types, modules     slate blue
      --   strings                     candle gold
      --   numbers, escapes            maple magenta
      --   parameters                  lantern orange, italic
      --   self / this                 lantern red, italic
      --   properties, object keys     snowcap rose
      --   variables                   mist
      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, c)
        local keyword = { fg = c.red }
        local storage = { fg = c.cyan }
        local func = { fg = c.green }
        local type = { fg = c.blue }
        local str = { fg = "#E1B453" }
        local number = { fg = c.magenta }
        local param = { fg = c.orange, italic = true }
        local self = { fg = c.red, italic = true }
        local plain = { fg = c.fg }
        local prop = { fg = "#FF9CB3" }
        local punct = { fg = c.dark_fg }

        local function set(groups, style)
          for _, g in ipairs(groups) do
            hl[g] = style
          end
        end

        set({ "Keyword", "Statement", "Conditional", "Repeat", "Exception", "Include", "StorageClass",
          "PreProc", "Define", "Macro", "Operator", "@keyword", "@keyword.return", "@keyword.import",
          "@keyword.conditional", "@keyword.repeat", "@keyword.exception", "@keyword.modifier",
          "@keyword.operator", "@keyword.coroutine", "@keyword.directive", "@type.qualifier", "@operator",
          "@tag", "@tag.tsx", "@tag.javascript", "@tag.builtin" }, keyword)
        set({ "Structure", "Typedef", "@keyword.function", "@keyword.type", "@keyword.storage",
          "Constant", "Boolean", "@constant", "@constant.builtin", "@boolean", "@type.builtin",
          "@string.regexp", "@string.special.symbol", "@lsp.type.enumMember" }, storage)
        set({ "Function", "@function", "@function.call", "@function.method", "@function.method.call",
          "@function.builtin", "@function.macro", "@constructor", "@attribute", "@attribute.builtin",
          "@tag.attribute", "@lsp.type.function", "@lsp.type.method", "@lsp.type.decorator" }, func)
        set({ "Type", "@type", "@type.definition", "@module", "@module.builtin", "@lsp.type.type",
          "@lsp.type.class", "@lsp.type.interface", "@lsp.type.enum", "@lsp.type.namespace",
          "@lsp.type.typeParameter", "@constructor.tsx" }, type)
        set({ "String", "Character", "@string", "@character", "@label", "@markup.list" }, str)
        hl["@string.documentation"] = { fg = "#E1B453", italic = true }
        set({ "Number", "Float", "@number", "@number.float", "@string.escape", "@character.special",
          "@punctuation.special", "SpecialChar" }, number)
        set({ "@variable.parameter", "@variable.parameter.builtin", "@lsp.type.parameter" }, param)
        set({ "@variable.builtin", "@lsp.typemod.variable.defaultLibrary" }, self)
        set({ "Identifier", "@variable", "@lsp.type.variable" }, plain)
        set({ "@variable.member", "@property", "@lsp.type.property" }, prop)
        set({ "Delimiter", "@punctuation", "@punctuation.bracket", "@punctuation.delimiter",
          "@tag.delimiter" }, punct)
        hl.Special = storage
        hl["@markup.heading"] = { fg = c.red, bold = true }
        hl["@markup.link"], hl["@markup.link.url"] = type, storage
        hl["@markup.raw"] = storage
      end,
      colors = {
        bg = "#0F1B25",
        dark_bg = "#0A141C",
        darker_bg = "#050D14",
        lighter_bg = "#182733",

        fg = "#D5E2E8",
        dark_fg = "#96ADB8",
        light_fg = "#BFCFD6",
        bright_fg = "#EDF5F9",
        muted = "#6A879B",

        red = "#FE7B73",
        yellow = "#C99C31",
        orange = "#E88C50",
        green = "#63B37B",
        cyan = "#4CB0C0",
        blue = "#7EA5DE",
        magenta = "#D689CF",
        brown = "#A5886F",

        bright_red = "#FFBBC1",
        bright_yellow = "#F7C655",
        bright_green = "#7FE19C",
        bright_cyan = "#65DDF1",
        bright_blue = "#AECFFF",
        bright_magenta = "#FFB4F7",

        accent = "#FE7B73",
        cursor = "#EDF5F9",
        foreground = "#D5E2E8",
        background = "#0F1B25",
        selection = "#1A4150",
        selection_foreground = "#EDF5F9",
        selection_background = "#1A4150",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
