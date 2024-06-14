---@type LazySpec
return {
  {
    "MeanderingProgrammer/markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("render-markdown").setup {} end,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
      })
    end,
  },
}
