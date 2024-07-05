return {
  "nvimtools/none-ls.nvim",
  conf = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
      }
    })

    vim.keymap.set('n', '<C-l>', vim.lsp.buf.format, {})
  end
}
