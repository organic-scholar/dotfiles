local highlight_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
  group = highlight_group,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client or not client:supports_method("textDocument/documentHighlight", args.buf) then return end

    local buffer_group = vim.api.nvim_create_augroup("LspDocumentHighlight:" .. args.buf, { clear = true })

    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      group = buffer_group,
      buffer = args.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
      group = buffer_group,
      buffer = args.buf,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = buffer_group,
      buffer = args.buf,
      once = true,
      callback = function() vim.lsp.buf.clear_references() end,
    })
  end,
})
