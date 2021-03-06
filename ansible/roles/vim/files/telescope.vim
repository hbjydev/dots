lua << EOF
local actions = require("telescope.actions")

require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        },
        layout_strategy = "horizontal",
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
    }
}
EOF
