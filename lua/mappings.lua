require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local snacks = require "snacks"
local picker = snacks.picker

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>e", function()
  require("snacks").explorer()
end, { desc = "Open Snacks Explorer" })

-- Top pickers & explorer
map("n", "<leader><space>", picker.smart, { desc = "Smart Find Files" })
map("n", "<leader>,", picker.buffers, { desc = "Buffers" })
map("n", "<leader>:", picker.command_history, { desc = "Command History" })
map("n", "<leader>n", picker.notifications, { desc = "Notification History" })

-- Find
map("n", "<leader>fb", picker.buffers, { desc = "Buffers" })
map("n", "<leader>fc", function()
  picker.files { cwd = vim.fn.stdpath "config" }
end, { desc = "Find Config File" })
map("n", "<leader>ff", picker.files, { desc = "Find Files" })
map("n", "<leader>fg", picker.git_files, { desc = "Find Git Files" })
map("n", "<leader>fp", picker.projects, { desc = "Projects" })
map("n", "<leader>fr", picker.recent, { desc = "Recent" })

-- Git
map("n", "<leader>gb", picker.git_branches, { desc = "Git Branches" })
map("n", "<leader>gl", picker.git_log, { desc = "Git Log" })
map("n", "<leader>gL", picker.git_log_line, { desc = "Git Log Line" })
map("n", "<leader>gs", picker.git_status, { desc = "Git Status" })
map("n", "<leader>gS", picker.git_stash, { desc = "Git Stash" })
map("n", "<leader>gd", picker.git_diff, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", picker.git_log_file, { desc = "Git Log File" })

-- GitHub
map("n", "<leader>gi", picker.gh_issue, { desc = "GitHub Issues (open)" })
map("n", "<leader>gI", function()
  picker.gh_issue { state = "all" }
end, { desc = "GitHub Issues (all)" })
map("n", "<leader>gp", picker.gh_pr, { desc = "GitHub Pull Requests (open)" })
map("n", "<leader>gP", function()
  picker.gh_pr { state = "all" }
end, { desc = "GitHub Pull Requests (all)" })

-- Grep/Search
map("n", "<leader>sB", picker.grep_buffers, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", picker.grep, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", picker.grep_word, { desc = "Visual selection or word" })
map("n", '<leader>s"', picker.registers, { desc = "Registers" })
map("n", "<leader>s/", picker.search_history, { desc = "Search History" })
map("n", "<leader>sa", picker.autocmds, { desc = "Autocmds" })
map("n", "<leader>sb", picker.lines, { desc = "Buffer Lines" })
map("n", "<leader>sc", picker.command_history, { desc = "Command History" })
map("n", "<leader>sC", picker.commands, { desc = "Commands" })
map("n", "<leader>sd", picker.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>sD", picker.diagnostics_buffer, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", picker.help, { desc = "Help Pages" })
map("n", "<leader>sH", picker.highlights, { desc = "Highlights" })
map("n", "<leader>si", picker.icons, { desc = "Icons" })
map("n", "<leader>sj", picker.jumps, { desc = "Jumps" })
map("n", "<leader>sk", picker.keymaps, { desc = "Keymaps" })
map("n", "<leader>sl", picker.loclist, { desc = "Location List" })
map("n", "<leader>sm", picker.marks, { desc = "Marks" })
map("n", "<leader>sM", picker.man, { desc = "Man Pages" })
map("n", "<leader>sp", picker.lazy, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", picker.qflist, { desc = "Quickfix List" })
map("n", "<leader>sR", picker.resume, { desc = "Resume" })
map("n", "<leader>su", picker.undo, { desc = "Undo History" })
map("n", "<leader>uC", picker.colorschemes, { desc = "Colorschemes" })

-- LSP
map("n", "gd", picker.lsp_definitions, { desc = "Goto Definition" })
map("n", "gD", picker.lsp_declarations, { desc = "Goto Declaration" })
map("n", "gr", picker.lsp_references, { desc = "References", nowait = true })
map("n", "gI", picker.lsp_implementations, { desc = "Goto Implementation" })
map("n", "gy", picker.lsp_type_definitions, { desc = "Goto Type Definition" })
map("n", "gai", picker.lsp_incoming_calls, { desc = "Calls Incoming" })
map("n", "gao", picker.lsp_outgoing_calls, { desc = "Calls Outgoing" })
map("n", "<leader>ss", picker.lsp_symbols, { desc = "LSP Symbols" })
map("n", "<leader>sS", picker.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })

-- Other
map("n", "<leader>z", function()
  snacks.zen()
end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function()
  snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
map("n", "<leader>.", function()
  snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", snacks.scratch.select, { desc = "Select Scratch Buffer" })
map("n", "<leader>bd", function()
  snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>cR", snacks.rename.rename_file, { desc = "Rename File" })
map({ "n", "x" }, "<leader>gB", function()
  snacks.gitbrowse()
end, { desc = "Git Browse" })
map("n", "<leader>gg", function()
  snacks.lazygit()
end, { desc = "Lazygit" })
map("n", "<leader>un", snacks.notifier.hide, { desc = "Dismiss All Notifications" })
map({ "n", "t" }, "<C-/>", function()
  snacks.terminal()
end, { desc = "Toggle Terminal" })
map("n", "<C-_>", function()
  snacks.terminal()
end, { desc = "which_key_ignore" })
map({ "n", "t" }, "]]", function()
  snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function()
  snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

map("n", "<leader>N", function()
  snacks.win {
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  }
end, { desc = "Neovim News" })

-- LSP Info
map("n", "<leader>cl", function()
  require("snacks").picker.lsp_config()
end, { desc = "LSP Info" })

-- Navigation
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- Hover & signature
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- Code actions & codelens
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map({ "n", "x" }, "<leader>cC", function()
  vim.lsp.codelens.run()
end, { desc = "Run Codelens" })
map("n", "<leader>cc", function()
  vim.lsp.codelens.enable(true)
end, { desc = "Refresh Codelens" })

-- Rename
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cR", function()
  require("snacks").rename.rename_file()
end, { desc = "Rename File" })

-- References navigation (Snacks)
map("n", "]]", function()
  require("snacks").words.jump(vim.v.count1)
end, { desc = "Next Reference" })

map("n", "[[", function()
  require("snacks").words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

map("n", "<A-n>", function()
  require("snacks").words.jump(vim.v.count1, true)
end, { desc = "Next Reference" })

map("n", "<A-p>", function()
  require("snacks").words.jump(-vim.v.count1, true)
end, { desc = "Prev Reference" })
