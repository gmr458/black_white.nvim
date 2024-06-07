--- @class Themes
local themes = {
    --- @param palette PaletteDark
    --- @param config Config
    --- @return ThemeDark
    dark = function(palette, config)
        local main = {
            bg = palette.bg_200,
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
                        bg = palette.amber_900,
                    },
                    column = {
                        bg = palette.bg_100,
                    },
                    line = {
                        bg = palette.bg_100,
                        nr = {
                            bg = config.cursorline and palette.dark_03
                                or main.bg,
                            fg = main.fg,
                        },
                    },
                },
                match_paren = {
                    bg = palette.bg_100,
                },
                directory = {
                    fg = palette.bg_100,
                },
                diff = {
                    add = {
                        bg = palette.green_900,
                    },
                    change = {
                        bg = palette.amber_900,
                    },
                    delete = {
                        bg = palette.red_900,
                    },
                    text = {
                        bg = palette.green_900,
                    },
                },
                folded = {
                    bg = palette.bg_100,
                },
                line_nr = {
                    bg = main.bg,
                    fg = palette.bg_100,
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
                        fg = palette.gray_800,
                    },
                },
                pmenu = {
                    bg = palette.dark_04,
                    fg = palette.grey_03,
                    sel = {
                        bg = palette.dark_05,
                        fg = palette.light_02,
                    },
                    sbar = {
                        bg = palette.dark_04,
                    },
                    thumb = {
                        bg = palette.grey_02,
                    },
                },
                search = {
                    bg = palette.grey_01,
                },
                spell = {
                    bad = {
                        fg = palette.red_03,
                    },
                    cap = {
                        fg = palette.yellow_03,
                    },
                    local_ = {
                        fg = palette.green_05,
                    },
                    rare = {
                        fg = palette.blue_04,
                    },
                },
                status_line = {
                    bg = palette.dark_02,
                    fg = palette.grey_08,
                    medium = {
                        bg = palette.dark_03,
                        fg = palette.grey_04,
                        git = {
                            added = {
                                fg = palette.green_05,
                            },
                            changed = {
                                fg = palette.yellow_03,
                            },
                            removed = {
                                fg = palette.red_03,
                            },
                        },
                    },
                    mode = {
                        bg = palette.green_05,
                        fg = palette.dark_02,
                    },
                    lsp = {
                        active = {
                            fg = palette.green_05,
                        },
                    },
                    icon = {
                        git = {
                            fg = palette.orange_02,
                        },
                        unsaved = {
                            fg = palette.yellow_03,
                        },
                    },
                },
                title = {
                    fg = palette.light_02,
                },
                visual = {
                    bg = palette.grey_01,
                },
                win = {
                    bar = {
                        unsaved_symbol = {
                            bg = main.bg,
                            fg = palette.yellow_03,
                        },
                    },
                    separator = {
                        bg = main.bg,
                        fg = palette.grey_02,
                    },
                },
            },
            syntax = {
                comment = {
                    fg = palette.grey_02,
                },
                constant = {
                    fg = palette.light_01,
                    italic = {
                        builtin = config.italic_constant.builtin,
                    },
                },
                string = {
                    fg = palette.green_05,
                    italic = config.italic_string,
                },
                character = {
                    fg = palette.blue_03,
                },
                number = {
                    fg = palette.light_02,
                },
                boolean = {
                    fg = palette.blue_02,
                },
                identifier = {
                    fg = palette.light_01,
                },
                function_ = {
                    fg = palette.purple_03,
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
                    fg = palette.blue_02,
                    italic = config.italic_keyword,
                },
                operator = {
                    fg = palette.grey_08,
                },
                type = {
                    fg = palette.grey_07,
                    italic = {
                        normal = config.italic_type.normal,
                        builtin = config.italic_type.builtin,
                        definition = config.italic_type.definition,
                    },
                },
                special = {
                    fg = palette.blue_02,
                },
                delimiter = {
                    fg = palette.grey_05,
                },
                underlined = {
                    underline = true,
                },
                error = {
                    bg = palette.red_03,
                },
                todo = {
                    bg = palette.pink_01,
                },
                added = {
                    fg = palette.light_02,
                    bg = palette.green_05,
                },
                changed = {
                    fg = palette.light_02,
                    bg = palette.orange_02,
                },
                removed = {
                    fg = palette.light_02,
                    bg = palette.red_03,
                },
            },
            git = {
                added = {
                    fg = palette.green_05,
                    inline = {
                        bg = palette.green_02,
                    },
                },
                changed = {
                    fg = palette.yellow_03,
                    inline = {
                        bg = palette.green_02,
                    },
                },
                removed = {
                    fg = palette.red_03,
                    inline = {
                        bg = palette.red_02,
                    },
                },
            },
            treesitter = {
                tag = {
                    delimiter = {
                        fg = palette.grey_02,
                    },
                },
                context = {
                    bg = palette.dark_05,
                    line_number = {
                        bg = palette.dark_05,
                    },
                },
            },
            lsp = {
                reference = {
                    text = {
                        bg = palette.grey_01,
                    },
                    read = {
                        bg = palette.grey_01,
                    },
                    write = {
                        bg = palette.grey_01,
                    },
                },
            },
            diagnostic = {
                error = {
                    fg = palette.red_03,
                },
                warn = {
                    fg = palette.yellow_03,
                },
                info = {
                    fg = palette.blue_02,
                },
                hint = {
                    fg = palette.blue_04,
                },
                ok = {
                    fg = palette.green_05,
                },
                unnecessary = {
                    fg = palette.grey_02,
                    special = {
                        fg = palette.blue_04,
                    },
                },
            },
            nvim_tree = {
                normal = {
                    bg = config.transparent_background and palette.none
                        or palette.dark_03,
                    fg = palette.grey_08,
                },
                win_separator = {
                    bg = main.bg,
                    fg = main.bg,
                },
                folder = {
                    icon = {
                        fg = palette.yellow_03,
                    },
                },
                root_folder = {
                    fg = palette.light_02,
                },
                git = {
                    deleted = {
                        fg = palette.red_03,
                    },
                    dirty = {
                        fg = palette.yellow_03,
                    },
                    ignored = {
                        fg = palette.grey_02,
                    },
                    staged = {
                        fg = palette.green_05,
                    },
                },
                exec_file = {
                    fg = palette.green_05,
                },
            },
            cmp_item = {
                abbr = {
                    fg = palette.grey_01,
                },
                kind = {

                    fg = palette.grey_02,
                },
            },
            fzf = {
                normal = {
                    bg = palette.dark_04,
                },
                border = {
                    bg = palette.dark_04,
                    fg = palette.dark_04,
                },
                preview = {
                    normal = {
                        bg = main.bg,
                    },
                },
            },
            alpha = {
                header = {
                    fg = palette.green_05,
                },
            },
            grapple = {
                normal = {
                    bg = palette.dark_02,
                },
                border = {
                    bg = palette.dark_02,
                    fg = palette.dark_02,
                },
                title = {
                    bg = palette.green_05,
                    fg = palette.dark_02,
                },
                footer = {
                    bg = palette.dark_03,
                    fg = palette.grey_04,
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
                        bg = palette.light_01,
                    },
                    column = {
                        bg = palette.dark_05,
                    },
                    line = {
                        bg = palette.bg_200,
                        nr = {
                            bg = config.cursorline and palette.light_03
                                or main.bg,
                            fg = main.fg,
                        },
                    },
                },
                match_paren = {
                    bg = palette.bg_200,
                },
                directory = {
                    fg = palette.blue_900,
                },
                diff = {
                    add = {
                        bg = palette.green_900,
                    },
                    change = {
                        bg = palette.amber_900,
                    },
                    delete = {
                        bg = palette.red_900,
                    },
                    text = {
                        bg = palette.green_900,
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
                        fg = palette.bg_200,
                    },
                },
                pmenu = {
                    bg = palette.gray_600,
                    fg = palette.grey_04,
                    sel = {
                        bg = palette.light_01,
                        fg = palette.dark_03,
                    },
                    sbar = {
                        bg = palette.dark_04,
                    },
                    thumb = {
                        bg = palette.grey_02,
                    },
                },
                search = {
                    bg = palette.light_01,
                },
                spell = {
                    bad = {
                        fg = palette.red_03,
                    },
                    cap = {
                        fg = palette.yellow_03,
                    },
                    local_ = {
                        fg = palette.green_05,
                    },
                    rare = {
                        fg = palette.blue_04,
                    },
                },
                status_line = {
                    bg = palette.light_01,
                    fg = palette.grey_01,
                    medium = {
                        bg = palette.grey_08,
                        fg = palette.grey_01,
                        git = {
                            added = {
                                fg = palette.green_02,
                            },
                            changed = {
                                fg = palette.yellow_02,
                            },
                            removed = {
                                fg = palette.red_03,
                            },
                        },
                    },
                    mode = {
                        bg = palette.green_05,
                        fg = palette.dark_02,
                    },
                    lsp = {
                        active = {
                            fg = palette.green_04,
                        },
                    },
                    icon = {
                        git = {
                            fg = palette.orange_01,
                        },
                        unsaved = {
                            fg = palette.yellow_02,
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
                    bar = {
                        unsaved_symbol = {
                            bg = main.bg,
                            fg = palette.yellow_03,
                        },
                    },
                    separator = {
                        bg = main.bg,
                        fg = palette.grey_02,
                    },
                },
            },
            syntax = {
                comment = {
                    fg = palette.gray_900,
                },
                constant = {
                    fg = palette.blue_900,
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
                    fg = palette.purple_900,
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
                        bg = palette.green_400,
                    },
                },
                changed = {
                    fg = palette.amber_800,
                    inline = {
                        bg = palette.amber_400,
                    },
                },
                removed = {
                    fg = palette.red_800,
                    inline = {
                        bg = palette.amber_400,
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
                    bg = palette.bg_200,
                    line_number = {
                        bg = palette.bg_200,
                    },
                },
            },
            lsp = {
                reference = {
                    text = {
                        bg = palette.blue_300,
                    },
                    read = {
                        bg = palette.blue_300,
                    },
                    write = {
                        bg = palette.blue_300,
                    },
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
                    -- special = {
                    --     fg = palette.blue_04,
                    -- },
                },
            },
            nvim_tree = {
                normal = {
                    bg = config.transparent_background and palette.none
                        or palette.bg_200,
                    fg = palette.gray_1000,
                },
                win_separator = {
                    bg = main.bg,
                    fg = main.bg,
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
                    ignored = {
                        fg = palette.gray_900,
                    },
                    staged = {
                        fg = palette.green_900,
                    },
                },
                exec_file = {
                    fg = palette.blue_900,
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
                    bg = palette.bg_200,
                },
                border = {
                    bg = palette.bg_200,
                    fg = palette.bg_200,
                },
                preview = {
                    normal = {
                        bg = main.bg,
                    },
                },
            },
            grapple = {
                normal = {
                    bg = palette.bg_200,
                },
                border = {
                    bg = palette.bg_200,
                    fg = palette.bg_200,
                },
                title = {
                    bg = palette.green_900,
                    fg = palette.gray_1000,
                },
                footer = {
                    bg = palette.bg_200,
                    fg = palette.gray_900,
                },
            },
        }

        return theme
    end,
}

return themes
