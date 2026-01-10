-- Conform.nvim 配置 - 专注于格式化
-- 优先使用项目本地的工具，fallback 到全局工具

local conform = require("conform")

-- 辅助函数：查找项目本地的可执行文件
local function find_local_executable(names, paths)
  for _, path in ipairs(paths) do
    for _, name in ipairs(names) do
      local full_path = vim.fn.getcwd() .. "/" .. path .. "/" .. name
      if vim.fn.executable(full_path) == 1 then
        return full_path
      end
    end
  end
  return nil
end

-- Python: 优先使用 virtualenv 中的工具
local function get_python_path(tool)
  local venv_paths = { ".venv/bin", "venv/bin", "env/bin" }
  return find_local_executable({ tool }, venv_paths) or tool
end

-- JavaScript: 优先使用 node_modules 中的工具
local function get_node_path(tool)
  return find_local_executable({ tool }, { "node_modules/.bin" }) or tool
end

conform.setup({
  formatters_by_ft = {
    -- Python
    python = { "isort", "black" },

    -- JavaScript/TypeScript
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },

    -- Web
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    vue = { "prettier" },

    -- Ruby
    ruby = { "rubocop" },

    -- Lua
    lua = { "stylua" },
  },

  -- 自定义格式化器配置
  formatters = {
    black = {
      command = get_python_path("black"),
      args = { "--fast", "--quiet", "-" },
    },
    isort = {
      command = get_python_path("isort"),
      args = { "--profile", "black", "--quiet", "-" },
    },
    prettier = {
      command = get_node_path("prettier"),
      args = {
        "--stdin-filepath", "$FILENAME",
        "--single-quote",
        "--jsx-single-quote",
        "--tab-width", "2",
        "--trailing-comma", "es5",
      },
    },
    rubocop = {
      command = "bundle",
      args = { "exec", "rubocop", "--autocorrect", "--stdin", "$FILENAME", "--stderr", "--format", "quiet" },
    },
  },

  -- 格式化选项
  format_on_save = nil, -- 默认不自动格式化，使用 <leader>fc 手动格式化
  -- 如果需要保存时自动格式化，取消注释下面的代码：
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
})

-- 设置键位映射
vim.keymap.set({ "n", "v" }, "<leader>fc", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
