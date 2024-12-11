return {
  {
    -- mason-lspconfig
    "williamboman/mason-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
    },
    config = function(opts)
      require('mason-lspconfig').setup(opts)
      require('mason-lspconfig').setup_handlers({
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,})
    end,
  },
}
