local M = {}

local parsers = {
    'java', 'c', 'lua', 'vim', 'vimdoc',
    'html', 'yaml', 'rust', 'cpp', 'json',
    'markdown', 'markdown_inline', 'csv',
}

function M.setup()
    local treesitter = require('nvim-treesitter')
    treesitter.setup()
    -- Initial parser install. Subsequent installs on plugin update are
    -- handled by the PackChanged autocmd in pack-plugins.lua.
    treesitter.install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function()
            vim.treesitter.start()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end

return M
