-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4
vim.cmd "set expandtab"

require "lazy_setup"
require "polish"

vim.o.autochdir = false

vim.opt.cmdheight = 3
vim.opt.guifont = "Kode Mono:h13"

local function neovide_toggle_fullscreen()
  if vim.g.neovide_fullscreen == 0 then
    vim.g.neovide_fullscreen = 1
    -- vim.opt.cmdheight = 5
  else
    vim.g.neovide_fullscreen = 0
    -- vim.opt.cmdheight = 3
  end
end

if vim.g.neovide == true then
  -- vim.g.neovide_window_blurred = false
  vim.g.neovide_transparency = 1.0
  vim.g.neovide_normal_opacity = 1.0
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_scale_factor = 0.8
  vim.keymap.set("n", "<F11>", neovide_toggle_fullscreen)
end

function math.Clamp(val, lower, upper)
  assert(val and lower and upper, "not very useful error message here")
  if lower > upper then
    lower, upper = upper, lower
  end -- swap if boundaries supplied the wrong way
  return math.max(lower, math.min(upper, val))
end

vim.keymap.set("n", "<F4>", ":ToggleTerm dir=%:p:h<CR>")

-- autocompile for .scss files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.scss" },
  callback = function()
    local fp = vim.fn.expand "%:.:h"
    local fn = vim.fn.expand "%:t:r"
    local cmd = string.format("sass --no-source-map %s\\%s.scss %s\\%s.css", fp, fn, fp, fn)
    os.execute(cmd)
  end,
})
