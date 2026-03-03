local status_ok, claudecode = pcall(require, "claudecode")
if not status_ok then
  return
end

claudecode.setup({
  -- Terminal command to run Claude Code
  terminal_cmd = "/usr/local/bin/claude",

  -- Auto-start Claude Code when Neovim starts
  auto_start = false,

  -- Key mappings for Claude Code integration
  keymaps = {
    -- Open Claude Code terminal
    open = "<leader>cc",
    -- Send current file to Claude Code
    send_file = "<leader>cf",
    -- Send selected text to Claude Code
    send_selection = "<leader>cs",
    -- Toggle Claude Code terminal
    toggle = "<leader>ct",
  },

  -- Terminal configuration
  terminal = {
    split_side = "right", -- "left" or "right"
    split_width_percentage = 0.40,
    -- Terminal size (percentage of screen)
    -- size = 0.9,
    -- Terminal direction: 'horizontal', 'vertical', 'float'
    -- direction = "float",
    -- Close terminal on process exit
    --close_on_exit = false,
    -- Start in insert mode
    --start_in_insert = true,
  },

  -- Integration settings
  integration = {
    -- Send current working directory to Claude Code
    send_cwd = true,
    -- Send git repository info
    send_git_info = true,
    -- Auto-send file changes
    auto_send_changes = false,
  },
})
