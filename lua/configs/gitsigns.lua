dofile(vim.g.base46_cache .. "git")

local options = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },

  on_attach = function(bufnr)
    local gitsigns = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set

    -- map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
    -- map("n", "<leader>ph", gs.preview_hunk, opts "Preview Hunk")
    -- map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
    map("n", "<leader>hs", gitsigns.stage_hunk, opts "Stage Hunk")
    map("n", "<leader>hr", gitsigns.reset_hunk, opts "Reset Hunk")
    map("v", "<leader>hs", function()
      gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "Stage Hunk in Visual Mode")
    map("v", "<leader>hr", function()
      gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, opts "Reset Hunk in Visual Mode")
    map("n", "<leader>hS", gitsigns.stage_buffer, opts "Stage Buffer")
    map("n", "<leader>hu", gitsigns.undo_stage_hunk, opts "Undo Stage Hunk")
    map("n", "<leader>hR", gitsigns.reset_buffer, opts "Reset Buffer")
    map("n", "<leader>hp", gitsigns.preview_hunk, opts "Preview Hunk")
    map("n", "<leader>hb", function()
      gitsigns.blame_line { full = true }
    end, opts "Blame Line with Full Details")
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, opts "Toggle Current Line Blame")
    map("n", "<leader>hd", gitsigns.diffthis, opts "Diff This")
    map("n", "<leader>hD", function()
      gitsigns.diffthis "~"
    end, opts "Diff This with Previous")
    map("n", "<leader>td", gitsigns.toggle_deleted, opts "Toggle Deleted")
  end,
}

return options
