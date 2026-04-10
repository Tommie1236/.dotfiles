
require("todo-comments").setup({
    signs = true,
    sign_priority = 8,

    keywords = {
        TODO = { icon = " ", color = "info"},
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
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
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
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



vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>")

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

