return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biomejs", "prettierd", "prettier", "eslint_d", stop_after_first = true },
      typescript = { "biomejs", "prettierd", "prettier", "eslint_d", stop_after_first = true },
      javascriptreact = { "biomejs", "prettierd", "prettier", "eslint_d", stop_after_first = true },
      typescriptreact = { "biomejs", "prettierd", "prettier", "eslint_d", stop_after_first = true },
      css = { "prettierd", "prettier", "stylelint", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
