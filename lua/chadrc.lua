-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

local sep_style = 'default'

local default_sep_icons = {
  default = { left = "", right = "" },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local M = {}

M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "default",
    separator_style = sep_style,
    order = { "mode", "file", "git", "env", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      env = function()
        local env_name = vim.fn.system "echo $CONDA_DEFAULT_ENV"
        if env_name == "" then
          env_name = vim.fn.system("echo $VIRTUAL_ENV"):match "([^/]+)$"
        end
        env_name = env_name:gsub("\n", "") -- Remove newline
        if env_name and env_name ~= "" then
          return "%#St_env# " .. env_name .. " %#St_env_sep#" 
          -- env_name
        end
        return "No Env"
      end,
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}


M.plugins = {
  defualt_plugin_config_replace = {
    gitsigns = require "configs.gitsigns"
  }
}

M.mappings = require("mappings")
return M
