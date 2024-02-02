return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        disable_background = true,
        disable_italics = true,
        italic_comments = true,
        styles = {
          italic = false,
        },
        highlight_groups = {
          Visual = { bg = "#224488" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}

-- return {
--   "folke/tokyonight.nvim",
--   opts = {
--     on_colors = function(colors)
--       colors.bg_visual = "#2244ff"
--     end,
--     transparent = true,
--     terminal_colors = false,
--     styles = {
--       sidebars = "transparent",
--       -- floats = "transparent",
--     },
--   },
-- }
