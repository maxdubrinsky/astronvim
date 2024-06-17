---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      config = {
        golangci_lint_ls = {
          cmd = { "golangci-lint-langserver", "-debug" },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "golangci_lint_ls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "golangci_lint" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    ---@type
    opts = {
      formatters_by_ft = {
        go = { "goimports", "golangci_lint" },
      },
      formatters = {
        goimports = {
          inherit = true,
          -- prepend_args = { '-local "github.com/gretellabs/monogretel"' },
        },
        golangci_lint = {
          inherit = true,
          prepend_args = { "--allow-parallel-runners" },
        },
      },
    },
  },
}
