return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        local status_ok, toggleterm = pcall(require, "toggleterm")
        if not status_ok then
            return
        end

        toggleterm.setup {
            size = 20,
            open_mapping = [[<c-t>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = false,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        }
        -- Set terminal key mappings
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            vim.keymap.set('t', '<S-Up>', [[<Cmd>resize +5<CR>]], opts)
            vim.keymap.set('t', '<S-Down>', [[<Cmd>resize -5<CR>]], opts)
            vim.keymap.set('t', '<S-Left>', [[<Cmd>vertical resize -5<CR>]], opts)
            vim.keymap.set('t', '<S-Right>', [[<Cmd>vertical resize +5<CR>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

        local Terminal = require("toggleterm.terminal").Terminal

        -- Define a Tab Terminal
        local tab_term = Terminal:new({
            direction = "tab",
            persist_size = true,
        })

        function _TAB_TERM_TOGGLE()
            tab_term:toggle()
        end

        -- Vertical and Horizontal Terminals with fixed sizes
        local vertical_term = Terminal:new({
            direction = "vertical",
            size = 80,
            persist_size = true,
            on_open = function(term)
                vim.cmd("setlocal winfixwidth")
            end,
            on_close = function(term)
                vim.cmd("setlocal nowinfixwidth")
            end,
        })

        local horizontal_term = Terminal:new({
            direction = "horizontal",
            size = 15,
            persist_size = true,
            on_open = function(term)
                vim.cmd("setlocal winfixheight")
            end,
            on_close = function(term)
                vim.cmd("setlocal nowinfixheight")
            end,
        })

        function _VERTICAL_TERM_TOGGLE()
            vertical_term:toggle()
        end

        function _HORIZONTAL_TERM_TOGGLE()
            horizontal_term:toggle()
        end

        -- Key mappings to toggle terminals
        vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _TAB_TERM_TOGGLE()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>",
            { noremap = true, silent = true })
    end,
}
