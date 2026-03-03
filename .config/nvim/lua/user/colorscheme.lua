vim.g.gruvbox_material_foreground = "material"  -- "material" (default), "mix", or "original"
local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.cmd [[colorscheme default]]
  vim.notify("colorscheme " .. colorscheme .. " not found! going with default")
  return
end
