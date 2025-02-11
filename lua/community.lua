-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  --{ import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.godot" },
  --{ import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  -- import/override with your plugins folder
}
