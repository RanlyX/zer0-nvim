local cs_monokai = {
  'tanvirtin/monokai.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme monokai")
    -- vim.cmd("colorscheme monokai_pro")
    -- vim.cmd("colorscheme monokai_soda")
    -- vim.cmd("colorscheme monokai_ristretto")
  end,
}

local cs_visual_studio_code = {
  "askfiy/visual_studio_code",
  priority = 100,
  config = function()
    vim.cmd([[colorscheme visual_studio_code]])
    require("lualine").setup({
      options = {
        theme = "visual_studio_code",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = require("visual_studio_code").get_lualine_sections(),
    })
  end,
}

local cs_vscode = {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme vscode")
  end,                                                                                                                                                                                                                                       
}

local cs_tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,            
  priority = 1000,         
  config = function()
    -- vim.cmd("colorscheme tokyonight")
    -- vim.cmd("colorscheme tokyonight-night")
    vim.cmd("colorscheme tokyonight-storm")
    -- vim.cmd("colorscheme tokyonight-day")
    -- vim.cmd("colorscheme tokyonight-moon")
  end,
}

return {
  cs_visual_studio_code,
  cs_vscode,
  cs_tokyonight,
  cs_monokai
}
