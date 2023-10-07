return {
  "dinhhuy258/git.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
  end
}
