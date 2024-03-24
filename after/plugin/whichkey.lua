local wk = require("which-key")

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {

    ["k"] = { "<cmd>bdelete<CR>", "Kill Buffer" },

    ["q"] = { "<cmd>wqall!<CR>", "Quit" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["u"] = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
    ["s"] = {
        function()
            local pattern = vim.fn.input("Search File: ")
            vim.cmd(":vimgrep /" .. vim.fn.escape(pattern, "/") .. "/ %")
            vim.cmd(":match Search /" .. vim.fn.escape(pattern, "/") .. "/")
            vim.cmd("augroup SearchHighlights")
            vim.cmd("autocmd CursorMoved * silent! call clearmatches()")
            vim.cmd("augroup END")
        end,
        "Search File"
    },

    -- COMMENTS
    -- only for name group
    ["/"] = {
        name = "Comments",
    },
    -- PACKER
    ["p"] = {
        name = "Packer",
        ["s"] = { "<cmd>PackerSync<cr>", "Packer Sync" }
    },
    -- HARPOON
    -- only mark due to leader
    ["h"] = {
        name = "Harpoon",
        ["m"] = { "", "Mark file" },
    },

    -- Telescope
    ["f"] = {
        name = "Files",
        ["f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
        ["g"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        ["b"] = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        ["h"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        ["c"] = { "<cmd>Telescope commands<cr>", "Find Commands" },
    },

    -- Toggle Term
    ["t"] = {
        name = "Toggle Term Maps",
        ["."] = { "", "<C-t> Toggle Term" },
        ["n"] = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        ["p"] = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        ["f"] = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        ["h"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        ["v"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
}

wk.register(mappings, opts)
