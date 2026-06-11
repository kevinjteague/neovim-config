local M = {}

function M.setup()
    require('oil').setup()
    vim.keymap.set('n', 'go', ':Oil<CR>')
end

return M
