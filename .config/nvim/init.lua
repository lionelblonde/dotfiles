-- For help, type :help followed by the command.

-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader mapping
vim.g.mapleader = " "

local plugins = {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { {"nvim-lua/plenary.nvim"} },
  },
  "theprimeagen/harpoon",
  "numToStr/Comment.nvim",
  "mbbill/undotree",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  "RRethy/vim-illuminate",
  "lervag/vimtex",
  {
    "NLKNguyen/papercolor-theme",
    name = "papercolor",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine"
  },
  "wellle/context.vim",
  {
    "TimUntersberger/neogit", -- magit for neovim
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },
}
local opts = {}
require("lazy").setup(plugins, opts)
-- Lazy setup done


-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true -- leave it before the colorscheme

-- Set background
vim.o.background = "light"

-- Colorscheme
vim.cmd("colorscheme papercolor")

-- Controls whether the current mode
vim.opt.showmode = true

-- Disable Modeline Magic altogether
-- Why? Security reason: prevent Vim from executing arbitrary code
vim.opt.modeline = false

-- Tabulations, spaces and indents rules
-- Show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- When indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4
-- Sets the number of columns for a tab
vim.opt.softtabstop = 4
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true

-- Smarter case pattern matching in search
vim.opt.smartcase = true

-- Disable line wrapping
vim.opt.wrap = false

-- Set a ruler to indicate the X column
vim.opt.colorcolumn = '120'

-- Set the format options
-- `q` enales automatic formatting of comments using `gq` command
-- `r` allows continuation of comments when pressing Enter
-- `n` automatically inserts a comment leader when using the `o` or `O` commands in Normal mode
-- `1` allows formatting of numbered lists
vim.opt.formatoptions = 'qrn1'

-- Enable incremental search
vim.opt.incsearch = true
-- Enable highlighting of search matches as you type
vim.opt.hlsearch = true

-- Reduce the delay before search highlighting starts
vim.opt.updatetime = 50

-- Nicer behavior when splitting
-- Open new split windows below the current window
vim.opt.splitbelow = true
-- Open new split windows to the right of the current window
vim.opt.splitright = true

-- Make undo persistent across openings and closings of files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enable absolute line numbers
vim.opt.nu = true -- same as vim.opt.number
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Always leave X lines at the top above the current line
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- make `@` a valid char for file names

-- Set spell and spelllang options
vim.cmd('setlocal spell spelllang=en_us')
-- Toggle spell check
vim.cmd('setlocal spell!')

-- Force the bg to default to the terminal's bg
--vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE" })
--vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "NONE" })
--vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "NONE" })


-- Keybindings
-- <CR> is a carrige return

-- Turn spelling off or on
vim.keymap.set('n', '<leader>sp', ':setlocal spell!<CR>', { silent = true })

-- Clear the search highlighting
vim.keymap.set('n', '<leader>nh', ':noh<CR>')

-- Show the list of open buffers
vim.keymap.set('n', '<leader>o', ':ls<CR>')

-- Explore files
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- from theprimeagean, this one an below

-- Add black lines
vim.keymap.set('n', '<CR>', 'o<ESC>')
vim.keymap.set('n', '<S-CR>', 'O<ESC>')

-- Move a bunch a selected lines around
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Apply `J` (append next line to current one with a space inbetween)
-- but the cursor does not go at the end of the appended text;
-- it remains where it was
vim.keymap.set('n', 'J', "mzJ`z")

-- Make `C-d` and `C-u` keep the cursor at the center of the viewport
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the search term at the cente of the viewport
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When pasting over something, puts the overwritten thing into the void buffer
-- so that the copied text remains in the register and can be pasted again and again
-- this truly is the greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Puts the yanked text into the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- Puts the yanked lines of text into the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Puts the deleted text into the void register to be forgotten forever
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Ban capital `Q`
vim.keymap.set("n", "Q", "<nop>")

-- Not used yet, but prime keymap to use
-- vim.keymap.set("n", "<C-f>", "")

-- Formats a buffer using the attached (and optionally filtered) language server clients
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Location list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Edit all the occurrence of the word the cursor was on in the buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable (from within!)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Edit the config without leaving neovim
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/Documents/.dotfiles/nvim/.config/nvim/init.lua<CR>");

-- Pressing the leader key twice sources the current file (mnemotechnics: "shout out")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)


-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


-- Treesitter
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "python", "rust", "latex", "bibtex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})


-- Open or close the tree. Takes an optional path argument.
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { silent = true })
-- Move the cursor in the tree for the current buffer, opening folders if needed.
vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { silent = true })


-- Neogit
local neogit = require("neogit")
vim.keymap.set('n', '<leader>gs', neogit.open)


-- LSP Zero
local lsp = require("lsp-zero").preset({})

lsp.setup_servers({ "lua_ls", "pyright", "rust_analyzer" })

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
  mapping = {
    ['<C-p>'] = cmp_action.luasnip_jump_forward(),
    ['<C-n>'] = cmp_action.luasnip_jump_backward(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space'] = cmp.mapping.complete(),
  }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

vim.diagnostic.config({
  virtual_text = true
})


-- Comment
require("Comment").setup()

-- VimTeX
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_sync = 1 -- value 1 allows forward search after every successful compilation
vim.g.vimtex_view_skim_activate = 1 -- value 1 allows change focus to skim after command `:VimtexView` is given
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"

