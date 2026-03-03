local status_ok, avante = pcall(require, "avante")
if not status_ok then
  return
end

avante.setup({
  mode = "legacy",
  windows = {
    width = 40,
  },
  mappings = {
    ask = "<leader>a",
    edit = "<leader>x",
    refresh = "<leader>r",
  },
})

