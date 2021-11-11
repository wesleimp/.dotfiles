local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        prompt_prefix = " > ",
        layout_strategy = 'horizontal',
        color_devicons = true,

        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },

    pickers = {
        find_files = {
            previewer = false,
        },
        buffers = {
            previewer = false
        }
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
        }
    },
})

require('telescope').load_extension('fzf')
