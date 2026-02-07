return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        treesitter.install { 'java', 'c', 'lua', 'vim', 'vimdoc', 'html', 'yaml', 'rust', 'cpp', 'json', 'markdown', 'markdown_inline', 'csv' }

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'java', 'c', 'lua', 'vim', 'vimdoc', 'html', 'yaml', 'rust', 'cpp', 'json', 'markdown', 'markdown_inline', 'csv' },
            callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()
                -- folds, provided by Neovim
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'
                -- indentation, provided by nvim-treesitter
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
