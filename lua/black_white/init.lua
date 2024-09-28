local M = {}

--- @class BWConfig
M.config = {
    cursorline = vim.o.cursorline,
    transparent_background = false,
    nvim_tree_darker = false,
    treesitter_context_underline = false,
    undercurl = true,
    italic_string = false,
    italic_keyword = false,
    italic_type = {
        normal = false,
        builtin = false,
        definition = false,
    },
    italic_constant = {
        builtin = false,
    },
    italic_function = {
        declaration = false,
        call = false,
        method = {
            declaration = false,
            call = false,
        },
    },
    custom_dark_background = nil,
    custom_light_background = nil,
    custom_statusline_dark_background = nil,
}

--- @param theme_dark BWThemeDark
--- @param theme_light BWThemeLight
--- @return string
local function generate_lines(theme_dark, theme_light)
    local lines = {
        string.format [[return string.dump(function()
vim.cmd.highlight('clear')
vim.g.colors_name="black_white"
local h=vim.api.nvim_set_hl
vim.opt.termguicolors=true]],
    }

    table.insert(lines, 'if vim.o.background == \'dark\' then')
    local hgs_dark = require('black_white.hlgroups').get(theme_dark)
    for group, color in pairs(hgs_dark) do
        table.insert(
            lines,
            string.format(
                [[h(0,"%s",%s)]],
                group,
                vim.inspect(color, { newline = '', indent = '' })
            )
        )
    end

    table.insert(lines, 'else')

    local hgs_light = require('black_white.hlgroups').get(theme_light)
    for group, color in pairs(hgs_light) do
        table.insert(
            lines,
            string.format(
                [[h(0,"%s",%s)]],
                group,
                vim.inspect(color, { newline = '', indent = '' })
            )
        )
    end
    table.insert(lines, 'end')

    table.insert(lines, 'end,true)')

    return table.concat(lines, '\n')
end

--- @overload fun(config?: BWConfig)
function M.setup(config)
    M.config = vim.tbl_deep_extend('force', M.config, config or {})
end

--- @param theme_dark BWThemeDark
--- @param theme_light BWThemeLight
function M.compile(theme_dark, theme_light)
    local bw_cache_dir = vim.fn.stdpath 'cache' .. '/black_white/'

    if vim.fn.isdirectory(bw_cache_dir) == 0 then
        vim.fn.mkdir(bw_cache_dir, 'p')
    end

    local concataned_lines = generate_lines(theme_dark, theme_light)
    local f = loadstring(concataned_lines)
    if not f then
        local path_debug_file = vim.fn.stdpath 'state'
            .. '/black_white-debug.lua'

        local msg = string.format(
            '[black_white.nvim] error, open %s for debugging',
            path_debug_file
        )
        vim.notify(msg, vim.log.levels.ERROR)

        local debug_file = io.open(path_debug_file, 'wb')
        if debug_file then
            debug_file:write(concataned_lines)
            debug_file:close()
        end
        return
    end

    local file = io.open(bw_cache_dir .. '/cache', 'wb')
    if file then
        file:write(f())
        file:close()
    else
        vim.notify(
            '[black_white.nvim] error trying to open cache file',
            vim.log.levels.ERROR
        )
    end
end

local function compile_if_not_exist()
    local compiled = vim.fn.stdpath 'cache' .. '/black_white/cache'
    if vim.fn.filereadable(compiled) == 0 then
        local palette_dark = require 'black_white.palette.dark'
        local theme_dark =
            require('black_white.themes').dark(palette_dark, M.config)

        local palette_light = require 'black_white.palette.light'
        local theme_light =
            require('black_white.themes').light(palette_light, M.config)

        M.compile(theme_dark, theme_light)
    end
end

function M.load()
    compile_if_not_exist()

    local cache = vim.fn.stdpath 'cache' .. '/black_white/cache'
    local f = loadfile(cache)
    if f ~= nil then
        f()
    else
        vim.notify(
            '[black_white.nvim] error trying to load cache file',
            vim.log.levels.ERROR
        )
    end
end

vim.api.nvim_create_user_command('BlackWhiteCompile', function()
    local palette_dark = require 'black_white.palette.dark'
    local theme_dark = require('black_white.themes').dark(palette_dark, M.config)

    local palette_light = require 'black_white.palette.light'
    local theme_light = require('black_white.themes').light(palette_light, M.config)

    M.compile(theme_dark, theme_light)

    vim.notify('[black_white.nvim] colorscheme compiled', vim.log.levels.INFO)
    vim.cmd.colorscheme 'black_white'
end, {})

--- @param theme_dark BWThemeDark
--- @param theme_light BWThemeLight
--- @param path string
function M.generate_colorscheme_file(theme_dark, theme_light, path)
    local concataned_lines = generate_lines(theme_dark, theme_light)

    local file = io.open(path, 'wb')
    if file then
        file:write(concataned_lines)
        file:close()
    else
        vim.notify(
            '[black_white.nvim] error trying to generate colorscheme file',
            vim.log.levels.ERROR
        )
    end
end

vim.api.nvim_create_user_command('BlackWhiteColorschemeFile', function()
    local palette_dark = require 'black_white.palette.dark'
    local theme_dark = require('black_white.themes').dark(palette_dark, M.config)

    local palette_light = require 'black_white.palette.light'
    local theme_light = require('black_white.themes').light(palette_light, M.config)

    local bw_state_dir = vim.fn.stdpath 'state' .. '/black_white'
    if vim.fn.isdirectory(bw_state_dir) == 0 then
        vim.fn.mkdir(bw_state_dir, 'p')
    end

    local path = bw_state_dir .. '/black_white.lua'
    M.generate_colorscheme_file(theme_dark, theme_light, path)

    local msg = string.format('[black_white.nvim] colorscheme file generated at %s', path)
    vim.notify(msg, vim.log.levels.INFO)
end, {})

return M
