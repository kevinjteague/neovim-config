local M = {}

function M.setup()
    local treesitter = require("tree-sitter-manager")
    treesitter.setup({ auto_install = true })

    -- Built-in Tree-sitter highlighting
    vim.cmd([[syntax enable]])

    -- Built-in Tree-sitter folding
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldlevel = 99
end

return M
