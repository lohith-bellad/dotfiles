local dap_ok, dap = pcall(require, "dap")
if not dap_ok then return end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then return end

-- Auto-install codelldb via mason-nvim-dap
local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if mason_dap_ok then
  mason_dap.setup({
    ensure_installed = { "codelldb" },
    automatic_installation = true,
  })
end

-- Setup dap-ui
dapui.setup()

-- Auto open/close dap-ui with debug sessions
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- codelldb adapter (installed via mason)
local mason_path = vim.fn.stdpath("data") .. "/mason"
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "/bin/codelldb",
    args = { "--port", "${port}" },
  },
}

-- Rust debug configuration
dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F5>",      dap.continue,          opts)
vim.keymap.set("n", "<F10>",     dap.step_over,         opts)
vim.keymap.set("n", "<F11>",     dap.step_into,         opts)
vim.keymap.set("n", "<F12>",     dap.step_out,          opts)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, opts)
vim.keymap.set("n", "<leader>du", dapui.toggle, opts)
