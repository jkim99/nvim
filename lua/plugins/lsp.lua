return {
  -- LSP installer & registry
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
    -- require("mason-lspconfig").setup({
    --     ensure_installed = { "lua_ls", "ts_ls" } 
    -- })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

        -- Basic LSP on_attach setup
        local on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
            map("n", "K", vim.lsp.buf.hover, "Hover")
            map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
            map("n", "gr", vim.lsp.buf.references, "References")
            map("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, "Format File")
        end

        -- TypeScript/JavaScript LSP
        -- lspconfig.ts_ls.setup({
        --     root_dir = function(fname)
        --         local root = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
        --         return root
        --     end
        -- })
        --lspconfig.denols.setup({
        --    root_dir = function(fname)
        --        local root = lspconfig.util.root_pattern("deno.json")(fname)
        --        if is_node_project(root) then
        --            return nil
        --        end
        --        return root
        --    end
        --})
    end,
  },
}

