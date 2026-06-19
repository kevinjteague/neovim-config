local M = {}

function M.setup()
    ---@diagnostic disable-next-line: missing-fields
    require("northsea").setup({
        styles = {
            comments = { italic = false },
        },
    })

    vim.cmd.colorscheme("north-sea")
end

return M
