R = function(name)
    RELOAD(name)
    return require(name)
end

P = function(v)
    print(vim.inspect(v))
    return v
end

-- Basic configuration
require("opts") -- Global, Window and Buffer configuration options
require("maps") -- Normal, Insert, Visual, Terminal mode mappings
require("autocmds") -- Autocmds

-- Advanced configuration
require("plugins") -- Pack plugins
require("advanced") -- Pack plugins configuration

-- Need to be migrated to lua <3
vim.cmd("source ~/.vim_runtime/vimrcs/unmigratable.vim")
