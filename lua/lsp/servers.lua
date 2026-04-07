-- LSP 服务器配置
local M = {}

-- 针对 Ruby, Python, JavaScript 优化的服务器配置
M.servers = {
  -- Ruby
  ruby_lsp = {
    cmd = { "bundle", "exec", "ruby-lsp" },
    settings = {
      rubyLsp = {
        formatting = true,
        diagnostics = true,
      },
    },
  },

  rubocop = {
    cmd = { "bundle", "exec", "rubocop", "--lsp" },
  },

  -- Python
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },

  -- JavaScript/TypeScript
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  eslint = {
    settings = {
      workingDirectory = { mode = "auto" },
      format = true,
    },
  },

  -- 其他常用语言服务器
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },

  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  html = {},
  cssls = {},
  jsonls = {},
}

-- Mason 应该自动安装的服务器列表
-- 注意：Ruby 工具 (rubocop, ruby_lsp) 不在此列表中
-- 它们应该通过项目的 Gemfile 管理，使用 bundle exec 调用
M.ensure_installed = {
  "lua_ls",
  "pyright",
  "ts_ls",
  "eslint",
  "html",
  "cssls",
  "jsonls",
  "gopls",
}

return M
