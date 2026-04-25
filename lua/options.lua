require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.spell = true
o.scrolloff = 30
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.lsp.foldexpr()"
o.foldenable = true
o.foldlevel = 99
