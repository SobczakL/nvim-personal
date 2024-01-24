vim.g.mapleader = " "

local mappings = {
    -- NORMAL MODE
    { 'n', ';',          ':' },
    { 'n', '<leader>n',  '<cmd> set nu! <CR>' },
    { 'n', '<leader>rn', '<cmd> set rnu! <CR>' },
    { 'n', '<C-i>',      '<cmd>cnext<CR>' },
    { 'n', '<C-o>',      '<cmd>cprev<CR>' },

    { 'n', '<C-h>',      '<C-w>h' },
    { 'n', '<C-j>',      '<C-w>j' },
    { 'n', '<C-k>',      '<C-w>k' },
    { 'n', '<C-l>',      '<C-w>l' },

    -- NORMAL MODE: Buffer cycling
    { 'n', '<tab>', ':bnext<CR>' },
    { 'n', '<s-tab>', ':bprev<CR>' },



    -- VISUAL MODE
    { "v", "J",          ":m '>+1<CR>gv=gv" },
    { "v", "K",          ":m '<-2<CR>gv=gv" },


    -- INSERT MODE

    -- TERMINAL MODE
    { "t", "<C-x>",      vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true) },


    -- NVIMTREE
    { 'n', '<C-n>',      '<cmd> NvimTreeToggle <CR>' },
    { 'n', '<leader>e',  '<cmd> NvimTreeFocus <CR>' },

}


local function set_mappings(mappings)
    for idx, mapping in ipairs(mappings) do
        local mode, key, command = mapping[1], mapping[2], mapping[3]
        if mode and key and command then
            vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
        else
            print("Invalid mapping at index " .. idx .. ":", vim.inspect(mapping))
        end
    end
end

set_mappings(mappings)
