return {
    "xiyaowong/transparent.nvim",
    config = function()
        local transparent = require("transparent")

        vim.keymap.set("n", "<leader>T", function()
            transparent.toggle_transparent()
        end)
    end

}
