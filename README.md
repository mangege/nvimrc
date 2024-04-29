# README

## System

```
git clone git@github.com:mangege/nvimrc.git nvim

pacman -S ripgrep tree-sitter-cli
```


## LSP

使用 mason 安装 Lsp 服务端, 但不使用 mason-lspconfig.nvim 配置,因为与 nvim-cmp 不兼容,所以采用自己手动配置.

eruby 使用 efm lsp 来格式化,且在 efm 配置 htmlbeautifier .

`nvim --headless -c "MasonInstall efm html-lsp htmlbeautifier lua-language-server rubocop ruby-lsp typescript-language-server eslint-lsp json-lsp css-lsp" -c qall`
