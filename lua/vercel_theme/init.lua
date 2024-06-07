local M = {}

--- @class Config
M.config = {
    cursorline = vim.o.cursorline,
    transparent_background = false,
    nvim_tree_lighter = false,
}

--- @overload fun(config?: Config)
function M.setup(config)
    M.config = vim.tbl_deep_extend('force', M.config, config or {})
end

--- @param theme ThemeDark | ThemeLight
--- @param background 'dark' | 'light'
function M.compile(theme, background)
    local lines = {
        string.format(
            [[
return string.dump(function()
vim.o.termguicolors=true
if vim.g.colors_name then vim.cmd "hi clear" end
vim.g.colors_name="vercel_theme"
vim.o.background="%s"
local h=vim.api.nvim_set_hl]],
            background
        ),
    }

    local hgs = require('vercel_theme.hlgroups').get(theme)
    for group, color in pairs(hgs) do
        table.insert(
            lines,
            string.format(
                [[h(0,"%s",%s)]],
                group,
                vim.inspect(color, { newline = '', indent = '' })
            )
        )
    end
    table.insert(lines, 'end,true)')

    local vercel_theme_cache_dir = vim.fn.stdpath 'cache' .. '/vercel_theme/'

    if vim.fn.isdirectory(vercel_theme_cache_dir) == 0 then
        vim.fn.mkdir(vercel_theme_cache_dir, 'p')
    end

    local f = loadstring(table.concat(lines, '\n'))
    if not f then
        local path_debug_file = vim.fn.stdpath 'state'
            .. '/vercel_theme-debug.lua'

        local msg = string.format(
            '[vercel_theme.nvim] error, open %s for debugging',
            path_debug_file
        )
        vim.notify(msg, vim.log.levels.ERROR)

        local debug_file = io.open(path_debug_file, 'wb')
        if debug_file then
            debug_file:write(table.concat(lines, '\n'))
            debug_file:close()
        end
        return
    end

    local file = io.open(vercel_theme_cache_dir .. background, 'wb')
    if file then
        file:write(f())
        file:close()
    else
        vim.notify(
            '[vercel_theme.nvim] error trying to open cache file',
            vim.log.levels.ERROR
        )
    end
end

--- @param background 'dark'|'light'
local function compile_if_not_exist(background)
    local compiled = vim.fn.stdpath 'cache' .. '/vercel_theme/' .. background
    if vim.fn.filereadable(compiled) == 0 then
        local palette = require('vercel_theme.palette.' .. background)
        local theme =
            require('vercel_theme.themes')[background](palette, M.config)
        M.compile(theme, background)
    end
end

function M.load()
    compile_if_not_exist 'dark'
    compile_if_not_exist 'light'

    local cache = vim.fn.stdpath 'cache' .. '/vercel_theme/' .. vim.o.background
    local f = loadfile(cache)
    if f ~= nil then
        f()
    else
        vim.notify(
            '[vercel_theme.nvim] error trying to load cache file',
            vim.log.levels.ERROR
        )
    end
end

vim.api.nvim_create_user_command('VercelThemeCompile', function()
    local dark_palette = require 'vercel_theme.palette.dark'
    local dark_theme =
        require('vercel_theme.themes').dark(dark_palette, M.config)
    M.compile(dark_theme, 'dark')

    local light_palette = require 'vercel_theme.palette.light'
    local light_theme =
        require('vercel_theme.themes').light(light_palette, M.config)
    M.compile(light_theme, 'light')

    vim.notify('[vercel_theme.nvim] colorscheme compiled', vim.log.levels.INFO)
    vim.cmd.colorscheme 'vercel_theme'
end, {})

return M
