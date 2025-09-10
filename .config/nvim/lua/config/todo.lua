
require("todo-comments").setup({
    signs = true,
    sign_priority = 8,

    keywords = {
        TODO = { icon = " ", color = "info"},
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        -- for more see https://github.com/folke/todo-comments.nvim
    },
    gui_style = {
        fg = "NONE",
        bg = "BOLD",
    },
    merge_keywords = true,
    highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
    },
    colors = {
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[\b(KEYWORDS):]],
    },
})
