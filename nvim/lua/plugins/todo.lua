return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- TODO Add those sweet Todo Keybinds!
  -- NOTE :To<C-d> should cover it for now!
  -- NOTE :TodoTelescope only recursively parses cwd!
  -- NOTE :TodoTelescope cwd=~/.config/nvim keywords=TODO,FIX
  -- FIX: dn! dunno why FIX looks so weird in line above
  opts = {
    keywords = {
      FIX = { icon = "", color = "#770b59", },
    },
  }
}
