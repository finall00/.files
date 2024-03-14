local actions = require("telescope.actions")

require("telescope").setup{
  defaults = {
      path_display = {
            shorten = {
                len = 3, exclude = {1, -1}
            },
            truncate = true
      },
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
  live_grep = {
            theme = "dropdown",
        },
        help_tags = {
            theme = "dropdown",
        }
    }
}
