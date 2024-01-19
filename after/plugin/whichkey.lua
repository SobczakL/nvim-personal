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

    -- Buffers
    ["b"] = {
        name = "Buffer",
        ["b"] = { "<cmd>enew<cr>", "New Buffer" },
        ["n"] = { "<cmd>bnext<cr>", "Next Buffer" },
        ["p"] = { "<cmd>bprev<cr>", "Previous Buffer" },
        ["f"] = { "<cmd>bfirst<cr>", "First Buffer" },
        ["l"] = { "<cmd>blast<cr>", "Last Buffer" },
        ["k"] = { "<cmd>bd<cr>", "Kill Buffer" },
        ["x"] = { "<cmd>bufdo<cr>", "Kill All Buffers" },
    },

    -- Toggle Term
    ["t"] = {
        name = "Toggle Term Maps",
        ["."] = { "", "<C-t> Toggle Term" },
        -- [","] = { "", "<C-h> Window Left" },
        -- ["/"] = { "", "<C-t> Toggle Term" },
        -- ["."] = { "", "<C-t> Toggle Term" }
        -- ["."] = { "", "<C-t> Toggle Term" }
        -- ["."] = { "", "<C-t> Toggle Term" }
    }
}

wk.register(mappings, opts)
