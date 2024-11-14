return {
    "anuvyklack/windows.nvim",
    dependencies = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim"
    },
    config = function()
        local function cmd(command)
            return table.concat({ '<Cmd>', command, '<CR>' })
        end

        vim.keymap.set('n', '<leader>mm', cmd 'WindowsMaximize')
        vim.keymap.set('n', '<leader>mv', cmd 'WindowsMaximizeVertically')
        vim.keymap.set('n', '<leader>mh', cmd 'WindowsMaximizeHorizontally')
        vim.keymap.set('n', '<leader>me', cmd 'WindowsEqualize')
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
        require('windows').setup()
    end
}
