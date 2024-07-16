--- @class Themes
local themes = {
    --- @param palette PaletteDark
    --- @param config Config
    --- @return ThemeDark
    dark = function(palette, config)
        local main = {
            bg = palette.bg_300,
            fg = palette.gray_1000,
        }

        if config.transparent_background then
            main.bg = palette.none
        end

        --- @class ThemeDark
        local theme = {
            bg = main.bg,
            fg = main.fg,
            editor = {
                color_column = {
                    bg = palette.bg_100,
                },
                conceal = {
                    fg = palette.bg_100,
                },
                cursor = {
                    bg = main.fg,
                    fg = main.bg,
                    search = {
                        bg = palette.amber_500,
                    },
                    column = {
                        bg = palette.bg_100,
                    },
                    line = {
                        bg = config.cursorline and palette.gray_100
                            or palette.none,
                        nr = {
                            bg = config.cursorline and palette.gray_100
                                or main.bg,
                            fg = main.fg,
                        },
                    },
                },
                match_paren = {
                    bg = palette.bg_100,
                },
                directory = {
                    fg = palette.gray_900,
                },
                diff = {
                    add = {
                        bg = palette.green_300,
                    },
                    change = {
                        bg = palette.amber_300,
                    },
                    delete = {
                        bg = palette.red_300,
                    },
                    text = {
                        bg = palette.green_300,
                    },
                },
                folded = {
                    bg = palette.bg_100,
                },
                line_nr = {
                    bg = main.bg,
                    fg = palette.gray_500,
                },
                msg = {
                    error = {
                        fg = palette.red_900,
                    },
                    mode = {
                        fg = palette.green_900,
                    },
                    warning = {
                        fg = palette.amber_900,
                    },
                },
                non_text = {
                    fg = palette.gray_900,
                },
                float = {
                    bg = main.bg,
                    border = {
                        bg = main.bg,
                        fg = palette.gray_500,
                    },
                },
                pmenu = {
                    bg = palette.gray_100,
                    fg = palette.gray_600,
                    sel = {
                        bg = palette.gray_300,
                        fg = palette.gray_600,
                    },
                    sbar = {
                        bg = palette.gray_400,
                    },
                    thumb = {
                        bg = palette.gray_500,
                    },
                },
                search = {
                    bg = palette.amber_500,
                },
                spell = {
                    bad = {
                        fg = palette.red_900,
                    },
                    cap = {
                        fg = palette.amber_900,
                    },
                    local_ = {
                        fg = palette.green_900,
                    },
                    rare = {
                        fg = palette.blue_900,
                    },
                },
                status_line = {
                    bg = palette.bg_100,
                    fg = palette.gray_900,
                    medium = {
                        bg = palette.bg_200,
                        fg = palette.gray_900,
                        git = {
                            added = {
                                fg = palette.green_900,
                            },
                            changed = {
                                fg = palette.amber_900,
                            },
                            removed = {
                                fg = palette.red_900,
                            },
                        },
                    },
                    mode = {
                        bg = palette.blue_900,
                        fg = palette.bg_100,
                    },
                    lsp = {
                        active = {
                            fg = palette.green_900,
                        },
                    },
                    icon = {
                        git = {
                            fg = palette.amber_800,
                        },
                        unsaved = {
                            fg = palette.amber_900,
                        },
                    },
                },
                title = {
                    fg = palette.gray_1000,
                },
                visual = {
                    bg = palette.blue_300,
                },
                win = {
                    separator = {
                        bg = main.bg,
                        fg = palette.gray_400,
                    },
                },
            },
            syntax = {
                comment = {
                    fg = palette.gray_900,
                },
                constant = {
                    fg = palette.blue_900,
                    builtin = {
                        fg = palette.blue_900,
                    },
                    italic = {
                        builtin = config.italic_constant.builtin,
                    },
                },
                string = {
                    fg = palette.green_900,
                    italic = config.italic_string,
                },
                character = {
                    fg = palette.green_900,
                },
                number = {
                    fg = palette.blue_900,
                },
                boolean = {
                    fg = palette.blue_900,
                },
                identifier = {
                    fg = palette.gray_1000,
                },
                function_ = {
                    fg = palette.purple_900,
                    italic = {
                        declaration = config.italic_function.declaration,
                        call = config.italic_function.call,
                        method = {
                            declaration = config.italic_function.method.declaration,
                            call = config.italic_function.method.call,
                        },
                    },
                },
                keyword = {
                    fg = palette.pink_900,
                    italic = config.italic_keyword,
                },
                operator = {
                    fg = palette.pink_900,
                },
                type = {
                    fg = palette.teal_900,
                    builtin = {
                        fg = palette.blue_900,
                    },
                    italic = {
                        normal = config.italic_type.normal,
                        builtin = config.italic_type.builtin,
                        definition = config.italic_type.definition,
                    },
                },
                special = {
                    fg = palette.pink_900,
                },
                delimiter = {
                    fg = palette.gray_900,
                },
                underlined = {
                    underline = true,
                },
                error = {
                    bg = palette.red_900,
                },
                todo = {
                    bg = palette.pink_900,
                },
                added = {
                    fg = palette.green_900,
                    bg = palette.green_900,
                },
                changed = {
                    fg = palette.amber_900,
                    bg = palette.amber_900,
                },
                removed = {
                    fg = palette.red_900,
                    bg = palette.red_900,
                },
            },
            git = {
                added = {
                    fg = palette.green_900,
                    inline = {
                        bg = palette.green_500,
                    },
                },
                changed = {
                    fg = palette.amber_900,
                    inline = {
                        bg = palette.amber_500,
                    },
                },
                removed = {
                    fg = palette.red_900,
                    inline = {
                        bg = palette.red_500,
                    },
                },
            },
            treesitter = {
                tag = {
                    delimiter = {
                        fg = palette.gray_1000,
                    },
                },
                context = {
                    bg = config.treesitter_context_underline and palette.none
                        or palette.gray_400,
                    line_number = {
                        bg = config.treesitter_context_underline
                                and palette.none
                            or palette.gray_400,
                    },
                    bottom = {
                        underline = config.treesitter_context_underline,
                        sp = palette.gray_400,
                    },
                },
            },
            lsp = {
                reference = {
                    text = {
                        bg = palette.gray_300,
                    },
                    read = {
                        bg = palette.gray_300,
                    },
                    write = {
                        bg = palette.gray_300,
                    },
                },
                inlay_hint = {
                    bg = palette.bg_100,
                    fg = palette.gray_600,
                },
            },
            diagnostic = {
                error = {
                    fg = palette.red_900,
                },
                warn = {
                    fg = palette.amber_900,
                },
                info = {
                    fg = palette.blue_900,
                },
                hint = {
                    fg = palette.teal_900,
                },
                ok = {
                    fg = palette.green_900,
                },
                unnecessary = {
                    fg = palette.gray_900,
                },
            },
            nvim_tree = {
                normal = {
                    bg = main.bg,
                    fg = palette.gray_900,
                },
                win_separator = {
                    bg = main.bg,
                    -- fg = main.bg,
                    fg = palette.gray_400,
                },
                folder = {
                    icon = {
                        fg = palette.amber_600,
                    },
                },
                root_folder = {
                    fg = palette.gray_1000,
                },
                git = {
                    deleted = {
                        fg = palette.red_600,
                    },
                    dirty = {
                        fg = palette.amber_600,
                    },
                    new = {
                        fg = palette.amber_600,
                    },
                    ignored = {
                        fg = palette.gray_600,
                    },
                    staged = {
                        fg = palette.green_600,
                    },
                },
                exec_file = {
                    fg = palette.green_900,
                },
            },
            cmp_item = {
                abbr = {
                    fg = palette.gray_900,
                },
                kind = {

                    fg = palette.gray_900,
                },
            },
            fzf = {
                normal = {
                    bg = palette.bg_100,
                },
                border = {
                    bg = palette.bg_100,
                    fg = palette.bg_100,
                },
                preview = {
                    normal = {
                        bg = main.bg,
                    },
                },
            },
            grapple = {
                normal = {
                    bg = palette.bg_100,
                },
                border = {
                    bg = palette.bg_100,
                    fg = palette.bg_100,
                },
                title = {
                    bg = palette.green_900,
                    fg = palette.bg_100,
                },
                footer = {
                    bg = palette.bg_100,
                    fg = palette.gray_900,
                },
            },
            mini = {
                indentscope = {
                    fg = palette.gray_400,
                },
            },
        }

        return theme
    end,
    --- @param palette PaletteLight
    --- @param config Config
    --- @return ThemeLight
    light = function(palette, config)
        local main = {
            bg = palette.bg_100,
            fg = palette.gray_1000,
        }

        if config.transparent_background then
            main.bg = 'NONE'
        end

        --- @class ThemeLight
        local theme = {
            bg = main.bg,
            fg = main.fg,
            editor = {
                color_column = {
                    bg = palette.bg_200,
                },
                conceal = {
                    fg = palette.gray_900,
                },
                cursor = {
                    bg = main.fg,
                    fg = main.bg,
                    search = {
                        bg = palette.amber_500,
                    },
                    column = {
                        bg = palette.bg_200,
                    },
                    line = {
                        bg = config.cursorline and palette.gray_200
                            or palette.none,
                        nr = {
                            bg = config.cursorline and palette.gray_200
                                or main.bg,
                            fg = main.fg,
                        },
                    },
                },
                match_paren = {
                    bg = palette.bg_200,
                },
                directory = {
                    fg = palette.gray_900,
                },
                diff = {
                    add = {
                        bg = palette.green_300,
                    },
                    change = {
                        bg = palette.amber_300,
                    },
                    delete = {
                        bg = palette.red_300,
                    },
                    text = {
                        bg = palette.green_300,
                    },
                },
                folded = {
                    bg = palette.bg_200,
                },
                line_nr = {
                    bg = main.bg,
                    fg = palette.gray_600,
                },
                msg = {
                    error = {
                        fg = palette.red_900,
                    },
                    mode = {
                        fg = palette.green_900,
                    },
                    warning = {
                        fg = palette.amber_700,
                    },
                },
                non_text = {
                    fg = palette.gray_900,
                },
                float = {
                    bg = main.bg,
                    border = {
                        bg = main.bg,
                        fg = palette.gray_600,
                    },
                },
                pmenu = {
                    bg = palette.gray_100,
                    fg = palette.gray_600,
                    sel = {
                        bg = palette.gray_300,
                        fg = palette.gray_600,
                    },
                    sbar = {
                        bg = palette.gray_400,
                    },
                    thumb = {
                        bg = palette.gray_500,
                    },
                },
                search = {
                    bg = palette.amber_500,
                },
                spell = {
                    bad = {
                        fg = palette.red_900,
                    },
                    cap = {
                        fg = palette.amber_900,
                    },
                    local_ = {
                        fg = palette.green_900,
                    },
                    rare = {
                        fg = palette.blue_900,
                    },
                },
                status_line = {
                    bg = palette.gray_500,
                    fg = palette.gray_1000,
                    medium = {
                        bg = palette.bg_300,
                        fg = palette.gray_1000,
                        git = {
                            added = {
                                fg = palette.green_900,
                            },
                            changed = {
                                fg = palette.amber_900,
                            },
                            removed = {
                                fg = palette.red_900,
                            },
                        },
                    },
                    mode = {
                        bg = palette.blue_900,
                        fg = palette.gray_500,
                    },
                    lsp = {
                        active = {
                            fg = palette.green_900,
                        },
                    },
                    icon = {
                        git = {
                            fg = palette.amber_800,
                        },
                        unsaved = {
                            fg = palette.amber_900,
                        },
                    },
                },
                title = {
                    fg = palette.gray_1000,
                },
                visual = {
                    bg = palette.blue_300,
                },
                win = {
                    separator = {
                        bg = main.bg,
                        fg = palette.gray_900,
                    },
                },
            },
            syntax = {
                comment = {
                    fg = palette.gray_900,
                },
                constant = {
                    fg = palette.blue_900,
                    builtin = {
                        fg = palette.blue_900,
                    },
                    italic = {
                        builtin = config.italic_constant.builtin,
                    },
                },
                string = {
                    fg = palette.green_900,
                    italic = config.italic_string,
                },
                character = {
                    fg = palette.green_900,
                },
                number = {
                    fg = palette.blue_900,
                },
                boolean = {
                    fg = palette.blue_900,
                },
                identifier = {
                    fg = palette.gray_1000,
                },
                function_ = {
                    fg = palette.purple_900,
                    italic = {
                        declaration = config.italic_function.declaration,
                        call = config.italic_function.call,
                        method = {
                            declaration = config.italic_function.method.declaration,
                            call = config.italic_function.method.call,
                        },
                    },
                },
                keyword = {
                    fg = palette.pink_900,
                },
                operator = {
                    fg = palette.pink_900,
                },
                type = {
                    fg = palette.teal_900,
                    builtin = {
                        fg = palette.blue_900,
                    },
                    italic = {
                        normal = config.italic_type.normal,
                        builtin = config.italic_type.builtin,
                        definition = config.italic_type.definition,
                    },
                },
                special = {
                    fg = palette.purple_900,
                },
                delimiter = {
                    fg = palette.gray_1000,
                },
                underlined = {
                    underline = true,
                },
                error = {
                    bg = palette.red_900,
                },
                todo = {
                    bg = palette.pink_900,
                },
                added = {
                    fg = palette.green_900,
                    bg = palette.green_200,
                },
                changed = {
                    fg = palette.amber_900,
                    bg = palette.amber_200,
                },
                removed = {
                    fg = palette.red_900,
                    bg = palette.red_200,
                },
            },
            git = {
                added = {
                    fg = palette.green_800,
                    inline = {
                        bg = palette.green_500,
                    },
                },
                changed = {
                    fg = palette.amber_800,
                    inline = {
                        bg = palette.amber_500,
                    },
                },
                removed = {
                    fg = palette.red_800,
                    inline = {
                        bg = palette.red_500,
                    },
                },
            },
            treesitter = {
                tag = {
                    delimiter = {
                        fg = palette.gray_1000,
                    },
                },
                context = {
                    bg = config.treesitter_context_underline and palette.none
                        or palette.gray_100,
                    line_number = {
                        bg = config.treesitter_context_underline
                                and palette.none
                            or palette.gray_100,
                    },
                    bottom = {
                        underline = config.treesitter_context_underline,
                        sp = palette.gray_100,
                    },
                },
            },
            lsp = {
                reference = {
                    text = {
                        -- bg = palette.blue_300,
                        bg = palette.bg_300,
                    },
                    read = {
                        -- bg = palette.blue_300,
                        bg = palette.bg_300,
                    },
                    write = {
                        -- bg = palette.blue_300,
                        bg = palette.bg_300,
                    },
                },
                inlay_hint = {
                    bg = palette.gray_400,
                    fg = palette.gray_1000,
                },
            },
            diagnostic = {
                error = {
                    fg = palette.red_900,
                },
                warn = {
                    fg = palette.amber_900,
                },
                info = {
                    fg = palette.blue_900,
                },
                hint = {
                    fg = palette.teal_900,
                },
                ok = {
                    fg = palette.green_900,
                },
                unnecessary = {
                    fg = palette.gray_900,
                },
            },
            nvim_tree = {
                normal = {
                    bg = main.bg,
                    fg = palette.gray_1000,
                },
                win_separator = {
                    bg = main.bg,
                    fg = palette.gray_900,
                },
                folder = {
                    icon = {
                        fg = palette.amber_600,
                    },
                },
                root_folder = {
                    fg = palette.gray_1000,
                },
                git = {
                    deleted = {
                        fg = palette.red_900,
                    },
                    dirty = {
                        fg = palette.amber_900,
                    },
                    new = {
                        fg = palette.amber_900,
                    },
                    ignored = {
                        fg = palette.gray_900,
                    },
                    staged = {
                        fg = palette.green_900,
                    },
                },
                exec_file = {
                    fg = palette.green_900,
                },
            },
            cmp_item = {
                abbr = {
                    fg = palette.gray_900,
                },
                kind = {
                    fg = palette.gray_900,
                },
            },
            fzf = {
                normal = {
                    bg = palette.gray_300,
                },
                border = {
                    bg = palette.gray_300,
                    fg = palette.gray_300,
                },
                preview = {
                    normal = {
                        bg = main.bg,
                    },
                },
            },
            grapple = {
                normal = {
                    bg = palette.gray_300,
                },
                border = {
                    bg = palette.gray_300,
                    fg = palette.gray_300,
                },
                title = {
                    bg = palette.green_900,
                    fg = palette.gray_1000,
                },
                footer = {
                    bg = palette.gray_300,
                    fg = palette.gray_900,
                },
            },
            mini = {
                indentscope = {
                    fg = palette.gray_800,
                },
            },
        }

        return theme
    end,
}

return themes
