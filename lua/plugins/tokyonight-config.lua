local M = {}

function M.setup()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup({
        styles = {
            comments = { italic = false },
        },
    })

    vim.cmd.colorscheme('tokyonight-night')
end

return M
