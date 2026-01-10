# Neovim Configuration

现代化的 Neovim 配置，针对 Ruby、Python 和 JavaScript/TypeScript 开发优化。

**性能优先设计：**
- 🚀 使用 fzf-lua 实现极速搜索（比 Telescope 快 2-5 倍）
- ⚡ 使用 conform.nvim 实现快速格式化（比 none-ls 快 2-3 倍）
- 📦 精简插件数量，减少启动时间

## 特性

- 使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 进行插件管理
- 通过 [Mason](https://github.com/williamboman/mason.nvim) 自动安装和管理 LSP 服务器
- 使用 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) 提供智能补全
- 使用 [conform.nvim](https://github.com/stevearc/conform.nvim) 进行快速代码格式化
- 使用 [nvim-lint](https://github.com/mfussenegger/nvim-lint) 进行代码 linting
- 使用 [fzf-lua](https://github.com/ibhagwan/fzf-lua) 进行极速模糊搜索
- 使用 [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) 提供文件浏览器
- 集成 [Supermaven](https://github.com/supermaven-inc/supermaven-nvim) AI 代码补全
- 使用 [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 提供语法高亮和代码理解

## 安装

### 1. 克隆配置

```bash
cd ~/.config
git clone git@github.com:mangege/nvimrc.git nvim
```

### 2. 安装依赖

#### 核心依赖

**macOS:**
```bash
# 必需
brew install neovim ripgrep fzf

# 推荐（用于 Treesitter 编译和插件支持）
brew install tree-sitter luarocks
```

**Ubuntu/Debian:**
```bash
# 必需
sudo apt install -y neovim ripgrep fzf

# 推荐（用于 Treesitter 编译和插件支持）
sudo apt install -y tree-sitter-cli luarocks

# 如果 tree-sitter-cli 不可用，可以使用 npm 安装
# npm install -g tree-sitter-cli
```

**Arch Linux:**
```bash
# 必需
sudo pacman -S neovim ripgrep fzf

# 推荐（用于 Treesitter 编译和插件支持）
sudo pacman -S tree-sitter luarocks
```

#### 依赖说明

- **neovim** - Neovim 编辑器（必需）
- **ripgrep** - 快速文件搜索工具，fzf-lua 需要（必需）
- **fzf** - 模糊搜索工具，fzf-lua 需要（必需）
- **tree-sitter-cli** - Treesitter 命令行工具，用于编译语法解析器（推荐）
- **luarocks** - Lua 包管理器，某些插件可能需要（推荐）

> 💡 **提示**：没有 tree-sitter-cli 和 luarocks 也能使用，但安装它们可以获得更好的体验和完整功能。

### 3. 首次启动

```bash
nvim
```

首次启动时，Lazy 会自动安装所有插件。等待安装完成后，重启 Neovim。

### 4. 检查安装状态

运行配置检查脚本：
```bash
~/.config/nvim/check-setup.sh
```

这会检查：
- 所有插件安装状态
- API Key 配置
- LSP 工具安装
- 格式化工具

或者在 Neovim 中：
```vim
:checkhealth
```

### 5. 安装 Nerd Font（可选，但推荐）

图标显示需要 Nerd Font：

1. 从 [Nerd Fonts](https://www.nerdfonts.com/) 下载字体
2. 解压并复制到 `~/.fonts`
3. 重建字体缓存：`fc-cache -fv`
4. 在终端设置中选择该字体

## 配置结构

```
nvim/
├── init.lua                    # 主配置入口
├── lua/
│   ├── core/                   # 核心配置
│   │   ├── options.lua         # Vim 选项设置
│   │   └── keymaps.lua         # 键位映射
│   ├── lsp/                    # LSP 配置
│   │   ├── init.lua            # LSP 主配置
│   │   ├── servers.lua         # 语言服务器配置
│   │   ├── conform.lua         # 代码格式化配置
│   │   └── lint.lua            # 代码 linting 配置
│   └── plugins.lua             # 插件声明
└── lazy-lock.json              # 插件版本锁定
```

## 语言支持

### Python

**LSP 服务器：** [pyright](https://github.com/microsoft/pyright)
- 类型检查
- 智能补全
- 代码导航

**格式化和 Linting：**
- [black](https://github.com/psf/black) - 代码格式化
- [isort](https://github.com/PyCQA/isort) - import 排序
- [ruff](https://github.com/astral-sh/ruff) - 快速 linter

**安装工具（推荐项目本地安装）：**

方式 1: 在项目的 virtualenv 中安装（推荐）
```bash
# 创建虚拟环境
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# 安装工具
pip install black isort ruff

# 或添加到 requirements-dev.txt
echo "black\nisort\nruff" > requirements-dev.txt
pip install -r requirements-dev.txt
```

方式 2: 全局安装
```bash
pip install black isort ruff
```

配置会自动检测并优先使用项目本地的工具。

### JavaScript/TypeScript

**LSP 服务器：**
- [ts_ls](https://github.com/typescript-language-server/typescript-language-server) - TypeScript/JavaScript
- [eslint](https://eslint.org/) - 代码质量检查

**格式化：**
- [prettier](https://prettier.io/) - 代码格式化

**安装工具（推荐项目本地安装）：**

方式 1: 在项目中安装（推荐）
```bash
# 安装为开发依赖
npm install --save-dev prettier

# 或使用 yarn
yarn add -D prettier

# 创建配置文件（可选）
echo '{"singleQuote": true, "semi": false}' > .prettierrc
```

方式 2: 全局安装
```bash
npm install -g prettier
```

配置会自动检测并优先使用项目 `node_modules` 中的工具。

### Ruby

**LSP 服务器：**
- [ruby-lsp](https://github.com/Shopify/ruby-lsp) - 官方 Ruby LSP
- [rubocop](https://github.com/rubocop/rubocop) - 代码风格检查

**重要：** Ruby 工具通过项目的 Gemfile 管理，而不是全局安装。

在你的 `Gemfile` 中添加：

```ruby
group :development do
  gem 'ruby-lsp', require: false
  gem 'ruby-lsp-rails', require: false  # 如果使用 Rails
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false   # 如果使用 Rails
end
```

然后运行：
```bash
bundle install
```

配置会自动使用 `bundle exec` 调用这些工具。

### 其他语言

配置还支持以下语言服务器：
- **Lua**: lua_ls（带 Neovim 特定配置）
- **HTML**: html
- **CSS**: cssls
- **JSON**: jsonls

## 键位映射

### 通用键位

| 键位 | 模式 | 功能 |
|------|------|------|
| `<C-s>` | Normal | 保存文件 |
| `<leader>t` | Normal | 在新标签页打开当前文件 |

### 文件浏览和搜索（fzf-lua & nvim-tree）

| 键位 | 模式 | 功能 |
|------|------|------|
| `<leader>ff` | Normal | 查找文件 |
| `<leader>fg` | Normal | 全局搜索（live grep）|
| `<leader>fb` | Normal | 查找缓冲区 |
| `<leader>fh` | Normal | 查找帮助标签 |
| `<leader>fr` | Normal | 查找最近文件 |
| `<leader>fw` | Normal | 搜索光标下的单词 |
| `<leader>b` | Normal | 切换文件树 |
| `<leader>v` | Normal | 在文件树中定位当前文件 |

### LSP 功能

| 键位 | 模式 | 功能 |
|------|------|------|
| `gd` | Normal | 跳转到定义 |
| `gD` | Normal | 跳转到声明 |
| `gi` | Normal | 跳转到实现 |
| `gr` | Normal | 显示引用 |
| `K` | Normal | 显示文档 |
| `<C-k>` | Normal | 显示签名帮助 |
| `<leader>D` | Normal | 跳转到类型定义 |
| `<leader>rn` | Normal | 重命名符号 |
| `<leader>ca` | Normal/Visual | 代码操作 |
| `<leader>fc` | Normal | 格式化代码 |

### 诊断

| 键位 | 模式 | 功能 |
|------|------|------|
| `<leader>e` | Normal | 显示诊断浮窗 |
| `[d` | Normal | 上一个诊断 |
| `]d` | Normal | 下一个诊断 |
| `<leader>q` | Normal | 打开诊断列表 |

### 补全

| 键位 | 模式 | 功能 |
|------|------|------|
| `<Tab>` | Insert | 选择下一项 |
| `<S-Tab>` | Insert | 选择上一项 |
| `<CR>` | Insert | 确认选择 |
| `<C-Space>` | Insert | 触发补全 |
| `<C-e>` | Insert | 取消补全 |
| `<C-b>` / `<C-f>` | Insert | 滚动文档 |

## 格式化和 Linting

配置使用 **conform.nvim** 进行格式化和 **nvim-lint** 进行 linting，比传统的 null-ls/none-ls 更快更稳定。

### 格式化工具检测机制

配置会智能检测并优先使用项目本地的格式化工具：

#### Python 工具检测顺序
1. `.venv/bin/` - 项目 virtualenv
2. `venv/bin/` - 项目 virtualenv
3. `env/bin/` - 项目 virtualenv
4. 全局安装的工具

**支持的工具：** black, isort, ruff

#### JavaScript/TypeScript 工具检测顺序
1. `node_modules/.bin/` - 项目本地
2. 全局安装的工具

**支持的工具：** prettier

#### Ruby 工具
始终使用 `bundle exec` 调用项目 Gemfile 中的工具

**支持的工具：** rubocop

### 使用方法

**手动格式化：**
```vim
<leader>fc  " 格式化当前文件或选中范围（Visual 模式）
```

**自动格式化（可选）：**
编辑 `lua/lsp/conform.lua`，取消注释自动格式化配置即可启用保存时自动格式化。

### 优势
- ✅ **极快的格式化速度**（比 none-ls 快 2-3 倍）
- ✅ 不需要全局安装工具
- ✅ 每个项目可以使用不同版本
- ✅ 与项目依赖管理集成
- ✅ 团队成员环境一致
- ✅ 自动 fallback 到全局工具
- ✅ 支持范围格式化（Visual 模式）
- ✅ 更清晰的架构（格式化和 linting 分离）

## AI 代码补全配置

配置集成了 [Supermaven](https://supermaven.com/) 提供快速的 AI 代码补全功能。

### 设置步骤

1. **访问 Supermaven 网站并注册**
   - 访问 [supermaven.com](https://supermaven.com/)
   - 创建免费账号

2. **在 Neovim 中认证**

   首次启动 Neovim 后，使用以下命令开始认证：
   ```vim
   :SupermavenStart
   ```

   然后使用以下命令完成登录：
   ```vim
   :SupermavenLogin
   ```

   这会提供登录链接完成认证流程。

3. **使用补全**

   Supermaven 会自动在编辑器中提供代码建议：
   - 补全建议会自动出现在补全菜单中，标记为 `[AI]`
   - 按 `Tab` 选择下一项补全
   - 按 `Enter` 确认补全

### 功能特性

- ✅ 极快的补全速度（比其他工具快 2-3 倍）
- ✅ 支持多种编程语言
- ✅ 100 万 token 上下文窗口
- ✅ 高质量代码建议
- ✅ 与 LSP 补全无缝集成
- ✅ 在补全菜单中显示为 `[AI]` 来源

### 常用命令

```vim
:SupermavenStart        " 启动 Supermaven
:SupermavenStop         " 停止 Supermaven
:SupermavenRestart      " 重启 Supermaven
:SupermavenToggle       " 切换启用/禁用
:SupermavenStatus       " 查看状态
:SupermavenLogin        " 登录/认证
:SupermavenLogout       " 登出
```

## Mason 管理

查看和管理已安装的工具：

```vim
:Mason
```

Mason 会自动安装以下工具：
- lua_ls
- pyright
- ts_ls
- eslint
- html
- cssls
- jsonls

## 常用命令

```vim
:Lazy                    " 管理插件
:Mason                   " 管理 LSP 服务器和工具
:LspInfo                 " 查看当前缓冲区的 LSP 状态
:LspRestart              " 重启 LSP 服务器
:checkhealth             " 检查 Neovim 健康状态
:NvimTreeToggle          " 切换文件树

" Treesitter 相关
:TSInstallInfo           " 查看已安装的语言解析器
:TSUpdate                " 更新所有语言解析器
:TSInstall <language>    " 安装特定语言解析器
```

## 故障排除

### LSP 服务器未启动

1. 检查 LSP 状态：`:LspInfo`
2. 检查 Mason 安装：`:Mason`
3. 查看错误日志：`:messages`
4. 重启 LSP：`:LspRestart`

### 插件安装失败

```vim
:Lazy clean              " 清理未使用的插件
:Lazy sync               " 同步插件
```

然后重启 Neovim。

### Ruby LSP 不工作

确保在项目的 Gemfile 中添加了 ruby-lsp 和 rubocop，并运行了 `bundle install`。

### Python 格式化不工作

确保已安装格式化工具：
```bash
pip install black isort ruff
```

### Treesitter 语法高亮不工作

**症状：** 代码没有语法高亮或颜色单一

**解决方案：**

1. **检查 Treesitter 状态**
   ```vim
   :TSInstallInfo
   ```

2. **安装/更新语言解析器**
   ```vim
   :TSUpdate
   ```

3. **如果缺少 tree-sitter-cli**
   ```bash
   # macOS
   brew install tree-sitter

   # Ubuntu/Debian
   sudo apt install tree-sitter-cli
   # 或
   npm install -g tree-sitter-cli

   # Arch Linux
   sudo pacman -S tree-sitter
   ```

4. **重新编译解析器**
   ```vim
   :TSUpdate all
   ```

5. **检查健康状态**
   ```vim
   :checkhealth nvim-treesitter
   ```

6. **如果问题持续，清理并重装**
   ```bash
   # 退出 Neovim 后执行
   rm -rf ~/.local/share/nvim/lazy/nvim-treesitter
   ```
   然后重启 Neovim 并运行 `:Lazy sync`

### 编译错误或 C 编译器问题

**症状：** Treesitter 安装时报告编译错误

**解决方案：**

确保安装了 C 编译器：

**macOS:**
```bash
xcode-select --install
```

**Ubuntu/Debian:**
```bash
sudo apt install build-essential
```

**Arch Linux:**
```bash
sudo pacman -S base-devel
```

## 自定义

### 修改配置

- **基本选项**: 编辑 `lua/core/options.lua`
- **键位映射**: 编辑 `lua/core/keymaps.lua`
- **添加插件**: 编辑 `lua/plugins.lua`
- **LSP 设置**: 编辑 `lua/lsp/servers.lua`
- **格式化工具**: 编辑 `lua/lsp/conform.lua`
- **Linting 工具**: 编辑 `lua/lsp/lint.lua`

### 启用保存时自动格式化

编辑 `lua/lsp/conform.lua`，取消注释自动格式化配置即可启用保存时自动格式化。

## 参考资源

- [Neovim 官方文档](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Mason](https://github.com/williamboman/mason.nvim)
- [none-ls](https://github.com/nvimtools/none-ls.nvim)

## License

MIT
