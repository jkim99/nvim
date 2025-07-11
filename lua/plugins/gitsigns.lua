-- lua/plugins/gitsigns.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true,  -- show the signs in the sign column
      numhl      = false, -- highlight line number instead
      linehl     = false, -- highlight entire line
      word_diff  = false, -- highlight word diff
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",  -- eol, overlay, right_align
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]c", function() if vim.wo.diff then return "]c" end; gs.next_hunk() end, "Next Hunk")
        map("n", "[c", function() if vim.wo.diff then return "[c" end; gs.prev_hunk() end, "Prev Hunk")

        -- Actions
        map("n", "<leader>hb", function() gs.blame_line{full=true} end, "Blame Line")
        map("n", "<leader>hd", gs.diffthis, "Diff This")
        map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This (against HEAD)")

        -- Text object
      end,
    },
  }
}

