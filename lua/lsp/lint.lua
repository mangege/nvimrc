-- nvim-lint 配置 - 专注于 linting
-- 优先使用项目本地的工具

local lint = require("lint")

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

-- 配置 linters
lint.linters_by_ft = {
  python = { "ruff" },
  -- JavaScript/TypeScript 使用 LSP (eslint) 提供诊断
  -- Ruby 使用 LSP (rubocop) 提供诊断
}

-- 自定义 linter 配置
local ruff = lint.linters.ruff
ruff.cmd = find_local_executable({ "ruff" }, { ".venv/bin", "venv/bin", "env/bin" }) or "ruff"

-- 设置自动 lint
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    -- 只在正常 buffer 中运行 lint
    if vim.bo.buftype == "" then
      lint.try_lint()
    end
  end,
})
