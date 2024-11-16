{
  # TODO: Try to moving the most
  extraConfigLuaPost = ''
    -- show diagnostics on line hover
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        callback = function()
            for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                if vim.api.nvim_win_get_config(winid).zindex then
                    return
                end
            end
            vim.diagnostic.open_float({
                scope = "cursor",
                focusable = false,
                close_events = {
                    "CursorMoved",
                    "CursorMovedI",
                    "BufHidden",
                    "InsertCharPre",
                    "WinLeave",
                },
            })
        end
    })

    local signs = { Error = "💥", Warn = "🚧", Hint = "💡", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = true,
    })

    -- Custom functional keymaps
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
