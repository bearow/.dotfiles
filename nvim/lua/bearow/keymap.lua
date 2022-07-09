local M = {}

function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

M.nnoremap("<C-p>", ":Telescope")
M.nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
M.nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
M.nnoremap("<Leader>pf", function()
    require('telescope.builtin').find_files()
end)

M.nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
M.nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
M.nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)
M.nnoremap("<leader>vrc", function()
    require('bearow.telescope').search_dotfiles({ hidden = true })
end)

local silent = { silent = true }

M.nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
M.nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)
M.nnoremap("<leader>tc", function() require("harpoon.cmd-ui").toggle_quick_menu() end, silent)
M.nnoremap("<C-1>", function() require("harpoon.ui").nav_file(1) end, silent)
M.nnoremap("<C-2>", function() require("harpoon.ui").nav_file(2) end, silent)
M.nnoremap("<C-3>", function() require("harpoon.ui").nav_file(3) end, silent)
M.nnoremap("<C-4>", function() require("harpoon.ui").nav_file(4) end, silent)

return M
