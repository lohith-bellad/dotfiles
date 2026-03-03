local lsp_handlers = require("user.lsp.handlers")

vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
  server = {
    on_attach = function(client, bufnr)
      lsp_handlers.on_attach(client, bufnr)

      -- Rust-specific keymaps
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", opts)
      vim.keymap.set("n", "<leader>rt", "<cmd>RustLsp testables<CR>", opts)
      vim.keymap.set("n", "<leader>rm", "<cmd>RustLsp expandMacro<CR>", opts)
      vim.keymap.set("n", "<leader>rc", "<cmd>RustLsp openCargo<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)
    end,
    capabilities = lsp_handlers.capabilities,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "self",
        },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
