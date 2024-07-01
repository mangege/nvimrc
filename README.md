# README

## Install

```
cd ~/.config
git clone git@github.com:mangege/nvimrc.git nvim

# pacman -S ripgrep tree-sitter-cli
# apt install -y ripgrep

nvim
```

## Nerd Font

1. Download a Nerd Font
2. Unzip and copy to ~/.fonts
3. Run the command `fc-cache -fv` to manually rebuild the font cache

## LSP

使用 mason 安装 Lsp 服务端, 但不使用 mason-lspconfig.nvim 配置,因为与 nvim-cmp 不兼容,所以采用自己手动配置.

rubocop 与 ruby-lsp 需要添加到 Gemfile 开发组里,主要还有 rubocop-rails 与 ruby-lsp-rails 通过 mason 安装无法集成.

`nvim --headless -c "MasonInstall pyright html-lsp lua-language-server typescript-language-server eslint-lsp json-lsp css-lsp" -c qall`

## Format

原 LSP 不支持格式化时,再使用 efm lsp 来格式化

eruby 使用 efm lsp 来格式化,且在 efm 配置 htmlbeautifier .

`nvim --headless -c "MasonInstall efm htmlbeautifier prettier black isort" -c qall`

## Ruby Gemfile

```rb
gem 'rubocop', require: false
gem 'rubocop-rails', require: false
gem 'ruby-lsp', require: false
gem 'ruby-lsp-rails', require: false
```

## LSP 选择参考:

- https://github.com/neoclide/coc.nvim/wiki/Language-servers
- https://github.com/mattn/efm-langserver
