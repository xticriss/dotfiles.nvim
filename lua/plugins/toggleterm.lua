return {
  { "akinsho/togglEterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[\]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 10,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = false,
      shell = vim.o.shell,
      highlights = {
        FloatBorder = {
          guifg = "#c591ff",
        }
      },
      float_opts = {
        border = "curved",
        winblend = 10,
        row = 30,
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.35)
        end,
      },
    },
  },
}
