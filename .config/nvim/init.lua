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

require("lazy").setup({
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
            })
            vim.cmd.colorscheme("rose-pine")
        end
    },
    {
        "ishan9299/modus-theme-vim",
        config = function()
            vim.g.modus_faint_syntax = 0
            vim.g.modus_yellow_comments = 0
            vim.g.modus_green_strings = 0
            vim.g.modus_dim_inactive_window = 0
            vim.g.modus_cursorline_intense = 0
            vim.g.modus_termtrans_enable = 0
            -- vim.cmd.colorscheme("modus-vivendi")
            -- vim.cmd.colorscheme("modus-vivendi")
        end
    },
    {
        "github/copilot.vim",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require('telescope').setup({})

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<C-f>", builtin.git_files, {})
            vim.keymap.set("n", "<C-b>", builtin.buffers, {})
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("grep > ") })
            end)
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
        end
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                position = "top",
                mode = "workspace_diagnostics",
                fold_open = "o",  -- icon used for open folds
                fold_closed = "c",  -- icon used for closed folds
            })
            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end)  -- toggles the Trouble panel to see the LSP's diagnostics
            vim.keymap.set("n", "<leader>tn", function()
                require("trouble").next({ skip_groups = true, jump = true })
            end)  -- goes to the next trouble
            vim.keymap.set("n", "<leader>tp", function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end)  -- goes to the next trouble
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {  -- list of parser names
                    "vimdoc", "c", "lua", "python", "rust", "latex", "bibtex", "markdown"
                },
                sync_install = false,  -- install parsers asynchronously
                auto_install = true,  -- auto install missing parsers when entering buffer

                indent = {
                    enable = true
                },

                highlight = {
                    enable = true,  -- false disables the whole extension
                    additional_vim_regex_highlighting = { "markdown" },
                    -- runs `:h syntax` and TS at the same time
                    -- the values to give here can be: false, true, or parser names
                },
            })
        end
    },
    {
        "NeogitOrg/neogit",
        config = function()
            local neogit = require("neogit")
            neogit.setup({})
            vim.keymap.set("n", "<leader>gs", neogit.open)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end
    },
    {
        "lervag/vimtex",
        config = function()
            vim.g.tex_flavor = "latex"
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_skim_sync = 1
            -- value 1 allows forward search after every successful compilation
            vim.g.vimtex_view_skim_activate = 1
            -- value 1 allows change focus to Skim after command `:VimtexView` is given
            vim.g.vimtex_quickfix_mode = 0
            vim.g.tex_conceal = "abdmg"
        end
    },






    -- whatever is needed for LSP-Zero
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
})

-- Mitigate netrw defaults
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true -- leave it before the colorscheme
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Set background
vim.opt.background = "dark"

-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Controls whether the current mode
vim.opt.showmode = true

-- Disable Modeline Magic altogether
-- Why? Security reason: prevent Vim from executing arbitrary code
vim.opt.modeline = false

-- Tabulations, spaces and indents rules
-- Show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- When indenting with ">", use 4 spaces width
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
vim.opt.colorcolumn = "100"

-- Set the format options
-- `q` enales automatic formatting of comments using `gq` command
-- `r` allows continuation of comments when pressing Enter
-- `n` automatically inserts a comment leader when using the `o` or `O` commands in Normal mode
-- `1` allows formatting of numbered lists
vim.opt.formatoptions = "qrn1"

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
vim.opt.spell = false
vim.opt.spelllang = 'en_us'

-- Keybindings
-- <CR> is a carrige return

-- Turn spelling off or on
vim.keymap.set("n", "<leader>sp", "<cmd>setlocal spell!<CR>", { silent = true })

-- Clear the search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>")

-- Show the list of open buffers (without Telescope)
vim.keymap.set("n", "<leader>o", "<cmd>ls<CR>")

-- Re-select the selected are after indenting and outdenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Explore files
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move a bunch a selected lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Apply `J` (append next line to current one with a space inbetween)
-- but the cursor does not go at the end of the appended text;
-- it remains where it was
vim.keymap.set("n", "J", "mzJ`z")

-- Make `C-d` and `C-u` keep the cursor at the center of the viewport
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep the search term at the center of the viewport
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

-- Formats a buffer using the attached (and optionally filtered) language server clients
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Show the virtual text from the lsp inline
vim.diagnostic.config({ virtual_text = true })







-- LSP Zero
local lsp = require("lsp-zero")

lsp.setup_servers({ "lua_ls", "pyright", "ruff_lsp", "rust_analyzer" })

-- Fix Undefined global "vim"
local lua_opts = lsp.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    mapping = {
        ["<C-p>"] = cmp_action.luasnip_jump_forward(),
        ["<C-n>"] = cmp_action.luasnip_jump_backward(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space"] = cmp.mapping.complete(),
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr) -- warning: keep client here
    local oopts = { buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, oopts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, oopts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, oopts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, oopts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, oopts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, oopts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, oopts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, oopts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, oopts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, oopts)
end)
