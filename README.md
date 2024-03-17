# README

## System

```
git clone git@github.com:mangege/nvimrc.git nvim

pacman -S ripgrep
```


## LSP

### Ruby

```
# Gemfile
group :development do
  gem 'ruby-lsp', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end
```

### Lua

```
pacman -S lua-language-server
```

### Python

```
pacman -S pyright
```

### Javascript & Typescript

```
pacman -S typescript-language-server
```

### Golang

```
pacman -S gopls
```
