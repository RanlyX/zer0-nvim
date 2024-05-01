return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("nvim-tree").setup({
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = true,
          },
          icons = {
          git_placement = "signcolumn",
            show = {
              git = true,
              file = true,
              folder = true,
              folder_arrow = true,
            },
            glyphs = {
              bookmark = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "⌥",
                renamed = "➜",
                untracked = "★",
                deleted = "⊖",
                ignored = "◌",
              },
            },
          },
        },
      })
    end
  }
}
