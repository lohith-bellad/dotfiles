-- This function contains your shared on_attach and capabilities settings
local lsp_handlers = require("user.lsp.handlers")

-- List of servers to configure. These will be automatically installed
-- by Mason and enabled by mason-lspconfig.
local servers = { "pyright", "lua_ls" } -- rust_analyzer is managed by rustaceanvim

-- Setup Mason
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

mason.setup()

-- Setup mason-lspconfig
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Setup each server using vim.lsp.config (new API)
for _, server in ipairs(servers) do
  local opts = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
  }

  -- Check if a custom options file exists and merge it
  local ok, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if ok then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  -- Apply the merged options using the new vim.lsp.config API
  vim.lsp.config[server] = opts
end