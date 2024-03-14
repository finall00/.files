-- fazer minha propria config
-- https://github.com/nvim-lualine/lualine.nvim
-- separator options     
require('lualine').setup {
    options = {
  theme = 'onedark', -- lualine theme
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  disabled_filetypes = {     -- Filetypes to disable lualine for.
      statusline = {},       -- only ignores the ft for statusline.
      winbar = {},           -- only ignores the ft for winbar.
  },

  ignore_focus = {},         -- If current filetype is in this list it'll
  always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
  globalstatus = false,        -- enable global statusline (have a single statusline

  refresh = {                  -- sets how often lualine should refresh it's contents (in ms)
    statusline = 1000,         -- The refresh option sets minimum time that lualine tries
    tabline = 1000,            -- to maintain between refresh. It's not guarantied if situation
    winbar = 1000              -- arises that lualine needs to refresh itself before this time
  }
},
sections = {
  lualine_a = {
    {
      'mode',
      icons_enabled = true, -- Enables the display of icons alongside the component.
      icon = nil,

      separator = nil,      -- Determines what separator to use for the component.
      cond = nil,           -- Condition function, the component is loaded when the function returns `true`.

      draw_empty = false,   -- Whether to draw component even if it's empty.
      color = nil, -- The default is your theme's color for that section and mode.
      type = nil,

      padding = 1, -- Adds padding to the left and right of components.

      on_click = nil, -- takes a function that is called when component is clicked with mouse.
    }
  },
}
}

