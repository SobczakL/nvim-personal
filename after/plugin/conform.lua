require("conform").setup({

    lsp_fallback = true,

    formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
    },


    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

