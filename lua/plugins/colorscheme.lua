
return {
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        filter = "spectrum", -- options: classic | octagon | pro | machine | ristretto | spectrum
      })
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("monokai-pro") -- Load the theme
    end
  }
}

