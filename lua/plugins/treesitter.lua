return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "javascript", "typescript", "html", "css", "json",
          "bash", "yaml", "markdown", "tsx"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
       }
      )
    end
  }
}

