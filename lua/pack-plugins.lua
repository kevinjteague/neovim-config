local PackPlugins = {}

function PackPlugins.setup()
    -- [[ Install and load plugins via vim.pack ]]
    -- Requires Neovim 0.12+. See `:h vim.pack` for full documentation.
    --
    -- vim.pack.add() installs any missing plugins (with a confirmation prompt)
    -- and loads all listed plugins. On first run, press:
    --   y  - confirm this install
    --   a  - allow all installs in this session
    --   n  - skip
    --
    -- To update plugins: run  :vim.pack.update()  or the Ex command  :Pack update
    -- To delete a plugin: remove it from this list, then  :Pack clean

    vim.pack.add({
        -- Git signs in the gutter
        "https://github.com/lewis6991/gitsigns.nvim",

        -- Show pending keybinds
        "https://github.com/folke/which-key.nvim",

        -- Fuzzy finder
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-telescope/telescope.nvim",
        {
            src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: Requires `make` to be available. After first install run:
            --   :lua vim.system({'make'}, { cwd = vim.fn.stdpath('data') .. '/site/pack/core/opt/telescope-fzf-native.nvim' }):wait()
        },
        "https://github.com/nvim-telescope/telescope-ui-select.nvim",
        "https://github.com/nvim-tree/nvim-web-devicons",

        -- LSP & tooling
        "https://github.com/folke/lazydev.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/mason-org/mason-lspconfig.nvim",
        "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
        "https://github.com/j-hui/fidget.nvim",

        -- Autocompletion + snippets
        "https://github.com/saghen/blink.lib", -- required by blink.cmp v2+
        "https://github.com/saghen/blink.cmp",
        {
            src = "https://github.com/L3MON4D3/LuaSnip",
            -- NOTE: For regex snippet support, build jsregexp after first install:
            --   :lua vim.system({'make', 'install_jsregexp'}, { cwd = vim.fn.stdpath('data') .. '/site/pack/core/opt/LuaSnip' }):wait()
        },

        -- Autoformatting
        "https://github.com/stevearc/conform.nvim",

        -- Colorscheme
        { src = "https://github.com/terkelg/north-sea.nvim", name = "north-sea" },

        -- Highlight todo/fixme/etc in comments
        "https://github.com/folke/todo-comments.nvim",

        -- File system explorer
        "https://github.com/stevearc/oil.nvim",

        -- Collection of small independent modules (ai, surround, pairs, statusline, icons)
        "https://github.com/echasnovski/mini.nvim",

        -- Syntax highlighting and more via tree-sitter
        "https://github.com/nvim-treesitter/nvim-treesitter",

        -- Indentation guides
        "https://github.com/lukas-reineke/indent-blankline.nvim",

        -- Debugging
        "https://github.com/mfussenegger/nvim-dap.git",
        { src = "https://github.com/igorlfs/nvim-dap-view", version = vim.version.range("1.*") },

        -- Rust convenience
        "https://github.com/mrcjkb/rustaceanvim.git",
    })

    -- Re-run treesitter parser install whenever plugins change
    -- (replaces lazy.nvim's  build = ':TSUpdate')
    vim.api.nvim_create_autocmd("PackChanged", {
        desc = "Update treesitter parsers after plugin changes",
        once = true,
        callback = function()
            local ts = require("nvim-treesitter")
            ts.install({
                "java",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "html",
                "yaml",
                "rust",
                "cpp",
                "json",
                "markdown",
                "markdown_inline",
                "csv",
            })
        end,
    })

    -- [[ Configure plugins ]]
    -- Each plugin's setup is called immediately after vim.pack.add() has loaded
    -- everything, so all modules are available here.

    require("plugins.gitsigns-config").setup()
    require("plugins.which-key-config").setup()
    require("plugins.telescope-config").setup()
    require("plugins.lazydev-config").setup()
    require("plugins.lspconfig-config").setup()
    require("plugins.conform-config").setup()
    require("plugins.blink-cmp-config").setup()
    require("plugins.todo-comments-config").setup()
    require("plugins.oil-config").setup()
    require("plugins.mini-config").setup()
    require("plugins.nvim-treesitter-config").setup()
    require("plugins.indent-line-config").setup()
    require("plugins.northsea-config").setup()
    require("plugins.dap-config").setup()
end

return PackPlugins
