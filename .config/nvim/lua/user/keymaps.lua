local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<S-Left>", "<C-w>h", opts)
keymap("n", "<S-Down>", "<C-w>j", opts)
keymap("n", "<S-Up>", "<C-w>k", opts)
keymap("n", "<S-Right>", "<C-w>l", opts)
keymap("n", "<S-v>", ":vsplit<CR>",  opts)
keymap("n", "<S-s>", ":split<CR>",  opts)

-- Resize with arrows
keymap("n", "<A-h>", ":resize -2<CR>", opts)
keymap("n", "<A-l>", ":resize +2<CR>", opts)
keymap("n", "<A-j>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-k>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<C-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<C-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- File Navigator --
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope bindings
keymap("n", "\\s", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "\\g", "<cmd>Telescope lsp_definitions<CR>", opts)
keymap("n", "\\a", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "\\x", "<cmd>Telescope jumplist<CR>", opts)
keymap("n", "<S-f>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>f", "<cmd>Telescope live_grep<CR>", opts)

-- Portal bindings
keymap("n", "\\w", "<cmd>Portal jumplist forward<CR>", opts)
keymap("n", "\\q", "<cmd>Portal jumplist backward<CR>", opts)

-- Cscope bindings
keymap("n", "<]s>", [[<cmd>exe "Cscope find s" expand("<cword>")<CR>]], opts) -- find all references
keymap("n", "<]g>", [[<cmd>exe "Cscope find g" expand("<cword>")<CR>]], opts) -- find global definition
keymap("n", "<]t>", [[<cmd>exe "Cscope find t" expand("<cword>")<CR>]], opts) -- find string
keymap("n", "<]b>", "<cmd>Cscope build<CR>", opts) -- build cscope
