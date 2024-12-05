{
  #diagnostics = {
  #  virtual_text = true;
  #  update_in_insert = true;
  #};

  extraConfigLua = ''
    -- diagnostic signs
    local signs = { Error = "💥", Warn = "🚧", Hint = "💡", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
    end

    -- Show diagnostics on hover with debounce
    vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
            -- Debounce diagnostics to avoid performance issues
            vim.defer_fn(function()
                vim.diagnostic.open_float(nil, {
                    scope = "cursor",
                    focusable = false,
                    close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
                })
            end, 150) -- Delay by 150ms
        end,
    })

    -- toggle virtual_text & relativenumber
    vim.keymap.set("n", "<leader>sd", function()
        isLspDiagnosticsVisible = not isLspDiagnosticsVisible
        vim.diagnostic.config({
            virtual_text = isLspDiagnosticsVisible,
            underline = isLspDiagnosticsVisible
          })
    end)

    vim.keymap.set("n", "<leader>sn", function()
    	if vim.wo.relativenumber then
    		vim.wo.relativenumber = false
    	vim.wo.number = true
    	else
    		vim.wo.relativenumber = true
    		vim.wo.number = false
    	end
    end)
  '';
}
