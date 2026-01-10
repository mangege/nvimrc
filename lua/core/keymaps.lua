-- fzf-lua mappings
local fzf_ok, fzf = pcall(require, 'fzf-lua')
if fzf_ok then
  vim.keymap.set('n', '<leader>ff', fzf.files, { desc = "Find files" })
  vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = "Live grep" })
  vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Find buffers" })
  vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = "Help tags" })
  vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = "Recent files" })
  vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = "Grep word under cursor" })
end

-- NvimTree mappings
vim.keymap.set({ 'n' }, '<leader>b', ':NvimTreeToggle<CR>', { desc = "Toggle file tree" })
vim.keymap.set({ 'n' }, '<leader>v', ':NvimTreeFindFile<CR>', { desc = "Find current file in tree" })

-- Tab management
vim.keymap.set({ 'n' }, '<leader>t', ':tabnew %<CR>')

-- Save file
vim.keymap.set({ 'n' }, '<C-s>', ':w<CR>')
