local vim = vim
local api = vim.api

local M = {}

function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command("augroup " .. group_name)
        api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            api.nvim_command(command)
        end
        api.nvim_command("augroup END")
    end
end

local autoCommands = {
    EasyQuit = {
        {"FileType", "help,qf,fugitive", "nnoremap <buffer> q :q<CR>"}
    },
    LuaYank = {
        {"TextYankPost", "*", "silent! lua require('vim.highlight').on_yank()"}
    },
    Styles = {
        {"VimEnter", "*", "++nested colorscheme enfocado"},
        -- {"VimEnter", "*", "hi Normal guibg=NONE ctermbg=NONE"},
        -- {"VimEnter", "*", "hi EndOfBuffer guibg=NONE ctermbg=NONE"}
    }
}

M.nvim_create_augroups(autoCommands)

return M
