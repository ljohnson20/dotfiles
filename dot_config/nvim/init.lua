-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function set_caps_to_esc(active)
  local mapping = active
      and '[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]'
    or "[]"
  os.execute(string.format("hidutil property --set '{\"UserKeyMapping\":%s}' > /dev/null 2>&1", mapping))
end

-- Remap when entering Neovim or gaining focus
vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained" }, {
  callback = function()
    set_caps_to_esc(true)
  end,
})

-- Reset when leaving Neovim or losing focus
vim.api.nvim_create_autocmd({ "VimLeave", "FocusLost" }, {
  callback = function()
    set_caps_to_esc(false)
  end,
})
