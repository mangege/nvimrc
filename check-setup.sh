#!/bin/bash
# Neovim 配置检查脚本

echo "==================================="
echo "Neovim 配置检查"
echo "==================================="
echo ""

# 检查 Neovim 版本
echo "1. Neovim 版本:"
nvim --version | head -1
echo ""

# 检查关键插件
echo "2. 关键插件安装状态:"
LAZY_DIR="$HOME/.local/share/nvim/lazy"

plugins=(
  "lazy.nvim"
  "mason.nvim"
  "mason-lspconfig.nvim"
  "nvim-lspconfig"
  "nvim-cmp"
  "conform.nvim"
  "nvim-lint"
  "supermaven-nvim"
  "nvim-treesitter"
  "fzf-lua"
  "nvim-tree.lua"
)

for plugin in "${plugins[@]}"; do
  if [ -d "$LAZY_DIR/$plugin" ]; then
    echo "  ✓ $plugin"
  else
    echo "  ✗ $plugin (缺失)"
  fi
done
echo ""

# 检查 AI 配置
echo "3. AI 配置检查:"
echo "  ℹ Supermaven 需要在 Neovim 中运行 :SupermavenLogin 完成认证"
echo "  运行 :SupermavenStatus 检查状态"
echo ""

# 检查 LSP 工具
echo "4. LSP 工具安装状态:"
MASON_BIN="$HOME/.local/share/nvim/mason/bin"

tools=(
  "lua-language-server"
  "pyright"
  "typescript-language-server"
)

for tool in "${tools[@]}"; do
  if [ -f "$MASON_BIN/$tool" ]; then
    echo "  ✓ $tool"
  else
    echo "  ✗ $tool (未安装)"
  fi
done
echo ""

# 检查格式化工具
echo "5. 系统格式化工具:"

if command -v black &> /dev/null; then
  echo "  ✓ black (Python)"
else
  echo "  ✗ black (未安装，运行: pip install black)"
fi

if command -v prettier &> /dev/null; then
  echo "  ✓ prettier (JavaScript)"
else
  echo "  ✗ prettier (未安装，运行: npm install -g prettier)"
fi

if command -v bundle &> /dev/null; then
  echo "  ✓ bundle (Ruby)"
else
  echo "  ✗ bundle (未安装)"
fi
echo ""

# 总结
echo "==================================="
echo "建议操作:"
echo "==================================="

if [ ! -d "$LAZY_DIR/mason.nvim" ]; then
  echo "• 打开 Neovim 并运行 :Lazy sync 安装插件"
fi

echo "• 在 Neovim 中运行 :SupermavenLogin 完成 AI 补全认证"

if [ ! -f "$MASON_BIN/lua-language-server" ]; then
  echo "• 在 Neovim 中运行 :Mason 安装 LSP 服务器"
fi

if ! command -v black &> /dev/null; then
  echo "• 安装 Python 格式化工具: pip install black isort ruff"
fi

if ! command -v prettier &> /dev/null; then
  echo "• 安装 JavaScript 格式化工具: npm install -g prettier"
fi

echo ""
echo "运行 'nvim +checkhealth' 查看详细健康检查"
