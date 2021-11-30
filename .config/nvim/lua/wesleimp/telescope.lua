local telescope = require("telescope")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local function dropdown(opts)
    return themes.get_dropdown(vim.tbl_deep_extend('force', opts or {}, {
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
            results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
    }))
end

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = ' ',
        color_devicons = true,

        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        path_display = { 'absolute', 'truncate' },
        layout_strategy = 'flex',
            layout_config = {
            horizontal = {
                preview_width = 0.45,
            },
        },
        winblend = 3,
        mappings = {
            i = {
                ['<C-w>'] = actions.send_selected_to_qflist,
                ['<c-c>'] = function()
                    vim.cmd 'stopinsert!'
                end,
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ['<esc>'] = actions.close,
                ['<S-s>'] = actions.select_horizontal,
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev,
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
        find_files = {
            hidden = true,
            file_ignore_patterns = { '.git/' },
            previewer = false,
        },
        live_grep = {
            file_ignore_patterns = { '.git/' },
        },
        buffers = dropdown({
            sort_mru = true,
            sort_lastused = true,
            show_all_buffers = true,
            ignore_current_buffer = true,
            previewer = false,
            theme = 'dropdown',
            mappings = {
                i = { ['<c-x>'] = 'delete_buffer' },
                n = { ['<c-x>'] = 'delete_buffer' },
            }
        }),
        git_branches = dropdown(),
        git_bcommits = {
            layout_config = {
            horizontal = {
                preview_width = 0.55,
            },
            },
        },
        git_commits = {
            layout_config = {
                horizontal = {
                    preview_width = 0.55,
                },
            }
        },
    },
    extensions = {
        fzy = {
            override_generic_sorter = false,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
        },
        project = {
            base_dirs = {
                "~/OSS",
                "~/workspace",
                "~/.dotfiles",
            },
            hidden_files = true,
        }
    },
})

telescope.load_extension('fzy_native')
telescope.load_extension('project')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

return M
