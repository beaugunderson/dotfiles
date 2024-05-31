local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  -- For installing LSP servers, linters, etc.
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Debug adapter support
  "mfussenegger/nvim-dap",

  -- CellularAutomation make_it_rain
  "eandrju/cellular-automaton.nvim",

  -- Make lua support neovim-aware
  "folke/neodev.nvim",

  -- LSP configs + nvim-cmp for completions
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "hrsh7th/vim-vsnip",

  -- bottom right area for LSP progress
  "j-hui/fidget.nvim",

  -- Fastest statusline
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Deprecated: Create colorgroups for colorschemes that are missing the LSP ones
  "folke/lsp-colors.nvim",

  -- "A pretty list for showing diagnostics, references, telescope results, quickfix and location lists"
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Adds format on save
  "mhartington/formatter.nvim",

  -- "Super fast git decorations implemented purely in Lua."
  "lewis6991/gitsigns.nvim",

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- JavaScript/HTML plugins
  { "elzr/vim-json", ft = "json" },
  { "GutenYe/json5.vim", ft = "json" },

  -- adds auto-closing tags to e.g. tsx, html
  "windwp/nvim-ts-autotag",

  -- Other filetypes
  { "TovarishFin/vim-solidity", ft = "solidity" },
  { "cakebaker/scss-syntax.vim", ft = "scss" },
  { "ekalinin/Dockerfile.vim", ft = "dockerfile" },
  { "fatih/vim-go", ft = "go" },
  { "gabrielelana/vim-markdown", ft = "markdown" },
  { "https://gitlab.com/Nate_B/vim-adif", ft = "adif" },
  { "syngan/vim-vimlint", ft = "vim" },
  { "ynkdir/vim-vimlparser", ft = "vim" },

  -- Other plugins
  "junegunn/fzf.vim", -- fzf integration
  "junegunn/vim-slash", -- improve search
  "kopischke/vim-fetch", -- support `vim file.js:50`
  "norcalli/nvim-colorizer.lua", -- colorize hex strings in files
  "tpope/vim-characterize", -- add more output to `ga`
  "tpope/vim-eunuch", -- adds :SudoWrite, :Move, etc.
  {
    "tpope/vim-fugitive", -- git support, e.g. :Git blame
    dependencies = {
      "tpope/vim-rhubarb", -- extends vim-fugitive for github
    },
  },
  -- "tpope/vim-repeat", -- make plugin actions repeatable
  "tpope/vim-surround", -- adds mappings for surrounding text
  -- "tpope/vim-unimpaired", -- adds missing mappings
  "tpope/vim-vinegar", -- better file navigator
  "tweekmonster/startuptime.vim", -- StartupTime command for benchmarking
  "wakatime/vim-wakatime", -- log editing activity to wakatime.com
  "wincent/terminus", -- iTerm niceties (focus, mouse, cursor, paste)
  "zirrostig/vim-schlepp", -- shift-up/down for moving lines
})

vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config({
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  })
end, { desc = "toggle diagnostic" })

-- TODO remove some of the unused sections
require("lualine").setup({})

require("fidget").setup({})

-- TODO this has additional options for CSS functions, rgb(), etc. if needed
require("colorizer").setup()

require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require("mason").setup()
require("mason-lspconfig").setup()

require("gitsigns").setup()

local function on_attach()
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = require("lspconfig/util").find_git_ancestor,
    })
  end,
  ["eslint"] = function()
    require("lspconfig")["eslint"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = require("lspconfig/util").find_json_ancestor,
    })
  end,
  ["pylsp"] = function()
    require("lspconfig")["pylsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = require("lspconfig/util").find_json_ancestor,
      settings = {
        pylsp = {
          configurationSources = { "flake8" },
          plugins = {
            pycodestyle = { maxLineLength = 99 },
          },
        },
      },
    })
  end,
})

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- vim.keymap.set('n', ',e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', ',q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),

  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set("n", ",D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", ",rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", ",a", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "]]", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "[[", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", ",f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    javascript = { require("formatter.filetypes.javascript").eslint_d },
    typescript = { require("formatter.filetypes.typescript").eslint_d },
    ["javascript.jsx"] = { require("formatter.filetypes.javascript").eslint_d },
    ["typescript.jsx"] = { require("formatter.filetypes.typescript").eslint_d },
    typescriptreact = { require("formatter.filetypes.typescript").eslint_d },
    sql = { require("formatter.filetypes.sql").pgformat },
    lua = { require("formatter.filetypes.lua").stylua },

    ["python"] = {
      function()
        return {
          exe = "black",
          args = { "-q", "-l", "100", "-" },
          stdin = true,
        }
      end,
    },

    ["*"] = {
      function()
        return { exe = "sed", args = { "-i", "''", "'s/[	 ]*$//'" } }
      end,
    },
  },
})

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})

-- vim.builtin.treesitter.autotag.enable = true

-- require('nvim-ts-autotag').setup()
