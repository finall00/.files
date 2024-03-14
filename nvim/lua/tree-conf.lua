require("nvim-tree").setup({
  disable_netrw = true,
  view = {
    adaptive_size = false,
    float = {
      enable = false,
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

