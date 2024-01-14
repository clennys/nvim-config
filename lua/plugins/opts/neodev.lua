return { "folke/neodev.nvim", config = function ()
-- You can override the default detection using the override function
-- EXAMPLE: If you want a certain directory to be configured differently, you can override its settings
require("neodev").setup({
  override = function(root_dir, library)
    if root_dir:find("/etc/nixos", 1, true) == 1 then
      library.enabled = true
      library.plugins = true
    end
  end,
})
end }

